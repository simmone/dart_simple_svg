import 'dart:convert';

import 'package:simple_svg/tool.dart';

import 'package:simple_svg/define/shape/path.dart';

export 'package:simple_svg/define/shape/rect.dart' show Rect;
export 'package:simple_svg/define/shape/circle.dart' show Circle;
export 'package:simple_svg/define/shape/ellipse.dart' show Ellipse;
export 'package:simple_svg/define/shape/line.dart' show Line;
export 'package:simple_svg/define/shape/polygon.dart' show Polygon;
export 'package:simple_svg/define/shape/polyline.dart' show Polyline;
export 'package:simple_svg/define/shape/filter.dart' show Filter;
export 'package:simple_svg/define/shape/path.dart' show Path, ArcDirection;
export 'package:simple_svg/define/shape/text.dart'
    show
        Text,
        TextKerning,
        TextSpace,
        TextDecoration,
        TextKerningType,
        TextSpaceType;
export 'package:simple_svg/define/shape/arrow.dart' show Arrow;
export 'package:simple_svg/define/shape/gradient.dart'
    show LinearGradient, RadialGradient, SpreadMethod, GradientUnits;
export 'package:simple_svg/define/widget.dart' show Widget;
export 'package:simple_svg/define/group.dart' show Group;
export 'package:simple_svg/define/sstyle.dart'
    show Sstyle, StrokeLineJoin, FillRule, StrokeLineCap;
export 'package:simple_svg/define/shape/marker.dart' show Marker, MarkerType;
import 'package:simple_svg/define/shape.dart';
import 'package:simple_svg/define/shape/rect.dart';
import 'package:simple_svg/define/widget.dart';
import 'package:simple_svg/define/sstyle.dart';
import 'package:simple_svg/define/group.dart';

import '../assets/constants.dart' as constants;

/// Svg a library to generate svg file easily.
class Svg {
  final num width;
  final num height;
  String? background;
  int precision;
  (num, num, num, num)? viewBox;
  int shapeIdCount = 0;
  int groupIdCount = 1;
  Map<String, String> uniqueToIdMap = {};
  Map<String, Shape> idToShapeMap = {};
  Map<String, Group> groupDefineMap = {};
  List<(String, (num, num))> groupShowList = [];
  final JsonEncoder jason = JsonEncoder();

  Svg(this.width, this.height, [this.precision = 4]);

  String defShape(Shape shape) {
    shape.precision = precision;

    if (shape is Path) {
      shape.setAllActionPrecision(precision);
    }

    if (uniqueToIdMap.containsKey(shape.unique())) {
      return uniqueToIdMap[shape.unique()]!;
    } else {
      shapeIdCount += 1;
      String shapeId = 's$shapeIdCount';
      uniqueToIdMap[shape.unique()] = shapeId;
      idToShapeMap[shapeId] = shape;
      return shapeId;
    }
  }

  String addNameGroup(String groupId, Group group) {
    groupDefineMap[groupId] = group;

    for (final widget in group.widgetList) {
      widget.precision = precision;

      if (widget.sstyle != null) {
        widget.sstyle!.precision = precision;
      }
    }

    return groupId;
  }

  String addGroup(Group group) {
    groupIdCount += 1;
    var groupId = 'g$groupIdCount';
    addNameGroup(groupId, group);
    return groupId;
  }

  String addDefaultGroup(Group group) {
    var groupId = addNameGroup(constants.defaultGroupId, group);
    return groupId;
  }

  void setBackground(String backgroundColor) {
    background = backgroundColor;

    final rectId = defShape(Rect(width, height));

    var sstyle = Sstyle();
    sstyle.fill = background;
    var widget = Widget(rectId);
    widget.sstyle = sstyle;

    var backgroundGroup = Group();
    backgroundGroup.placeWidget(widget);

    addNameGroup(constants.backgroundGroupId, backgroundGroup);
  }

  void setViewBox(num minX, num minY, num width, num height) {
    viewBox = (minX, minY, width, height);
  }

  String flushData() {
    final outBuffer = StringBuffer();

    if (idToShapeMap.isNotEmpty) {
      outBuffer.write("  <defs>\n");
      var sortedKeys = List.from(idToShapeMap.keys);
      sortedKeys.sort(
          (a, b) => int.parse(a.substring(1)) - int.parse(b.substring(1)));
      for (final shapeId in sortedKeys) {
        var shape = idToShapeMap[shapeId];

        outBuffer.write(shape!.format(shapeId));
      }
      outBuffer.write("  </defs>\n");
    }

    final noDefaultGroupIds = groupDefineMap.keys
        .where((groupId) => groupId != constants.defaultGroupId);

    for (final groupId in noDefaultGroupIds) {
      outBuffer.write('\n');
      outBuffer.write('  <symbol id="$groupId">\n');
      outBuffer.write(showGroupWidgets(groupId, "    "));
      outBuffer.write('  </symbol>\n');
    }

    final groupShows =
        groupShowList.where((rec) => rec.$1 != constants.defaultGroupId);

    if (groupShows.isNotEmpty) {
      outBuffer.write('\n');
    }

    for (final groupShow in groupShows) {
      final groupId = groupShow.$1;
      final groupPos = groupShow.$2;

      outBuffer.write('  <use xlink:href="#$groupId" ');
      final groupPosStr = (
        Tool.round(groupPos.$1, precision),
        Tool.round(groupPos.$2, precision)
      );
      if (groupPosStr != ('0', '0')) {
        outBuffer.write('x="${groupPosStr.$1}" y="${groupPosStr.$2}" ');
      }
      outBuffer.write('/>\n');
    }

    var defaultGroup = groupDefineMap[constants.defaultGroupId];

    if (defaultGroup != null) {
      if (defaultGroup.widgetList.isNotEmpty) {
        outBuffer.write('\n');
        outBuffer.write(showGroupWidgets(constants.defaultGroupId, '  '));
      }
    }

    return outBuffer.toString();
  }

  String showGroupWidgets(String groupId, String prefix) {
    var group = groupDefineMap[groupId];

    var groupBuffer = StringBuffer();

    if (group != null) {
      for (final widget in group.widgetList) {
        groupBuffer.write(prefix);
        groupBuffer.write(widget.format());
        groupBuffer.write('\n');
      }
    }

    return groupBuffer.toString();
  }

  String out() {
    final outBuffer = StringBuffer();

    outBuffer.write('<svg\n');
    outBuffer.write('    version="1.1"\n');
    outBuffer.write('    xmlns="http://www.w3.org/2000/svg"\n');
    outBuffer.write('    xmlns:xlink="http://www.w3.org/1999/xlink"\n');
    outBuffer.write(
        '    width="${Tool.round(width, precision)}" height="${Tool.round(height, precision)}"\n');

    if (viewBox != null) {
      outBuffer.write(
          '    viewBox="${Tool.round(viewBox!.$1, precision)} ${Tool.round(viewBox!.$2, precision)} ${Tool.round(viewBox!.$3, precision)} ${Tool.round(viewBox!.$4, precision)}"\n');
    }

    outBuffer.write('    >\n');

    if (background != null) {
      groupShowList.add((constants.backgroundGroupId, (0, 0)));
    }

    var defaultGroup = groupDefineMap[constants.defaultGroupId];

    if (defaultGroup != null) {
      if (defaultGroup.widgetList.isNotEmpty) {
        groupShowList.add((constants.defaultGroupId, (0, 0)));
      }
    }

    outBuffer.write(flushData());

    outBuffer.write('</svg>\n');

    return outBuffer.toString();
  }
}
