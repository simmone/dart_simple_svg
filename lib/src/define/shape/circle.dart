import 'package:simple_svg/define/shape.dart';
import 'package:simple_svg/tool.dart';

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
        '    <circle id="$shapeId" r="${Tool.round(radius, precision!)}" />\n');

    return buffer.toString();
  }
}
