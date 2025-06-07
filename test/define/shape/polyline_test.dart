import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:simple_svg/simple_svg.dart';

void main() {
  test('basic polyline', () async {
    final svg = Svg(130, 130);

    final polylineId = svg.defShape(Polyline([
      (0, 0),
      (40, 0),
      (40, 40),
      (80, 40),
      (80, 80),
      (120, 80),
      (120, 120),
    ]));

    var defaultGroup = Group();

    var sstyle = Sstyle();
    sstyle.fill = 'blue';
    sstyle.stroke = '#BBC42A';
    sstyle.strokeWidth = 5;
    var widget = Widget(polylineId);
    widget.sstyle = sstyle;
    widget.at = (5, 5);

    defaultGroup.placeWidget(widget);
    svg.addDefaultGroup(defaultGroup);

    final file = File('showcase/shapes/polyline/polyline.svg');
    final polylineSvgFile = await file.readAsString();

    expect(svg.out(), polylineSvgFile);
  });
}
