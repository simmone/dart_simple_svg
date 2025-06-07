import 'package:flutter_test/flutter_test.dart';
import 'package:simple_svg/tool.dart';

void main() {
  test('round1', () {
    expect(Tool.round(30.0, 4), '30');
    expect(Tool.round(30, 4), '30');
    expect(Tool.round(30.0000, 4), '30');
    expect(Tool.round(30.0001, 4), '30.0001');
    expect(Tool.round(30.00001, 4), '30');
    expect(Tool.round(30, 4), '30');
    expect(Tool.round(30.123, 4), '30.123');
    expect(Tool.round(30.1234, 4), '30.1234');
    expect(Tool.round(30.12344, 4), '30.1234');
    expect(Tool.round(30.12345, 4), '30.1235');
  });

  test('round2', () {
    expect(Tool.round(30.5555, 0), '31');
    expect(Tool.round(30.5555, 1), '30.6');
    expect(Tool.round(30.5555, 2), '30.56');
    expect(Tool.round(30.5555, 3), '30.556');
  });
}
