import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:simple_svg/simple_svg.dart';

void main() {
  test('path moveto abs', () async {
    final svg = Svg(30, 70);

    var movePath = Path();
    movePath.movetoAbs((20.0, 60.0));
    final moveId = svg.defShape(movePath);

    final circleId = svg.defShape(Circle(5));

    var defaultGroup = Group();

    var moveSstyle = Sstyle();
    moveSstyle.strokeWidth = 1;
    moveSstyle.stroke = '#7AA20D';
    var moveWidget = Widget(moveId);
    moveWidget.sstyle = moveSstyle;
    defaultGroup.placeWidget(moveWidget);

    var circleSstyle = Sstyle();
    circleSstyle.fill = 'red';
    var circleWidget = Widget(circleId);
    circleWidget.sstyle = circleSstyle;
    circleWidget.at = (20, 60);
    defaultGroup.placeWidget(circleWidget);

    svg.addDefaultGroup(defaultGroup);

    final file = File('showcase/path/moveto1.svg');
    final movetoSvgFile = await file.readAsString();

    expect(svg.out(), movetoSvgFile);
  });

  test('path moveto rel', () async {
    final svg = Svg(30, 70);

    var movePath = Path();
    movePath.movetoRel((20, 60));
    final moveId = svg.defShape(movePath);

    final circleId = svg.defShape(Circle(5));

    var defaultGroup = Group();

    var moveSstyle = Sstyle();
    moveSstyle.strokeWidth = 1;
    moveSstyle.stroke = '#7AA20D';
    var moveWidget = Widget(moveId);
    moveWidget.sstyle = moveSstyle;
    defaultGroup.placeWidget(moveWidget);

    var circleSstyle = Sstyle();
    circleSstyle.fill = 'red';
    var circleWidget = Widget(circleId);
    circleWidget.sstyle = circleSstyle;
    circleWidget.at = (20, 60);
    defaultGroup.placeWidget(circleWidget);

    svg.addDefaultGroup(defaultGroup);

    final file = File('showcase/path/moveto2.svg');
    final movetoSvgFile = await file.readAsString();

    expect(svg.out(), movetoSvgFile);
  });
}
