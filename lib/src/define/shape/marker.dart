import 'package:simple_svg/define/shape.dart';
import 'package:simple_svg/tool.dart';

enum MarkerType {
  triangle1,
  triangle2,
  circle,
  indent1,
  indent2,
  diamond1,
  diamond2,
  curve1,
  curve2,
}

class Marker extends Shape {
  MarkerType shape;
  num size = 0;
  num x = 0;
  String path = '';

  Marker(this.shape) {
    switch (shape) {
      case MarkerType.triangle1:
        size = 6;
        x = 1;
        path = '<path d="M0,0 L10,5 L0,10 z"';
      case MarkerType.triangle2:
        size = 6;
        x = 1;
        path = '<path d="M0,0 L15,5 L0,10 z"';
      case MarkerType.circle:
        size = 6;
        x = 5;
        path = '<circle r="5" cx="5" cy="5"';
      case MarkerType.indent1:
        size = 6;
        x = 4;
        path = '<path d="M0,0 L10,5 L0,10 L5,5 z"';
      case MarkerType.indent2:
        size = 6;
        x = 4;
        path = '<path d="M0,0 L15,5 L0,10 L5,5 z"';
      case MarkerType.diamond1:
        size = 6;
        x = 1;
        path = '<path d="M3,0 L10,5 L3,10 L0,5 z"';
      case MarkerType.diamond2:
        size = 6;
        x = 1;
        path = '<path d="M3,0 L15,5 L3,10 L0,5 z"';
      case MarkerType.curve1:
        size = 6;
        x = 2;
        path = '<path d="M0,0 L10,5 L0,10 C0,10 5,5 0,0 z"';
      case MarkerType.curve2:
        size = 6;
        x = 2;
        path = '<path d="M0,0 L15,5 L0,10 C0,10 5,5 0,0 z"';
    }
  }

  @override
  String unique() {
    return 'Marker/shape/$shape/size/$size/x/$x/path/$path';
  }

  @override
  String format(String shapeId) {
    final buffer = StringBuffer();

    buffer.write(
        '    <marker id="$shapeId" markerWidth="${Tool.round(size, super.precision!)}" markerHeight="$size" orient="auto-start-reverse" viewBox="0 0 15 15" refX="${Tool.round(x, super.precision!)}" refY="5" markerUnits="strokeWidth">\n');
    buffer.write('      $path fill="context-stroke" />\n');
    buffer.write('    </marker>\n');

    return buffer.toString();
  }
}
