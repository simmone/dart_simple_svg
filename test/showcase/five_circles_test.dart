import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:simple_svg/simple_svg.dart';

void main() {
  test('five circles', () async {
    final svg = Svg(500, 300);

    var defaultGroup = Group();

    final circleId = svg.defShape(Circle(60));

    final filterId = svg.defShape(Filter());

    var circle1Sstyle = Sstyle();
    circle1Sstyle.stroke = 'rgb(11, 112, 191)';
    circle1Sstyle.strokeWidth = 12;
    final circle1Widget = Widget(circleId);
    circle1Widget.sstyle = circle1Sstyle;
    circle1Widget.at = (120, 120);
    circle1Widget.filterId = filterId;
    defaultGroup.placeWidget(circle1Widget);

    var circle2Sstyle = Sstyle();
    circle2Sstyle.stroke = 'rgb(240, 183, 0)';
    circle2Sstyle.strokeWidth = 12;
    final circle2Widget = Widget(circleId);
    circle2Widget.sstyle = circle2Sstyle;
    circle2Widget.at = (180, 180);
    circle2Widget.filterId = filterId;
    defaultGroup.placeWidget(circle2Widget);

    var circle3Sstyle = Sstyle();
    circle3Sstyle.stroke = 'rgb(0, 0, 0)';
    circle3Sstyle.strokeWidth = 12;
    final circle3Widget = Widget(circleId);
    circle3Widget.sstyle = circle3Sstyle;
    circle3Widget.at = (260, 120);
    circle3Widget.filterId = filterId;
    defaultGroup.placeWidget(circle3Widget);

    var circle4Sstyle = Sstyle();
    circle4Sstyle.stroke = 'rgb(13, 146, 38)';
    circle4Sstyle.strokeWidth = 12;
    final circle4Widget = Widget(circleId);
    circle4Widget.sstyle = circle4Sstyle;
    circle4Widget.at = (320, 180);
    circle4Widget.filterId = filterId;
    defaultGroup.placeWidget(circle4Widget);

    var circle5Sstyle = Sstyle();
    circle5Sstyle.stroke = 'rgb(214, 0, 23)';
    circle5Sstyle.strokeWidth = 12;
    final circle5Widget = Widget(circleId);
    circle5Widget.sstyle = circle5Sstyle;
    circle5Widget.at = (400, 120);
    circle5Widget.filterId = filterId;
    defaultGroup.placeWidget(circle5Widget);

    svg.addDefaultGroup(defaultGroup);

    final file = File('showcase/example/five_circles.svg');
    final rectSvgFile = await file.readAsString();

    expect(svg.out(), rectSvgFile);
  });
}
