import 'package:simple_svg/src/define/shape.dart';
import 'package:simple_svg/src/define/precision.dart';
import 'package:simple_svg/src/tool.dart';

enum ArcDirection { leftBig, leftSmall, rightBig, rightSmall }

extension ArcDirectionExtension on ArcDirection {
  String get name {
    switch (this) {
      case ArcDirection.leftBig:
        return '1,0';
      case ArcDirection.leftSmall:
        return '0,0';
      case ArcDirection.rightBig:
        return '1,1';
      case ArcDirection.rightSmall:
        return '0,1';
    }
  }
}

abstract class PathAction with Precision {
  String format();
}

class PathArcAbs extends PathAction {
  final (num, num) point;
  final (num, num) radius;
  final ArcDirection section;

  PathArcAbs(this.point, this.radius, this.section);

  @override
  String format() {
    return 'A${Tool.round(radius.$1, precision!)},${Tool.round(radius.$2, precision!)} 0 ${section.name} ${Tool.round(point.$1, precision!)},${Tool.round(point.$2, precision!)}';
  }
}

class PathArcRel extends PathAction {
  final (num, num) point;
  final (num, num) radius;
  final ArcDirection section;

  PathArcRel(this.point, this.radius, this.section);

  @override
  String format() {
    return 'a${Tool.round(radius.$1, precision!)},${Tool.round(radius.$2, precision!)} 0 ${section.name} ${Tool.round(point.$1, precision!)},${Tool.round(point.$2, precision!)}';
  }
}

class PathMoveToAbs extends PathAction {
  final (num, num) point;

  PathMoveToAbs(this.point);

  @override
  String format() {
    return 'M${Tool.round(point.$1, precision!)},${Tool.round(point.$2, precision!)}';
  }
}

class PathMoveToRel extends PathAction {
  final (num, num) point;

  PathMoveToRel(this.point);

  @override
  String format() {
    return 'm${Tool.round(point.$1, precision!)},${Tool.round(point.$2, precision!)}';
  }
}

class PathLineToAbs extends PathAction {
  final (num, num) point;

  PathLineToAbs(this.point);

  @override
  String format() {
    return 'L${Tool.round(point.$1, precision!)},${Tool.round(point.$2, precision!)}';
  }
}

class PathLineToRel extends PathAction {
  final (num, num) point;

  PathLineToRel(this.point);

  @override
  String format() {
    return 'l${Tool.round(point.$1, precision!)},${Tool.round(point.$2, precision!)}';
  }
}

class PathLineToHor extends PathAction {
  final num length;

  PathLineToHor(this.length);

  @override
  String format() {
    return 'h${Tool.round(length, precision!)}';
  }
}

class PathLineToVer extends PathAction {
  final num length;

  PathLineToVer(this.length);

  @override
  String format() {
    return 'v${Tool.round(length, precision!)}';
  }
}

class PathCcurveAbs extends PathAction {
  final (num, num) point1;
  final (num, num) point2;
  final (num, num) point3;

  PathCcurveAbs(this.point1, this.point2, this.point3);

  @override
  String format() {
    return 'C${Tool.round(point1.$1, precision!)},${Tool.round(point1.$2, precision!)} ${Tool.round(point2.$1, precision!)},${Tool.round(point2.$2, precision!)} ${Tool.round(point3.$1, precision!)},${Tool.round(point3.$2, precision!)}';
  }
}

class PathCcurveRel extends PathAction {
  final (num, num) point1;
  final (num, num) point2;
  final (num, num) point3;

  PathCcurveRel(this.point1, this.point2, this.point3);

  @override
  String format() {
    return 'c${Tool.round(point1.$1, precision!)},${Tool.round(point1.$2, precision!)} ${Tool.round(point2.$1, precision!)},${Tool.round(point2.$2, precision!)} ${Tool.round(point3.$1, precision!)},${Tool.round(point3.$2, precision!)}';
  }
}

class PathQcurveAbs extends PathAction {
  final (num, num) point1;
  final (num, num) point2;

  PathQcurveAbs(this.point1, this.point2);

  @override
  String format() {
    return 'Q${Tool.round(point1.$1, precision!)},${Tool.round(point1.$2, precision!)} ${Tool.round(point2.$1, precision!)},${Tool.round(point2.$2, precision!)}';
  }
}

class PathQcurveRel extends PathAction {
  final (num, num) point1;
  final (num, num) point2;

  PathQcurveRel(this.point1, this.point2);

  @override
  String format() {
    return 'q${Tool.round(point1.$1, precision!)},${Tool.round(point1.$2, precision!)} ${Tool.round(point2.$1, precision!)},${Tool.round(point2.$2, precision!)}';
  }
}

class PathRaw extends PathAction {
  final String raw;

  PathRaw(this.raw);

  @override
  String format() {
    return raw;
  }
}

class PathClose extends PathAction {
  PathClose();

  @override
  String format() {
    return 'z';
  }
}

/// ![](https://raw.githubusercontent.com/simmone/dart_simple_svg/refs/heads/master/showcase/path/lineto.svg)
///
/// Path defined by path actions, abs suffix: absolute position, rel suffix: relative position.
///
/// Example1: lineto(linetoHor, linetoVer, linetoRel)
///
///```dart
///    var linePath = Path();
///    linePath.movetoAbs((5, 5));
///    linePath.linetoHor(100.0);
///    linePath.linetoVer(100.0);
///    linePath.linetoRel((-50.0, 50.0));
///    linePath.linetoRel((-50, -50));
///    linePath.close();
///    final lineId = svg.defShape(linePath);
///
///    var lineSstyle = Sstyle();
///    lineSstyle.strokeWidth = 5;
///    lineSstyle.stroke = '#7AA20D';
///    lineSstyle.strokeLineJoin = StrokeLineJoin.round;
///```
///
/// Example2: arc(arcAbs, arcRel)
///
/// ![](https://raw.githubusercontent.com/simmone/dart_simple_svg/refs/heads/master/showcase/path/arc.svg)
///
///```dart
///    var arc1Path = Path();
///    arc1Path.movetoAbs((130, 45));
///    arc1Path.arcAbs((170.0, 85.0), (80.0, 40.0), ArcDirection.leftBig);
///    final arc1Id = svg.defShape(arc1Path);
///
///    var arc2Path = Path();
///    arc2Path.movetoAbs((130, 45));
///    arc2Path.arcAbs((170, 85), (80, 40), ArcDirection.leftSmall);
///    final arc2Id = svg.defShape(arc2Path);
///
///    var arc3Path = Path();
///    arc3Path.movetoAbs((130, 45));
///    arc3Path.arcAbs((170, 85), (80, 40), ArcDirection.rightBig);
///    final arc3Id = svg.defShape(arc3Path);
///
///    var arc4Path = Path();
///    arc4Path.movetoAbs((130, 45));
///    arc4Path.arcAbs((170, 85), (80, 40), ArcDirection.rightSmall);
///    final arc4Id = svg.defShape(arc4Path);
///```
///
/// Example3: ccurve(ccurveAbs, ccurveRel)
///
/// ![](https://raw.githubusercontent.com/simmone/dart_simple_svg/refs/heads/master/showcase/path/ccurve1.svg)
///
///```dart
///    var ccurvePath = Path();
///    ccurvePath.movetoAbs((10.0, 60.0));
///    ccurvePath.ccurveAbs((30.0, 15.0), (80.0, 15.0), (100.0, 60.0));
///    ccurvePath.ccurveAbs((120, 105), (170, 105), (190, 60));
///    final ccurveId = svg.defShape(ccurvePath);
///```
///
/// Example4: qcurve(qcurveAbs, qcurveRel)
///
/// ![](https://raw.githubusercontent.com/simmone/dart_simple_svg/refs/heads/master/showcase/path/qcurve1.svg)
///
///```dart
///    var qcurvePath = Path();
///    qcurvePath.movetoAbs((10, 60));
///    qcurvePath.qcurveAbs((60.0, 10.0), (110.0, 60.0));
///    qcurvePath.qcurveAbs((160, 110), (210, 60.0));
///    final qcurveId = svg.defShape(qcurvePath);
///```
///
/// Example5: raw
///
/// ![](https://raw.githubusercontent.com/simmone/dart_simple_svg/refs/heads/master/showcase/path/raw_path.svg)
///
///```dart
///    var rawPath = Path();
///    rawPath.raw(
///      'M248.761,92c0,9.801-7.93,17.731-17.71,17.731c-0.319,0-0.617,0-0.935-0.021',
///    );
///    rawPath.raw(
///      'c-10.035,37.291-51.174,65.206-100.414,65.206 c-49.261,0-90.443-27.979-100.435-65.334',
///    );
///    rawPath.raw(
///      'c-0.765,0.106-1.531,0.149-2.317,0.149c-9.78,0-17.71-7.93-17.71-17.731',
///    );
///    rawPath.raw(
///      'c0-9.78,7.93-17.71,17.71-17.71c0.787,0,1.552,0.042,2.317,0.149',
///    );
///    rawPath.raw(
///      'C39.238,37.084,80.419,9.083,129.702,9.083c49.24,0,90.379,27.937,100.414,65.228h0.021',
///    );
///    rawPath.raw(
///      'c0.298-0.021,0.617-0.021,0.914-0.021C240.831,74.29,248.761,82.22,248.761,92z',
///    );
///    final rawId = svg.defShape(rawPath);
///```
class Path extends Shape {
  List<PathAction> actions = [];

  Path();

  void setAllActionPrecision(int precisionArg) {
    for (final action in actions) {
      action.precision = precisionArg;
    }
  }

  void arcAbs((num, num) point, (num, num) radius, ArcDirection section) {
    actions.add(PathArcAbs(point, radius, section));
  }

  void arcRel((num, num) point, (num, num) radius, ArcDirection section) {
    actions.add(PathArcRel(point, radius, section));
  }

  void movetoAbs((num, num) point) {
    actions.add(PathMoveToAbs(point));
  }

  void movetoRel((num, num) point) {
    actions.add(PathMoveToRel(point));
  }

  void linetoAbs((num, num) point) {
    actions.add(PathLineToAbs(point));
  }

  void linetoRel((num, num) point) {
    actions.add(PathLineToRel(point));
  }

  void linetoHor(num length) {
    actions.add(PathLineToHor(length));
  }

  void linetoVer(num length) {
    actions.add(PathLineToVer(length));
  }

  void ccurveAbs((num, num) point1, (num, num) point2, (num, num) point3) {
    actions.add(PathCcurveAbs(point1, point2, point3));
  }

  void ccurveRel((num, num) point1, (num, num) point2, (num, num) point3) {
    actions.add(PathCcurveRel(point1, point2, point3));
  }

  void qcurveAbs((num, num) point1, (num, num) point2) {
    actions.add(PathQcurveAbs(point1, point2));
  }

  void qcurveRel((num, num) point1, (num, num) point2) {
    actions.add(PathQcurveRel(point1, point2));
  }

  void raw(String rawStr) {
    actions.add(PathRaw(rawStr));
  }

  void close() {
    actions.add(PathClose());
  }

  @override
  String unique() {
    return "Path/defs/${format('')}";
  }

  @override
  String format(String shapeId) {
    final buffer = StringBuffer();

    buffer.write('    <path id="$shapeId"\n');
    buffer.write('          d="\n');
    for (final action in actions) {
      buffer.write('             ${action.format()}\n');
    }
    buffer.write('            "/>\n');

    return buffer.toString();
  }
}
