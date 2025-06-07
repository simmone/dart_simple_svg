import 'package:flutter_test/flutter_test.dart';
import 'package:simple_svg/define/shape/path.dart';

void main() {
  test('path', () {
    final path = Path();
    expect(path.actions.length, 0);
  });

  test('format path', () {
    var path = Path();
    path.actions.add(PathRaw('path strs'));
    path.precision = 4;

    expect(path.format('1'), () {
      final buffer = StringBuffer();

      buffer.write('    <path id="1"\n');
      buffer.write('          d="\n');
      buffer.write('             path strs\n');
      buffer.write('            "/>\n');

      return buffer.toString();
    }());
  });

  test('setAllActionPrecision', () {
    var path = Path();
    path.movetoAbs((1, 2));
    path.movetoAbs((3, 4));
    path.setAllActionPrecision(4);

    expect(path.format('1'), () {
      final buffer = StringBuffer();

      buffer.write('    <path id="1"\n');
      buffer.write('          d="\n');
      buffer.write('             M1,2\n');
      buffer.write('             M3,4\n');
      buffer.write('            "/>\n');

      return buffer.toString();
    }());
  });
}
