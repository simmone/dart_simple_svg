import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:simple_svg/simple_svg.dart';

void main() {
  test('linear gradient format', () async {
    final gradient = LinearGradient([
      (0.0, '#BBC42A', 1.0),
      (100.0, '#ED6E46', 1.0),
    ]);
    gradient.precision = 4;

    gradient.x1 = 0.0;
    gradient.y1 = 1.0;
    gradient.x2 = 2.0;
    gradient.y2 = 3.0;
    gradient.gradientUnits = GradientUnits.userSpaceOnUse;
    gradient.spreadMethod = SpreadMethod.repeat;

    final file = File('test/define/shape/gradient/linear_gradient_define.svg');
    final linearDefineFile = await file.readAsString();

    expect(gradient.format('s1'), linearDefineFile);
  });

  test('radial gradient format', () async {
    final gradient = RadialGradient([
      (0.0, '#BBC42A', 1.0),
      (100.0, '#ED6E46', 1.0),
    ]);
    gradient.precision = 4;

    gradient.cx = 0.0;
    gradient.cy = 1.0;
    gradient.fx = 2.0;
    gradient.fy = 3.0;
    gradient.r = 4.0;
    gradient.gradientUnits = GradientUnits.userSpaceOnUse;
    gradient.spreadMethod = SpreadMethod.repeat;

    final file = File('test/define/shape/gradient/radial_gradient_define.svg');
    final radialDefineFile = await file.readAsString();

    expect(gradient.format('s1'), radialDefineFile);
  });

  test('linear gradient', () async {
    final svg = Svg(100, 100);

    final rectId = svg.defShape(Rect(100, 100));

    final gradientId = svg.defShape(LinearGradient([
      (0, '#BBC42A', 1),
      (100, '#ED6E46', 1),
    ]));

    var rectSstyle = Sstyle();
    rectSstyle.fillGradient = gradientId;

    var defaultGroup = Group();

    var widget = Widget(rectId);
    widget.sstyle = rectSstyle;
    defaultGroup.placeWidget(widget);

    svg.addDefaultGroup(defaultGroup);

    final file = File('showcase/gradient/linear_gradient.svg');
    final gradientSvgFile = await file.readAsString();

    expect(svg.out(), gradientSvgFile);
  });

  test('radial gradient', () async {
    final svg = Svg(100, 100);

    final rectId = svg.defShape(Rect(100, 100));

    final gradientId = svg.defShape(RadialGradient([
      (0, '#BBC42A', 1),
      (100, '#ED6E46', 1),
    ]));

    var rectSstyle = Sstyle();
    rectSstyle.fillGradient = gradientId;

    var defaultGroup = Group();

    var widget = Widget(rectId);
    widget.sstyle = rectSstyle;
    defaultGroup.placeWidget(widget);

    svg.addDefaultGroup(defaultGroup);

    final file = File('showcase/gradient/radial_gradient.svg');
    final gradientSvgFile = await file.readAsString();

    expect(svg.out(), gradientSvgFile);
  });
}
