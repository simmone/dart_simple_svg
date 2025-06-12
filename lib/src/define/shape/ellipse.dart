import 'package:simple_svg/src/define/shape.dart';
import 'package:simple_svg/src/tool.dart';

/// Ellipse: defined by radiusX and radiusY
///
/// Example: 
///```dart
///    final ellipseId = svg.defShape(Ellipse(100.0, 50.0));
///
///    var defaultGroup = Group();
///    var sstyle = Sstyle();
///    sstyle.fill = '#7AA20D';
///    var widget = Widget(ellipseId);
///    widget.sstyle = sstyle;
///    widget.at = (100, 50);
///```
/// ![](https://raw.githubusercontent.com/simmone/dart_simple_svg/refs/heads/master/showcase/shapes/ellipse/ellipse.svg)
class Ellipse extends Shape {
  final num radiusX;
  final num radiusY;

  Ellipse(this.radiusX, this.radiusY);

  @override
  String unique() {
    return 'Ellipse/radiusX/$radiusX/radiusY/$radiusY';
  }

  @override
  String format(String shapeId) {
    final buffer = StringBuffer();

    buffer.write(
      '    <ellipse id="$shapeId" rx="${Tool.round(radiusX, precision!)}" ry="${Tool.round(radiusY, precision!)}" />\n',
    );

    return buffer.toString();
  }
}
