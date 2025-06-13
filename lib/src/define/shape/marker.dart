import 'package:simple_svg/src/define/shape.dart';
import 'package:simple_svg/src/tool.dart';

enum MarkerType {
  triangle1,
  triangle2,
  circle,
  indent1,
  indent2,
  diamond1,
  diamond2,
  curve1,
  curve2,
}

/// ![](https://raw.githubusercontent.com/simmone/dart_simple_svg/refs/heads/master/showcase/marker/marker1.svg)
///
/// Marker is a decorative shape.
///
/// Example1: triangle marker
///```dart
///    final markerId = svg.defShape(Marker(MarkerType.triangle1));
///
///    final lineId = svg.defShape(Line((0, 0), (100, 0)));
///
///    var lineSstyle = Sstyle();
///    lineSstyle.stroke = '#000000';
///    lineSstyle.strokeWidth = 2;
///
///    var widget = Widget(lineId);
///    widget.sstyle = lineSstyle;
///    widget.at = (50, 50);
///    widget.markerEndId = markerId;
///```
///
/// Example2: all directions
///
/// ![](https://raw.githubusercontent.com/simmone/dart_simple_svg/refs/heads/master/showcase/marker/marker2.svg)
///
///```dart
///    final markerId = svg.defShape(Marker(MarkerType.triangle2));
///
///    final line1Id = svg.defShape(Line((0, 0), (100, 0)));
///    final line2Id = svg.defShape(Line((0, 0), (70, 70)));
///    final line3Id = svg.defShape(Line((0, 0), (0, 100)));
///    final line4Id = svg.defShape(Line((0, 0), (-70, 70)));
///    final line5Id = svg.defShape(Line((0, 0), (-100, 0)));
///    final line6Id = svg.defShape(Line((0, 0), (-70, -70)));
///    final line7Id = svg.defShape(Line((0, 0), (0, -100)));
///    final line8Id = svg.defShape(Line((0, 0), (70, -70)));
///
///    var lineSstyle = Sstyle();
///    lineSstyle.stroke = '#000000';
///    lineSstyle.strokeWidth = 2;
///
///    var widget1 = Widget(line1Id);
///    widget1.sstyle = lineSstyle;
///    widget1.at = (180, 150);
///    widget1.markerStartId = markerId;
///    widget1.markerEndId = markerId;
///    defaultGroup.placeWidget(widget1);
///    ...
///```
///
/// Example3: different marker type
///
/// ![](https://raw.githubusercontent.com/simmone/dart_simple_svg/refs/heads/master/showcase/marker/marker3.svg)
///
///```dart
///    final arrowId = svg.defShape(Marker(MarkerType.triangle1));
///
///    final circleId = svg.defShape(Marker(MarkerType.circle));
///
///    final polylineId = svg.defShape(Polyline([(0, 0), (0, 100), (100, 100)]));
///
///    var polylineSstyle = Sstyle();
///    polylineSstyle.stroke = '#000000';
///    polylineSstyle.strokeWidth = 2;
///
///    var defaultGroup = Group();
///
///    var widget = Widget(polylineId);
///    widget.sstyle = polylineSstyle;
///    widget.at = (50, 50);
///    widget.markerStartId = arrowId;
///    widget.markerMidId = circleId;
///    widget.markerEndId = arrowId;
///    defaultGroup.placeWidget(widget);
///```
///
/// Example4: 
///
/// ![](https://raw.githubusercontent.com/simmone/dart_simple_svg/refs/heads/master/showcase/marker/marker4.svg)
///
///```dart
///    var ccurve1Path = Path();
///    ccurve1Path.movetoAbs((100, 75));
///    ccurve1Path.ccurveAbs((125, 50), (150, 50), (175, 75));
///    final ccurve1Id = svg.defShape(ccurve1Path);
///
///    var ccurve2Path = Path();
///    ccurve2Path.movetoAbs((175, 125));
///    ccurve2Path.ccurveAbs((150, 150), (125, 150), (100, 125));
///    final ccurve2Id = svg.defShape(ccurve2Path);
///
///    final arrowId = svg.defShape(Marker(MarkerType.triangle1));
///
///    var widget1 = Widget(ccurve1Id);
///    widget1.sstyle = ccurve1Sstyle;
///    widget1.markerEndId = arrowId;
///    defaultGroup.placeWidget(widget1);
///
///    var widget2 = Widget(ccurve2Id);
///    widget2.sstyle = ccurve2Sstyle;
///    widget2.markerEndId = arrowId;
///    defaultGroup.placeWidget(widget2);
///```
class Marker extends Shape {
  MarkerType shape;
  num size = 0;
  num x = 0;
  String path = '';

  Marker(this.shape) {
    switch (shape) {
      case MarkerType.triangle1:
        size = 6;
        x = 1;
        path = '<path d="M0,0 L10,5 L0,10 z"';
      case MarkerType.triangle2:
        size = 6;
        x = 1;
        path = '<path d="M0,0 L15,5 L0,10 z"';
      case MarkerType.circle:
        size = 6;
        x = 5;
        path = '<circle r="5" cx="5" cy="5"';
      case MarkerType.indent1:
        size = 6;
        x = 4;
        path = '<path d="M0,0 L10,5 L0,10 L5,5 z"';
      case MarkerType.indent2:
        size = 6;
        x = 4;
        path = '<path d="M0,0 L15,5 L0,10 L5,5 z"';
      case MarkerType.diamond1:
        size = 6;
        x = 1;
        path = '<path d="M3,0 L10,5 L3,10 L0,5 z"';
      case MarkerType.diamond2:
        size = 6;
        x = 1;
        path = '<path d="M3,0 L15,5 L3,10 L0,5 z"';
      case MarkerType.curve1:
        size = 6;
        x = 2;
        path = '<path d="M0,0 L10,5 L0,10 C0,10 5,5 0,0 z"';
      case MarkerType.curve2:
        size = 6;
        x = 2;
        path = '<path d="M0,0 L15,5 L0,10 C0,10 5,5 0,0 z"';
    }
  }

  @override
  String unique() {
    return 'Marker/shape/$shape/size/$size/x/$x/path/$path';
  }

  @override
  String format(String shapeId) {
    final buffer = StringBuffer();

    buffer.write(
      '    <marker id="$shapeId" markerWidth="${Tool.round(size, super.precision!)}" markerHeight="$size" orient="auto-start-reverse" viewBox="0 0 15 15" refX="${Tool.round(x, super.precision!)}" refY="5" markerUnits="strokeWidth">\n',
    );
    buffer.write('      $path fill="context-stroke" />\n');
    buffer.write('    </marker>\n');

    return buffer.toString();
  }
}
