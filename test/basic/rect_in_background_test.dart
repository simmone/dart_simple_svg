import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:simple_svg/simple_svg.dart';

void main() {
  test('basic rect svg out', () async {
    final svg = Svg(100, 100);
    svg.setBackground('#BBC42A');

    final rectId = svg.defShape(Rect(50, 50));

    var defaultGroup = Group();
    var widget = Widget(rectId);
    var sstyle = Sstyle();
    sstyle.fill = '#FFFFFF';
    widget.sstyle = sstyle;
    widget.at = (25, 25);
    defaultGroup.placeWidget(widget);

    svg.addDefaultGroup(defaultGroup);

    final file = File('showcase/basic/rect_in_background.svg');
    final rectSvgFile = await file.readAsString();

    expect(svg.out(), rectSvgFile);
  });
}
