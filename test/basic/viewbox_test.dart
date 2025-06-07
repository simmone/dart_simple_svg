import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:simple_svg/simple_svg.dart';

void main() {
  test('basic background svg out', () async {
    final svg = Svg(100, 100);
    svg.setViewBox(50.0, 0.0, 100.0, 100.0);

    var defaultGroup = Group();

    final rectId = svg.defShape(Rect(100, 100));

    var sstyle = Sstyle();
    sstyle.fill = '#BBC42A';
    var widget = Widget(rectId);
    widget.sstyle = sstyle;

    defaultGroup.placeWidget(widget);
    svg.addDefaultGroup(defaultGroup);

    final file = File('showcase/basic/viewBox.svg');
    final rectSvgFile = await file.readAsString();

    expect(svg.out(), rectSvgFile);
  });
}
