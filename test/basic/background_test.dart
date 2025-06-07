import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:simple_svg/simple_svg.dart';

void main() {
  test('basic background svg out', () async {
    final svg = Svg(100, 100);
    svg.setBackground('#BBC42A');

    final file = File('showcase/basic/background.svg');
    final rectSvgFile = await file.readAsString();

    expect(svg.out(), rectSvgFile);
  });
}
