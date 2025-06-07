import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:simple_svg/simple_svg.dart';

void main() {
  test('basic ellipse', () async {
    final svg = Svg(200, 100);

    final ellipseId = svg.defShape(Ellipse(100.0, 50.0));

    var defaultGroup = Group();

    var sstyle = Sstyle();
    sstyle.fill = '#7AA20D';
    var widget = Widget(ellipseId);
    widget.sstyle = sstyle;
    widget.at = (100, 50);

    defaultGroup.placeWidget(widget);
    svg.addDefaultGroup(defaultGroup);

    final file = File('showcase/shapes/ellipse/ellipse.svg');
    final ellipseSvgFile = await file.readAsString();

    expect(svg.out(), ellipseSvgFile);
  });
}
