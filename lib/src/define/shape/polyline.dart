import 'package:simple_svg/define/shape.dart';

class Polyline extends Shape {
  List<(num, num)> points;

  Polyline(this.points);

  @override
  String unique() {
    return 'Polyline/points/$points';
  }

  @override
  String format(String shapeId) {
    final buffer = StringBuffer();

    buffer.write('    <polyline id="$shapeId" points="');

    final pointItems = <String>[];

    for (final point in points) {
      pointItems.add('${point.$1},${point.$2}');
    }

    final pointsStr = pointItems.join(' ');

    buffer.write(pointsStr);

    buffer.write('" />\n');

    return buffer.toString();
  }
}
