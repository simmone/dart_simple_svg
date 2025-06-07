import 'package:flutter_test/flutter_test.dart';
import 'package:simple_svg/define/sstyle.dart';

void main() {
  test('sstyle', () {
    final sstyle = Sstyle();
    expect(sstyle.fill, null);
  });

  test('format fill1', () {
    var sstyle = Sstyle();
    sstyle.fillRule = FillRule.nonzero;
    sstyle.fillGradient = 's1';
    sstyle.fillOpacity = 0.5;
    sstyle.precision = 4;

    expect(sstyle.format(),
        'fill="url(#s1)" fill-rule="nonzero" fill-opacity="0.5"');
  });

  test('format fill2', () {
    var sstyle = Sstyle();

    sstyle.fill = 'red';
    sstyle.fillRule = FillRule.nonzero;
    sstyle.fillOpacity = 30.0;
    sstyle.precision = 4;

    expect(sstyle.format(), 'fill="red" fill-rule="nonzero" fill-opacity="30"');
  });

  test('format stroke', () {
    var sstyle = Sstyle();

    sstyle.strokeWidth = 5.0;
    sstyle.stroke = '#ABABAB';
    sstyle.strokeLineJoin = StrokeLineJoin.round;
    sstyle.strokeLineCap = StrokeLineCap.square;
    sstyle.strokeMiterLimit = 2.0;
    sstyle.strokeDashArray = '40,10';
    sstyle.strokeDashOffset = 5.0;
    sstyle.precision = 4;

    expect(sstyle.format(),
        'fill="none" stroke-width="5" stroke="#ABABAB" stroke-linejoin="round" stroke-linecap="square" stroke-miterlimit="2" stroke-dasharray="40,10" stroke-dashoffset="5"');
  });

  test('format transform', () {
    var sstyle = Sstyle();

    sstyle.translate = (0.1, 0.2);
    sstyle.rotate = 30.0;
    sstyle.scaleAll = 1.0;
    sstyle.skewX = 2.0;
    sstyle.skewY = 3.0;
    sstyle.precision = 4;

    expect(sstyle.format(),
        'fill="none" transform="translate(0.1 0.2) rotate(30) scale(1) skewX(2) skewY(3)"');

    sstyle.scaleAll = null;
    sstyle.scaleXy = (2, 3);

    expect(sstyle.format(),
        'fill="none" transform="translate(0.1 0.2) rotate(30) scale(2 3) skewX(2) skewY(3)"');
  });
}
