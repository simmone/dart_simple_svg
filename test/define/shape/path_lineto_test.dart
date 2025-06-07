import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:simple_svg/simple_svg.dart';

void main() {
  test('path lineto', () async {
    final svg = Svg(110, 160);

    var linePath = Path();
    linePath.movetoAbs((5, 5));
    linePath.linetoHor(100.0);
    linePath.linetoVer(100.0);
    linePath.linetoRel((-50.0, 50.0));
    linePath.linetoRel((-50, -50));
    linePath.close();
    final lineId = svg.defShape(linePath);

    var defaultGroup = Group();

    var lineSstyle = Sstyle();
    lineSstyle.strokeWidth = 5;
    lineSstyle.stroke = '#7AA20D';
    lineSstyle.strokeLineJoin = StrokeLineJoin.round;

    var lineWidget = Widget(lineId);
    lineWidget.sstyle = lineSstyle;
    defaultGroup.placeWidget(lineWidget);

    svg.addDefaultGroup(defaultGroup);

    final file = File('showcase/path/lineto.svg');
    final linetoSvgFile = await file.readAsString();

    expect(svg.out(), linetoSvgFile);
  });
}
