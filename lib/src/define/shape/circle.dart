import 'package:simple_svg/src/define/shape.dart';
import 'package:simple_svg/src/tool.dart';

/// Circle: defined by radius length
///
/// Example1: create a normal circle
///```dart
///    final circleId = svg.defShape(Circle(50.0));
///    var sstyle = Sstyle();
///    sstyle.fill = '#BBC42A';
///    var widget = Widget(circleId);
///    widget.sstyle = sstyle;
///    widget.at = (50, 50);
///```
/// ![](https://raw.githubusercontent.com/simmone/dart_simple_svg/refs/heads/master/showcase/shapes/circle/circle.svg)
///
/// Example2: create multiple circle
/// 
/// ![](https://raw.githubusercontent.com/simmone/dart_simple_svg/refs/heads/master/showcase/shapes/circle/circle4.svg)
class Circle extends Shape {
  final num radius;

  Circle(this.radius);

  @override
  String unique() {
    return 'Circle/radius/$radius';
  }

  @override
  String format(String shapeId) {
    final buffer = StringBuffer();

    buffer.write(
      '    <circle id="$shapeId" r="${Tool.round(radius, precision!)}" />\n',
    );

    return buffer.toString();
  }
}
