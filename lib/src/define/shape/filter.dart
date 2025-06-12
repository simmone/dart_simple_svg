import 'package:simple_svg/src/define/shape.dart';
import 'package:simple_svg/src/tool.dart';

/// ![](https://raw.githubusercontent.com/simmone/dart_simple_svg/refs/heads/master/showcase/filter/filter_blur_dropdown.svg)
///
/// Give other shape some effect, usage: set filterId in widget.
///
/// Example: give circle a blurdropdown effect.
///```dart
///    final circleId = svg.defShape(Circle(50));
///    final filterId = svg.defShape(Filter());
///    var widget = Widget(circleId);
///    widget.filterId = filterId;
///```
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
      '      <feGaussianBlur in="SourceAlpha" stdDeviation="${Tool.round(blur!, precision!)}"></feGaussianBlur>\n',
    );
    buffer.write(
      '      <feOffset dx="${Tool.round(dropdownOffset!, precision!)}" dy="${Tool.round(dropdownOffset!, precision!)}" result="offsetblur"></feOffset>\n',
    );
    buffer.write('      <feFlood flood-color="$dropdownColor"></feFlood>\n');
    buffer.write(
      '      <feComposite in2="offsetblur" operator="in"></feComposite>\n',
    );
    buffer.write('      <feMerge>\n');
    buffer.write('        <feMergeNode></feMergeNode>\n');
    buffer.write('        <feMergeNode in="SourceGraphic"></feMergeNode>\n');
    buffer.write('      </feMerge>\n');
    buffer.write('    </filter>\n');

    return buffer.toString();
  }
}
