import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:simple_svg/simple_svg.dart';

void main() {
  test('filter define', () {
    final filter = Filter();
    expect(filter.blur, 2);
    expect(filter.dropdownOffset, 3);
    expect(filter.dropdownColor, 'black');
  });

  test('filter format', () {
    final filter = Filter();
    filter.precision = 4;

    expect(filter.format('1'), () {
      final buffer = StringBuffer();

      buffer.write('    <filter id="1">\n');
      buffer.write(
          '      <feGaussianBlur in="SourceAlpha" stdDeviation="2"></feGaussianBlur>\n');
      buffer.write(
          '      <feOffset dx="3" dy="3" result="offsetblur"></feOffset>\n');
      buffer.write('      <feFlood flood-color="black"></feFlood>\n');
      buffer.write(
          '      <feComposite in2="offsetblur" operator="in"></feComposite>\n');
      buffer.write('      <feMerge>\n');
      buffer.write('        <feMergeNode></feMergeNode>\n');
      buffer.write('        <feMergeNode in="SourceGraphic"></feMergeNode>\n');
      buffer.write('      </feMerge>\n');
      buffer.write('    </filter>\n');

      return buffer.toString();
    }());
  });

  test('basic filter', () async {
    final svg = Svg(140, 140);

    final circleId = svg.defShape(Circle(50));

    final filterId = svg.defShape(Filter());

    var defaultGroup = Group();

    var sstyle = Sstyle();
    sstyle.stroke = 'red';
    sstyle.strokeWidth = 12;

    var widget = Widget(circleId);
    widget.sstyle = sstyle;
    widget.filterId = filterId;
    widget.at = (70, 70);

    defaultGroup.placeWidget(widget);

    svg.addDefaultGroup(defaultGroup);

    final file = File('showcase/filter/filter_blur_dropdown.svg');
    final filterSvgFile = await file.readAsString();

    expect(svg.out(), filterSvgFile);
  });
}
