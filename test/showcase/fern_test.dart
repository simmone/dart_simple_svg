import 'dart:io';
import 'dart:math';
import 'dart:collection';
import 'package:complex/complex.dart';

import 'package:flutter_test/flutter_test.dart';
import 'package:simple_svg/simple_svg.dart';

const canvasWidth = 600;
const canvasHeight = 600;
const startPoint = (300, 50);
const startLength = 120;
const startDeg = 100;
const startWidth = 3;
const stepWidth = 0.86;
const color = '#5a5';
const minLength = 0.5;
const centralReduction = 0.75;
const lateralReduction = 0.35;
const lateralDeg = 80;
const bend = 5;

(num, num) getEndPoint((num, num) startPoint, num length, num deg) {
  final end = Complex.polar(length.toDouble(), pi * 2 * deg / 360);

  return (startPoint.$1 + end.real, startPoint.$2 + end.imaginary);
}

void recursivePoints((num, num) loopStartPoint, num length, num deg, num width,
    List<(String, (num, num), (num, num))> lines) {
  if ((centralReduction * length) >= minLength) {
    final loopEndPoint = getEndPoint(loopStartPoint, length, deg);

    final trunctedWidth = '$width';

    lines.add((
      trunctedWidth,
      (loopStartPoint.$1, canvasHeight - loopStartPoint.$2),
      (loopEndPoint.$1, canvasHeight - loopEndPoint.$2)
    ));

    // central branch
    recursivePoints(loopEndPoint, length * centralReduction, deg - bend,
        width * stepWidth, lines);

    // left branch
    recursivePoints(loopEndPoint, length * lateralReduction,
        deg + lateralDeg - bend, width * stepWidth, lines);

    // right branch
    recursivePoints(loopEndPoint, length * lateralReduction,
        deg - lateralDeg - bend, width * stepWidth, lines);
  }
}

void main() {
  test('make poloar test', () async {
    expect(Complex.polar(10, pi * 0.5), Complex(6.123233995736766e-16, 10.0));

    expect(Complex.polar(10, pi * 0.25),
        Complex(7.0710678118654755, 7.071067811865475));
  });

  test('fern recursivePoints', () async {
    var lines = <(String, (num, num), (num, num))>[];

    recursivePoints(startPoint, startLength, startDeg, startWidth, lines);

    expect(lines.length, 4939);
  });

  test('fern test', () async {
    final svg = Svg(canvasWidth, canvasHeight);

    var defaultGroup = Group();

    var lines = <(String, (num, num), (num, num))>[];

    recursivePoints(startPoint, startLength, startDeg, startWidth, lines);

    Map<String, List<((num, num), (num, num))>> widthGroupMap = HashMap();

    for (final line in lines) {
      if (widthGroupMap.containsKey(line.$1)) {
        var widthLines = widthGroupMap[line.$1];

        widthLines?.add((line.$2, line.$3));
      } else {
        var widthLines = <((num, num), (num, num))>[];

        widthLines.add((line.$2, line.$3));

        widthGroupMap[line.$1] = widthLines;
      }
    }

    var sortedWidthList = List.from(widthGroupMap.keys);
    sortedWidthList.sort((a, b) => num.parse(b).compareTo(num.parse(a)));

    for (final width in sortedWidthList) {
      var widthGroup = Group();

      final lines = widthGroupMap[width] ?? [];

      for (final line in lines) {
        final lineId = svg.defShape(Line(line.$1, line.$2));

        var widget = Widget(lineId);
        widthGroup.placeWidget(widget);
      }

      var sstyle = Sstyle();
      sstyle.stroke = color;
      sstyle.strokeWidth = num.parse(width);

      final widthGroupId = svg.addGroup(widthGroup);
      final widthWidget = Widget(widthGroupId);
      widthWidget.sstyle = sstyle;

      defaultGroup.placeWidget(widthWidget);
    }

    svg.addDefaultGroup(defaultGroup);

    final file = File('showcase/example/fern.svg');
    final fernSvgFile = await file.readAsString();
    
    expect(svg.out(), fernSvgFile);
  });
}
