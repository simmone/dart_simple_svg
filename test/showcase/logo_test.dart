import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:simple_svg/simple_svg.dart';

void main() {
  test('logo', () async {
    final svg = Svg(519.875, 519.824);

    final backgroundCircleId = svg.defShape(Circle(253.093));

    var bluePiecePath = Path();
    bluePiecePath.raw(
        'M455.398,412.197c33.792-43.021,53.946-97.262,53.946-156.211'
        'c0-139.779-113.313-253.093-253.093-253.093c-30.406,0-59.558,5.367-86.566,15.197'
        'C272.435,71.989,408.349,247.839,455.398,412.197z');
    final bluePiecePathId = svg.defShape(bluePiecePath);

    var leftRedPiecePath = Path();
    leftRedPiecePath.raw(
        'M220.003,164.337c-39.481-42.533-83.695-76.312-130.523-98.715'
        'C36.573,112.011,3.159,180.092,3.159,255.986c0,63.814,23.626,122.104,62.597,166.623'
        'C100.111,319.392,164.697,219.907,220.003,164.337z');
    final leftRedPiecePathId = svg.defShape(leftRedPiecePath);

    var bottomRedPiecePath = Path();
    bottomRedPiecePath.raw(
        'M266.638,221.727c-54.792,59.051-109.392,162.422-129.152,257.794'
        'c35.419,18.857,75.84,29.559,118.766,29.559c44.132,0,85.618-11.306,121.74-31.163'
        'C357.171,381.712,317.868,293.604,266.638,221.727z');
    final bottomRedPiecePathId = svg.defShape(bottomRedPiecePath);

    var defaultGroup = Group();

    var backgroundCircleSstyle = Sstyle();
    backgroundCircleSstyle.fill = 'white';
    var backgroundCircleWidget = Widget(backgroundCircleId);
    backgroundCircleWidget.sstyle = backgroundCircleSstyle;
    backgroundCircleWidget.at = (256.252, 255.986);
    defaultGroup.placeWidget(backgroundCircleWidget);

    var bluePieceSstyle = Sstyle();
    bluePieceSstyle.fill = '#3E5BA9';
    var bluePieceWidget = Widget(bluePiecePathId);
    bluePieceWidget.sstyle = bluePieceSstyle;
    defaultGroup.placeWidget(bluePieceWidget);

    var leftRedPieceSstyle = Sstyle();
    leftRedPieceSstyle.fill = '#9F1D20';
    var leftRedPieceWidget = Widget(leftRedPiecePathId);
    leftRedPieceWidget.sstyle = leftRedPieceSstyle;
    defaultGroup.placeWidget(leftRedPieceWidget);

    var bottomRedPieceSstyle = Sstyle();
    bottomRedPieceSstyle.fill = '#9F1D20';
    var bottomRedPieceWidget = Widget(bottomRedPiecePathId);
    bottomRedPieceWidget.sstyle = bottomRedPieceSstyle;
    defaultGroup.placeWidget(bottomRedPieceWidget);

    svg.addDefaultGroup(defaultGroup);

    final file = File('showcase/example/logo.svg');
    final rawSvgFile = await file.readAsString();

    expect(svg.out(), rawSvgFile);
  });
}
