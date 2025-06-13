import 'package:simple_svg/src/define/shape.dart';

/// ![](https://raw.githubusercontent.com/simmone/dart_simple_svg/refs/heads/master/showcase/shapes/polyline/polyline.svg)
///
///```dart
///    final polylineId = svg.defShape(
///      Polyline([
///        (0, 0),
///        (40, 0),
///        (40, 40),
///        (80, 40),
///        (80, 80),
///        (120, 80),
///        (120, 120),
///      ]),
///    );
///```
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
