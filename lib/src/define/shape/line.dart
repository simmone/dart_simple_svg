import 'package:simple_svg/define/shape.dart';
import 'package:simple_svg/tool.dart';

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
        '    <line id="$shapeId" x1="${Tool.round(startX, precision!)}" y1="${Tool.round(startY, precision!)}" x2="${Tool.round(endX, precision!)}" y2="${Tool.round(endY, precision!)}" />\n');

    return buffer.toString();
  }
}
