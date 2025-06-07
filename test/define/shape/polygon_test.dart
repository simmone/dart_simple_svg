import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:simple_svg/simple_svg.dart';

void main() {
  test('basic polygon', () async {
    final svg = Svg(110, 110);

    final polygonId = svg.defShape(Polygon([
      (0, 25),
      (25, 0),
      (75, 0),
      (100, 25),
      (100, 75),
      (75, 100),
      (25, 100),
      (0, 75),
    ]));

    var defaultGroup = Group();

    var sstyle = Sstyle();
    sstyle.fill = '#ED6E46';
    sstyle.stroke = '#765373';
    sstyle.strokeWidth = 5;
    var widget = Widget(polygonId);
    widget.sstyle = sstyle;
    widget.at = (5, 5);

    defaultGroup.placeWidget(widget);
    svg.addDefaultGroup(defaultGroup);

    final file = File('showcase/shapes/polygon/polygon.svg');
    final polygonSvgFile = await file.readAsString();

    expect(svg.out(), polygonSvgFile);
  });
}
