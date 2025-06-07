import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:simple_svg/simple_svg.dart';

void main() {
  test('basic empty svg out', () async {
    final svg = Svg(30.0, 20.0);
    final file = File('showcase/basic/empty.svg');
    final emptySvgFile = await file.readAsString();

    expect(svg.out(), emptySvgFile);
  });
}
