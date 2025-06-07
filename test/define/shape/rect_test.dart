import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:simple_svg/simple_svg.dart';

void main() {
  test('rect', () {
    final rect = Rect(30.0, 20.0);
    expect(rect.width, 30.0);
    expect(rect.height, 20.0);
    expect(rect.radiusX, null);
    expect(rect.radiusY, null);
  });

  test('rect_optional1', () {
    final rect = Rect(30.0, 20.0, 10.0);
    expect(rect.width, 30.0);
    expect(rect.height, 20.0);
    expect(rect.radiusX, 10.0);
    expect(rect.radiusY, null);
  });

  test('rect_optional2', () {
    final rect = Rect(30.0, 20.0, 10.0, 5.0);
    expect(rect.width, 30.0);
    expect(rect.height, 20.0);
    expect(rect.radiusX, 10.0);
    expect(rect.radiusY, 5.0);
  });

  test('format1', () {
    final rect = Rect(30, 20);
    rect.precision = 4;

    expect(
        rect.format('1'), "    <rect id=\"1\" width=\"30\" height=\"20\" />\n");
  });

  test('format2', () {
    final rect = Rect(30, 20, 10, 5.0);
    rect.precision = 4;

    expect(rect.format('1'),
        "    <rect id=\"1\" width=\"30\" height=\"20\" rx=\"10\" ry=\"5\" />\n");
  });

  test('basic rect svg out', () async {
    final svg = Svg(100, 100);

    final rectId = svg.defShape(Rect(100, 100));

    var defaultGroup = Group();

    var sstyle = Sstyle();
    sstyle.fill = '#BBC42A';
    var widget = Widget(rectId);
    widget.sstyle = sstyle;

    defaultGroup.placeWidget(widget);
    svg.addDefaultGroup(defaultGroup);

    final file = File('showcase/shapes/rect/rect.svg');
    final rectSvgFile = await file.readAsString();

    expect(svg.out(), rectSvgFile);
  });

  test('rect y', () async {
    final svg = Svg(100, 100);

    final rectId = svg.defShape(Rect(100, 100));

    var defaultGroup = Group();

    var sstyle = Sstyle();
    sstyle.fill = '#BBC42A';
    var widget = Widget(rectId);
    widget.sstyle = sstyle;
    widget.at = (50, 50);

    defaultGroup.placeWidget(widget);
    svg.addDefaultGroup(defaultGroup);

    final file = File('showcase/shapes/rect/rect_y.svg');
    final rectSvgFile = await file.readAsString();

    expect(svg.out(), rectSvgFile);
  });

  test('rect radius', () async {
    final svg = Svg(100.0, 100.0);

    var rect = Rect(100.0, 100.0);
    rect.radiusX = 5.0;
    rect.radiusY = 10.0;
    final rectId = svg.defShape(rect);

    var defaultGroup = Group();

    var sstyle = Sstyle();
    sstyle.fill = '#BBC42A';
    var widget = Widget(rectId);
    widget.sstyle = sstyle;

    defaultGroup.placeWidget(widget);
    svg.addDefaultGroup(defaultGroup);

    final file = File('showcase/shapes/rect/rect_radius.svg');
    final rectSvgFile = await file.readAsString();

    expect(svg.out(), rectSvgFile);
  });

  test('multiple rect', () async {
    final svg = Svg(150, 150);

    final blueRect = svg.defShape(Rect(150, 150));
    final greenRect = svg.defShape(Rect(100, 100));
    final redRect = svg.defShape(Rect(50, 50));

    var defaultGroup = Group();

    var blueSstyle = Sstyle();
    blueSstyle.fill = 'blue';

    var greenSstyle = Sstyle();
    greenSstyle.fill = 'green';

    var redSstyle = Sstyle();
    redSstyle.fill = 'red';

    var blueWidget = Widget(blueRect);
    blueWidget.sstyle = blueSstyle;

    var greenWidget = Widget(greenRect);
    greenWidget.sstyle = greenSstyle;
    greenWidget.at = (25, 25);

    var redWidget = Widget(redRect);
    redWidget.sstyle = redSstyle;
    redWidget.at = (50, 50);

    defaultGroup.placeWidget(blueWidget);
    defaultGroup.placeWidget(greenWidget);
    defaultGroup.placeWidget(redWidget);

    svg.addDefaultGroup(defaultGroup);

    final file = File('showcase/shapes/rect/m_rect.svg');
    final rectSvgFile = await file.readAsString();

    expect(svg.out(), rectSvgFile);
  });

  test('rect reuse', () async {
    final svg = Svg(190, 190);

    final blueRect = svg.defShape(Rect(50, 50));

    var defaultGroup = Group();

    var blueSstyle = Sstyle();
    blueSstyle.fill = 'blue';

    var blueWidget1 = Widget(blueRect);
    blueWidget1.sstyle = blueSstyle;
    blueWidget1.at = (10, 10);

    var blueWidget2 = Widget(blueRect);
    blueWidget2.sstyle = blueSstyle;
    blueWidget2.at = (70, 70);

    var blueWidget3 = Widget(blueRect);
    blueWidget3.sstyle = blueSstyle;
    blueWidget3.at = (130, 130);

    defaultGroup.placeWidget(blueWidget1);
    defaultGroup.placeWidget(blueWidget2);
    defaultGroup.placeWidget(blueWidget3);

    svg.addDefaultGroup(defaultGroup);

    final file = File('showcase/shapes/rect/rect_reuse.svg');
    final rectSvgFile = await file.readAsString();

    expect(svg.out(), rectSvgFile);
  });
}
