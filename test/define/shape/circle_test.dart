import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:simple_svg/simple_svg.dart';

void main() {
  test('basic circle', () async {
    final svg = Svg(100, 100);

    final circleId = svg.defShape(Circle(50.0));

    var defaultGroup = Group();

    var sstyle = Sstyle();
    sstyle.fill = '#BBC42A';
    var widget = Widget(circleId);
    widget.sstyle = sstyle;
    widget.at = (50, 50);

    defaultGroup.placeWidget(widget);
    svg.addDefaultGroup(defaultGroup);

    final file = File('showcase/shapes/circle/circle.svg');
    final circleSvgFile = await file.readAsString();

    expect(svg.out(), circleSvgFile);
  });

  test('4 circles', () async {
    final svg = Svg(200, 200);

    final circleId = svg.defShape(Circle(50));

    var defaultGroup = Group();

    var redSstyle = Sstyle();
    redSstyle.fill = 'red';
    var redWidget = Widget(circleId);
    redWidget.sstyle = redSstyle;
    redWidget.at = (50, 50);
    defaultGroup.placeWidget(redWidget);

    var yellowSstyle = Sstyle();
    yellowSstyle.fill = 'yellow';
    var yellowWidget = Widget(circleId);
    yellowWidget.sstyle = yellowSstyle;
    yellowWidget.at = (150, 50);
    defaultGroup.placeWidget(yellowWidget);

    var blueSstyle = Sstyle();
    blueSstyle.fill = 'blue';
    var blueWidget = Widget(circleId);
    blueWidget.sstyle = blueSstyle;
    blueWidget.at = (50, 150);
    defaultGroup.placeWidget(blueWidget);

    var greenSstyle = Sstyle();
    greenSstyle.fill = 'green';
    var greenWidget = Widget(circleId);
    greenWidget.sstyle = greenSstyle;
    greenWidget.at = (150, 150);
    defaultGroup.placeWidget(greenWidget);

    svg.addDefaultGroup(defaultGroup);

    final file = File('showcase/shapes/circle/circle4.svg');
    final circleSvgFile = await file.readAsString();

    expect(svg.out(), circleSvgFile);
  });
}
