import 'package:simple_svg/src/define/shape.dart';

/// ![](https://raw.githubusercontent.com/simmone/dart_simple_svg/refs/heads/master/showcase/shapes/polygon/polygon.svg)
///
///```dart
///    final polygonId = svg.defShape(
///      Polygon([
///        (0, 25),
///        (25, 0),
///        (75, 0),
///        (100, 25),
///        (100, 75),
///        (75, 100),
///        (25, 100),
///        (0, 75),
///      ]),
///    );
///```
class Polygon extends Shape {
  List<(num, num)> points;

  Polygon(this.points);

  @override
  String unique() {
    return 'Polygon/points/$points';
  }

  @override
  String format(String shapeId) {
    final buffer = StringBuffer();

    buffer.write('    <polygon id="$shapeId" points="');

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
