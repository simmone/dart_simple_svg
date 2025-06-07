import 'package:simple_svg/define/shape.dart';
import 'package:simple_svg/tool.dart';

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
        'width="${Tool.round(width, precision!)}" height="${Tool.round(height, precision!)}"');

    if (radiusX != null && radiusY != null) {
      buffer.write(
          ' rx="${Tool.round(radiusX ?? 0, precision!)}" ry="${Tool.round(radiusY ?? 0, precision!)}"');
    }

    buffer.write(' />\n');

    return buffer.toString();
  }
}
