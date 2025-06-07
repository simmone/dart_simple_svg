import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:simple_svg/simple_svg.dart';

void main() {
  test('path arc', () async {
    final svg = Svg(300, 130);

    var arc1Path = Path();
    arc1Path.movetoAbs((130, 45));
    arc1Path.arcAbs((170.0, 85.0), (80.0, 40.0), ArcDirection.leftBig);
    final arc1Id = svg.defShape(arc1Path);

    var arc2Path = Path();
    arc2Path.movetoAbs((130, 45));
    arc2Path.arcAbs((170, 85), (80, 40), ArcDirection.leftSmall);
    final arc2Id = svg.defShape(arc2Path);

    var arc3Path = Path();
    arc3Path.movetoAbs((130, 45));
    arc3Path.arcAbs((170, 85), (80, 40), ArcDirection.rightBig);
    final arc3Id = svg.defShape(arc3Path);

    var arc4Path = Path();
    arc4Path.movetoAbs((130, 45));
    arc4Path.arcAbs((170, 85), (80, 40), ArcDirection.rightSmall);
    final arc4Id = svg.defShape(arc4Path);

    var defaultGroup = Group();

    var arc1Sstyle = Sstyle();
    arc1Sstyle.strokeWidth = 3;
    arc1Sstyle.stroke = '#ccccff';

    var arc1Widget = Widget(arc1Id);
    arc1Widget.sstyle = arc1Sstyle;
    defaultGroup.placeWidget(arc1Widget);

    var arc2Sstyle = Sstyle();
    arc2Sstyle.strokeWidth = 3;
    arc2Sstyle.stroke = 'green';

    var arc2Widget = Widget(arc2Id);
    arc2Widget.sstyle = arc2Sstyle;
    defaultGroup.placeWidget(arc2Widget);

    var arc3Sstyle = Sstyle();
    arc3Sstyle.strokeWidth = 3;
    arc3Sstyle.stroke = 'blue';

    var arc3Widget = Widget(arc3Id);
    arc3Widget.sstyle = arc3Sstyle;
    defaultGroup.placeWidget(arc3Widget);

    var arc4Sstyle = Sstyle();
    arc4Sstyle.strokeWidth = 3;
    arc4Sstyle.stroke = 'yellow';

    var arc4Widget = Widget(arc4Id);
    arc4Widget.sstyle = arc4Sstyle;
    defaultGroup.placeWidget(arc4Widget);

    var circleSstyle = Sstyle();
    circleSstyle.fill = 'red';

    final circleId = svg.defShape(Circle(5));

    var circle1Widget = Widget(circleId);
    circle1Widget.sstyle = circleSstyle;
    circle1Widget.at = (130, 45);
    defaultGroup.placeWidget(circle1Widget);

    var circle2Widget = Widget(circleId);
    circle2Widget.sstyle = circleSstyle;
    circle2Widget.at = (170, 85);
    defaultGroup.placeWidget(circle2Widget);

    svg.addDefaultGroup(defaultGroup);

    final file = File('showcase/path/arc.svg');
    final arcSvgFile = await file.readAsString();

    expect(svg.out(), arcSvgFile);
  });
}
