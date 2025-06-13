import 'package:simple_svg/src/define/shape.dart';
import 'package:simple_svg/src/tool.dart';

/// ![](https://raw.githubusercontent.com/simmone/dart_simple_svg/refs/heads/master/showcase/shapes/line/line.svg)
///
/// Example1: define a line by start and end point.
///```dart
///    final lineId = svg.defShape(Line((0.0, 0.0), (100.0, 100.0)));
///
///    var sstyle = Sstyle();
///    sstyle.stroke = '#765373';
///    sstyle.strokeWidth = 10;
///    var widget = Widget(lineId);
///    widget.sstyle = sstyle;
///    widget.at = (5, 5);
///```
///
/// Example2: dual line
///
/// ![](https://raw.githubusercontent.com/simmone/dart_simple_svg/refs/heads/master/showcase/shapes/line/dual.svg)
class Line extends Shape {
  num startX = 0;
  num startY = 0;
  num endX = 0;
  num endY = 0;

  Line((num, num) startPoint, (num, num) endPoint) {
    startX = startPoint.$1;
    startY = startPoint.$2;
    endX = endPoint.$1;
    endY = endPoint.$2;
  }

  @override
  String unique() {
    return 'Line/startX/$startX/startY/$startY/endX/$endX/endY/$endY';
  }

  @override
  String format(String shapeId) {
    final buffer = StringBuffer();

    buffer.write(
      '    <line id="$shapeId" x1="${Tool.round(startX, precision!)}" y1="${Tool.round(startY, precision!)}" x2="${Tool.round(endX, precision!)}" y2="${Tool.round(endY, precision!)}" />\n',
    );

    return buffer.toString();
  }
}
