import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:simple_svg/simple_svg.dart';

void main() {
  test('recursive circles', () async {
    final svg = Svg(400, 400);

    var topGroup = Group();

    recursiveLoop(loopX, loopY, loopRadius) {
      if (loopRadius > 6) {
        final circleId = svg.defShape(Circle(loopRadius));

        final widget = Widget(circleId);
        widget.at = (loopX, loopY);

        topGroup.placeWidget(widget);

        recursiveLoop(loopX + loopRadius, loopY, loopRadius / 2);
        recursiveLoop(loopX - loopRadius, loopY, loopRadius / 2);
        recursiveLoop(loopX, loopY + loopRadius, loopRadius / 2);
        recursiveLoop(loopX, loopY - loopRadius, loopRadius / 2);
      } else {
        return;
      }
    }

    recursiveLoop(200, 200, 100);

    final topGroupId = svg.addGroup(topGroup);

    var sstyle = Sstyle();
    sstyle.stroke = 'red';
    sstyle.strokeWidth = 1;

    var defaultGroup = Group();

    var groupWidget = Widget(topGroupId);
    groupWidget.sstyle = sstyle;

    defaultGroup.placeWidget(groupWidget);
    svg.addDefaultGroup(defaultGroup);

    final file = File('showcase/example/recursive.svg');
    final rectSvgFile = await file.readAsString();

    expect(svg.out(), rectSvgFile);
  });
}
