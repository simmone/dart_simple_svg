import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:simple_svg/simple_svg.dart';

void main() {
  test('basic line', () async {
    final svg = Svg(110, 110);

    final lineId = svg.defShape(Line((0.0, 0.0), (100.0, 100.0)));

    var defaultGroup = Group();

    var sstyle = Sstyle();
    sstyle.stroke = '#765373';
    sstyle.strokeWidth = 10;
    var widget = Widget(lineId);
    widget.sstyle = sstyle;
    widget.at = (5, 5);

    defaultGroup.placeWidget(widget);
    svg.addDefaultGroup(defaultGroup);

    final file = File('showcase/shapes/line/line.svg');
    final lineSvgFile = await file.readAsString();

    expect(svg.out(), lineSvgFile);
  });
}
