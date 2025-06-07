import 'package:simple_svg/define/shape.dart';
import 'package:simple_svg/tool.dart';

class Filter extends Shape {
  num? blur;
  num? dropdownOffset;
  String? dropdownColor;

  Filter() {
    blur = 2.0;
    dropdownOffset = 3.0;
    dropdownColor = 'black';
  }

  @override
  String unique() {
    return 'Filter/blur/$blur/dropdownOffset/$dropdownOffset/dropdownColor/$dropdownColor';
  }

  @override
  String format(String shapeId) {
    final buffer = StringBuffer();

    buffer.write('    <filter id="$shapeId">\n');
    buffer.write(
        '      <feGaussianBlur in="SourceAlpha" stdDeviation="${Tool.round(blur!, precision!)}"></feGaussianBlur>\n');
    buffer.write(
        '      <feOffset dx="${Tool.round(dropdownOffset!, precision!)}" dy="${Tool.round(dropdownOffset!, precision!)}" result="offsetblur"></feOffset>\n');
    buffer.write('      <feFlood flood-color="$dropdownColor"></feFlood>\n');
    buffer.write(
        '      <feComposite in2="offsetblur" operator="in"></feComposite>\n');
    buffer.write('      <feMerge>\n');
    buffer.write('        <feMergeNode></feMergeNode>\n');
    buffer.write('        <feMergeNode in="SourceGraphic"></feMergeNode>\n');
    buffer.write('      </feMerge>\n');
    buffer.write('    </filter>\n');

    return buffer.toString();
  }
}
