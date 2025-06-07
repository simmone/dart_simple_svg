import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:simple_svg/simple_svg.dart';

void main() {
  test('path qcurve1', () async {
    final svg = Svg(220, 120);

    var qcurvePath = Path();
    qcurvePath.movetoAbs((10, 60));
    qcurvePath.qcurveAbs((60.0, 10.0), (110.0, 60.0));
    qcurvePath.qcurveAbs((160, 110), (210, 60.0));
    final qcurveId = svg.defShape(qcurvePath);

    var defaultGroup = Group();

    var qcurveSstyle = Sstyle();
    qcurveSstyle.strokeWidth = 3;
    qcurveSstyle.stroke = '#333333';

    var qcurveWidget = Widget(qcurveId);
    qcurveWidget.sstyle = qcurveSstyle;
    defaultGroup.placeWidget(qcurveWidget);

    final circleId = svg.defShape(Circle(5));

    var circleSstyle = Sstyle();
    circleSstyle.fill = 'red';

    var circle1Widget = Widget(circleId);
    circle1Widget.sstyle = circleSstyle;
    circle1Widget.at = (10, 60);
    defaultGroup.placeWidget(circle1Widget);

    var circle2Widget = Widget(circleId);
    circle2Widget.sstyle = circleSstyle;
    circle2Widget.at = (60, 10);
    defaultGroup.placeWidget(circle2Widget);

    var circle3Widget = Widget(circleId);
    circle3Widget.sstyle = circleSstyle;
    circle3Widget.at = (110, 60);
    defaultGroup.placeWidget(circle3Widget);

    var circle4Widget = Widget(circleId);
    circle4Widget.sstyle = circleSstyle;
    circle4Widget.at = (160, 110);
    defaultGroup.placeWidget(circle4Widget);

    var circle5Widget = Widget(circleId);
    circle5Widget.sstyle = circleSstyle;
    circle5Widget.at = (210, 60);
    defaultGroup.placeWidget(circle5Widget);

    svg.addDefaultGroup(defaultGroup);

    final file = File('showcase/path/qcurve1.svg');
    final qcurveSvgFile = await file.readAsString();

    expect(svg.out(), qcurveSvgFile);
  });

  test('path qcurve2', () async {
    final svg = Svg(220, 120);

    var qcurvePath = Path();
    qcurvePath.movetoAbs((10, 60));
    qcurvePath.qcurveRel((50.0, -50.0), (100.0, 0.0));
    qcurvePath.qcurveRel((50, 50), (100, 0));
    final qcurveId = svg.defShape(qcurvePath);

    var defaultGroup = Group();

    var qcurveSstyle = Sstyle();
    qcurveSstyle.strokeWidth = 3;
    qcurveSstyle.stroke = '#333333';

    var qcurveWidget = Widget(qcurveId);
    qcurveWidget.sstyle = qcurveSstyle;
    defaultGroup.placeWidget(qcurveWidget);

    final circleId = svg.defShape(Circle(5));

    var circleSstyle = Sstyle();
    circleSstyle.fill = 'red';

    var circle1Widget = Widget(circleId);
    circle1Widget.sstyle = circleSstyle;
    circle1Widget.at = (10, 60);
    defaultGroup.placeWidget(circle1Widget);

    var circle2Widget = Widget(circleId);
    circle2Widget.sstyle = circleSstyle;
    circle2Widget.at = (60, 10);
    defaultGroup.placeWidget(circle2Widget);

    var circle3Widget = Widget(circleId);
    circle3Widget.sstyle = circleSstyle;
    circle3Widget.at = (110, 60);
    defaultGroup.placeWidget(circle3Widget);

    var circle4Widget = Widget(circleId);
    circle4Widget.sstyle = circleSstyle;
    circle4Widget.at = (160, 110);
    defaultGroup.placeWidget(circle4Widget);

    var circle5Widget = Widget(circleId);
    circle5Widget.sstyle = circleSstyle;
    circle5Widget.at = (210, 60);
    defaultGroup.placeWidget(circle5Widget);

    svg.addDefaultGroup(defaultGroup);

    final file = File('showcase/path/qcurve2.svg');
    final qcurveSvgFile = await file.readAsString();

    expect(svg.out(), qcurveSvgFile);
  });
}
