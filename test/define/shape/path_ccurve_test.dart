import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:simple_svg/simple_svg.dart';

void main() {
  test('path ccurve1', () async {
    final svg = Svg(200, 120);

    var ccurvePath = Path();
    ccurvePath.movetoAbs((10.0, 60.0));
    ccurvePath.ccurveAbs((30.0, 15.0), (80.0, 15.0), (100.0, 60.0));
    ccurvePath.ccurveAbs((120, 105), (170, 105), (190, 60));
    final ccurveId = svg.defShape(ccurvePath);

    var defaultGroup = Group();

    var ccurveSstyle = Sstyle();
    ccurveSstyle.strokeWidth = 3;
    ccurveSstyle.stroke = '#333333';

    var ccurveWidget = Widget(ccurveId);
    ccurveWidget.sstyle = ccurveSstyle;
    defaultGroup.placeWidget(ccurveWidget);

    final circleId = svg.defShape(Circle(5));

    var circleSstyle = Sstyle();
    circleSstyle.fill = 'red';

    var circle1Widget = Widget(circleId);
    circle1Widget.sstyle = circleSstyle;
    circle1Widget.at = (10, 60);
    defaultGroup.placeWidget(circle1Widget);

    var circle2Widget = Widget(circleId);
    circle2Widget.sstyle = circleSstyle;
    circle2Widget.at = (30, 15);
    defaultGroup.placeWidget(circle2Widget);

    var circle3Widget = Widget(circleId);
    circle3Widget.sstyle = circleSstyle;
    circle3Widget.at = (80, 15);
    defaultGroup.placeWidget(circle3Widget);

    var circle4Widget = Widget(circleId);
    circle4Widget.sstyle = circleSstyle;
    circle4Widget.at = (100, 60);
    defaultGroup.placeWidget(circle4Widget);

    var circle5Widget = Widget(circleId);
    circle5Widget.sstyle = circleSstyle;
    circle5Widget.at = (120, 105);
    defaultGroup.placeWidget(circle5Widget);

    var circle6Widget = Widget(circleId);
    circle6Widget.sstyle = circleSstyle;
    circle6Widget.at = (170, 105);
    defaultGroup.placeWidget(circle6Widget);

    var circle7Widget = Widget(circleId);
    circle7Widget.sstyle = circleSstyle;
    circle7Widget.at = (190, 60);
    defaultGroup.placeWidget(circle7Widget);

    svg.addDefaultGroup(defaultGroup);

    final file = File('showcase/path/ccurve1.svg');
    final ccurveSvgFile = await file.readAsString();

    expect(svg.out(), ccurveSvgFile);
  });

  test('path ccurve2', () async {
    final svg = Svg(200, 120);

    var ccurvePath = Path();
    ccurvePath.movetoAbs((10, 60));
    ccurvePath.ccurveRel((20.0, -45.0), (70.0, -45.0), (90.0, 0.0));
    ccurvePath.ccurveRel((20, 45), (70, 45), (90, 0));
    final ccurveId = svg.defShape(ccurvePath);

    var defaultGroup = Group();

    var ccurveSstyle = Sstyle();
    ccurveSstyle.strokeWidth = 3;
    ccurveSstyle.stroke = '#333333';

    var ccurveWidget = Widget(ccurveId);
    ccurveWidget.sstyle = ccurveSstyle;
    defaultGroup.placeWidget(ccurveWidget);

    final circleId = svg.defShape(Circle(5));

    var circleSstyle = Sstyle();
    circleSstyle.fill = 'red';

    var circle1Widget = Widget(circleId);
    circle1Widget.sstyle = circleSstyle;
    circle1Widget.at = (10, 60);
    defaultGroup.placeWidget(circle1Widget);

    var circle2Widget = Widget(circleId);
    circle2Widget.sstyle = circleSstyle;
    circle2Widget.at = (30, 15);
    defaultGroup.placeWidget(circle2Widget);

    var circle3Widget = Widget(circleId);
    circle3Widget.sstyle = circleSstyle;
    circle3Widget.at = (80, 15);
    defaultGroup.placeWidget(circle3Widget);

    var circle4Widget = Widget(circleId);
    circle4Widget.sstyle = circleSstyle;
    circle4Widget.at = (100, 60);
    defaultGroup.placeWidget(circle4Widget);

    var circle5Widget = Widget(circleId);
    circle5Widget.sstyle = circleSstyle;
    circle5Widget.at = (120, 105);
    defaultGroup.placeWidget(circle5Widget);

    var circle6Widget = Widget(circleId);
    circle6Widget.sstyle = circleSstyle;
    circle6Widget.at = (170, 105);
    defaultGroup.placeWidget(circle6Widget);

    var circle7Widget = Widget(circleId);
    circle7Widget.sstyle = circleSstyle;
    circle7Widget.at = (190, 60);
    defaultGroup.placeWidget(circle7Widget);

    svg.addDefaultGroup(defaultGroup);

    final file = File('showcase/path/ccurve2.svg');
    final ccurveSvgFile = await file.readAsString();

    expect(svg.out(), ccurveSvgFile);
  });
}
