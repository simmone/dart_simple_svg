import 'package:simple_svg/src/define/shape.dart';
import 'package:simple_svg/src/tool.dart';

/// ![](https://raw.githubusercontent.com/simmone/dart_simple_svg/refs/heads/master/showcase/shapes/rect/rect.svg)
///
/// Example1: plain rect defined by width and height
///
///```dart
///    final rectId = svg.defShape(Rect(100, 100));
///```
///
/// Example2: rect with radius
///
/// ![](https://raw.githubusercontent.com/simmone/dart_simple_svg/refs/heads/master/showcase/shapes/rect/rect_radius.svg)
///
///```dart
///    var rect = Rect(100.0, 100.0);
///    rect.radiusX = 5.0;
///    rect.radiusY = 10.0;
///```
/// Example3: multiple rect
///
/// ![](https://raw.githubusercontent.com/simmone/dart_simple_svg/refs/heads/master/showcase/shapes/rect/m_rect.svg)
///
///```dart
///    final blueRect = svg.defShape(Rect(150, 150));
///    final greenRect = svg.defShape(Rect(100, 100));
///    final redRect = svg.defShape(Rect(50, 50));
///
///    var blueSstyle = Sstyle();
///    blueSstyle.fill = 'blue';
///
///    var greenSstyle = Sstyle();
///    greenSstyle.fill = 'green';
///
///    var redSstyle = Sstyle();
///    redSstyle.fill = 'red';
///```
/// Example4: rect reuse
///
/// ![](https://raw.githubusercontent.com/simmone/dart_simple_svg/refs/heads/master/showcase/shapes/rect/rect_reuse.svg)
///
///```dart
///    final blueRect = svg.defShape(Rect(50, 50));
///
///    var blueSstyle = Sstyle();
///    blueSstyle.fill = 'blue';
///
///    var blueWidget1 = Widget(blueRect);
///    blueWidget1.sstyle = blueSstyle;
///    blueWidget1.at = (10, 10);
///
///    var blueWidget2 = Widget(blueRect);
///    blueWidget2.sstyle = blueSstyle;
///    blueWidget2.at = (70, 70);
///
///    var blueWidget3 = Widget(blueRect);
///    blueWidget3.sstyle = blueSstyle;
///    blueWidget3.at = (130, 130);
///
///    defaultGroup.placeWidget(blueWidget1);
///    defaultGroup.placeWidget(blueWidget2);
///    defaultGroup.placeWidget(blueWidget3);
///```
class Rect extends Shape {
  final num width;
  final num height;
  num? radiusX;
  num? radiusY;

  Rect(this.width, this.height, [this.radiusX, this.radiusY]);

  @override
  String unique() {
    return 'Rect/width/$width/height/$height/radiusX/$radiusX/radiusY/$radiusY';
  }

  @override
  String format(String shapeId) {
    final buffer = StringBuffer();

    buffer.write('    <rect id="$shapeId" ');

    buffer.write(
      'width="${Tool.round(width, precision!)}" height="${Tool.round(height, precision!)}"',
    );

    if (radiusX != null && radiusY != null) {
      buffer.write(
        ' rx="${Tool.round(radiusX ?? 0, precision!)}" ry="${Tool.round(radiusY ?? 0, precision!)}"',
      );
    }

    buffer.write(' />\n');

    return buffer.toString();
  }
}
