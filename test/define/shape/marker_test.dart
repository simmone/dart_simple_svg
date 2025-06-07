import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:simple_svg/simple_svg.dart';

void main() {
  test('marker normal', () async {
    final svg = Svg(200, 120);

    final markerId = svg.defShape(Marker(MarkerType.triangle1));

    final lineId = svg.defShape(Line((0, 0), (100, 0)));

    var lineSstyle = Sstyle();
    lineSstyle.stroke = '#000000';
    lineSstyle.strokeWidth = 2;

    var defaultGroup = Group();

    var widget = Widget(lineId);
    widget.sstyle = lineSstyle;
    widget.at = (50, 50);
    widget.markerEndId = markerId;

    defaultGroup.placeWidget(widget);

    svg.addDefaultGroup(defaultGroup);

    final file = File('showcase/marker/marker1.svg');
    final markerSvgFile = await file.readAsString();

    expect(svg.out(), markerSvgFile);
  });

  test('marker all direction', () async {
    final svg = Svg(300, 300);

    final markerId = svg.defShape(Marker(MarkerType.triangle2));

    final line1Id = svg.defShape(Line((0, 0), (100, 0)));
    final line2Id = svg.defShape(Line((0, 0), (70, 70)));
    final line3Id = svg.defShape(Line((0, 0), (0, 100)));
    final line4Id = svg.defShape(Line((0, 0), (-70, 70)));
    final line5Id = svg.defShape(Line((0, 0), (-100, 0)));
    final line6Id = svg.defShape(Line((0, 0), (-70, -70)));
    final line7Id = svg.defShape(Line((0, 0), (0, -100)));
    final line8Id = svg.defShape(Line((0, 0), (70, -70)));

    var lineSstyle = Sstyle();
    lineSstyle.stroke = '#000000';
    lineSstyle.strokeWidth = 2;

    var defaultGroup = Group();

    var widget1 = Widget(line1Id);
    widget1.sstyle = lineSstyle;
    widget1.at = (180, 150);
    widget1.markerStartId = markerId;
    widget1.markerEndId = markerId;
    defaultGroup.placeWidget(widget1);

    var widget2 = Widget(line2Id);
    widget2.sstyle = lineSstyle;
    widget2.at = (180, 180);
    widget2.markerStartId = markerId;
    widget2.markerEndId = markerId;
    defaultGroup.placeWidget(widget2);

    var widget3 = Widget(line3Id);
    widget3.sstyle = lineSstyle;
    widget3.at = (150, 180);
    widget3.markerStartId = markerId;
    widget3.markerEndId = markerId;
    defaultGroup.placeWidget(widget3);

    var widget4 = Widget(line4Id);
    widget4.sstyle = lineSstyle;
    widget4.at = (120, 180);
    widget4.markerStartId = markerId;
    widget4.markerEndId = markerId;
    defaultGroup.placeWidget(widget4);

    var widget5 = Widget(line5Id);
    widget5.sstyle = lineSstyle;
    widget5.at = (120, 150);
    widget5.markerStartId = markerId;
    widget5.markerEndId = markerId;
    defaultGroup.placeWidget(widget5);

    var widget6 = Widget(line6Id);
    widget6.sstyle = lineSstyle;
    widget6.at = (120, 120);
    widget6.markerStartId = markerId;
    widget6.markerEndId = markerId;
    defaultGroup.placeWidget(widget6);

    var widget7 = Widget(line7Id);
    widget7.sstyle = lineSstyle;
    widget7.at = (150, 120);
    widget7.markerStartId = markerId;
    widget7.markerEndId = markerId;
    defaultGroup.placeWidget(widget7);

    var widget8 = Widget(line8Id);
    widget8.sstyle = lineSstyle;
    widget8.at = (180, 120);
    widget8.markerStartId = markerId;
    widget8.markerEndId = markerId;
    defaultGroup.placeWidget(widget8);

    svg.addDefaultGroup(defaultGroup);

    final file = File('showcase/marker/marker2.svg');
    final markerSvgFile = await file.readAsString();

    expect(svg.out(), markerSvgFile);
  });

  test('marker all', () async {
    final svg = Svg(200, 200);

    final arrowId = svg.defShape(Marker(MarkerType.triangle1));

    final circleId = svg.defShape(Marker(MarkerType.circle));

    final polylineId = svg.defShape(Polyline([
      (0, 0),
      (0, 100),
      (100, 100),
    ]));

    var polylineSstyle = Sstyle();
    polylineSstyle.stroke = '#000000';
    polylineSstyle.strokeWidth = 2;

    var defaultGroup = Group();

    var widget = Widget(polylineId);
    widget.sstyle = polylineSstyle;
    widget.at = (50, 50);
    widget.markerStartId = arrowId;
    widget.markerMidId = circleId;
    widget.markerEndId = arrowId;
    defaultGroup.placeWidget(widget);

    svg.addDefaultGroup(defaultGroup);

    final file = File('showcase/marker/marker3.svg');
    final markerSvgFile = await file.readAsString();

    expect(svg.out(), markerSvgFile);
  });

  test('marker curve', () async {
    final svg = Svg(300, 300);

    var ccurve1Path = Path();
    ccurve1Path.movetoAbs((100, 75));
    ccurve1Path.ccurveAbs((125, 50), (150, 50), (175, 75));
    final ccurve1Id = svg.defShape(ccurve1Path);

    var ccurve2Path = Path();
    ccurve2Path.movetoAbs((175, 125));
    ccurve2Path.ccurveAbs((150, 150), (125, 150), (100, 125));
    final ccurve2Id = svg.defShape(ccurve2Path);

    final arrowId = svg.defShape(Marker(MarkerType.triangle1));

    var ccurve1Sstyle = Sstyle();
    ccurve1Sstyle.stroke = 'crimson';
    ccurve1Sstyle.strokeWidth = 10;

    var ccurve2Sstyle = Sstyle();
    ccurve2Sstyle.stroke = 'olivedrab';
    ccurve2Sstyle.strokeWidth = 10;

    var defaultGroup = Group();

    var widget1 = Widget(ccurve1Id);
    widget1.sstyle = ccurve1Sstyle;
    widget1.markerEndId = arrowId;
    defaultGroup.placeWidget(widget1);

    var widget2 = Widget(ccurve2Id);
    widget2.sstyle = ccurve2Sstyle;
    widget2.markerEndId = arrowId;
    defaultGroup.placeWidget(widget2);

    svg.addDefaultGroup(defaultGroup);

    final file = File('showcase/marker/marker4.svg');
    final markerSvgFile = await file.readAsString();

    expect(svg.out(), markerSvgFile);
  });
}
