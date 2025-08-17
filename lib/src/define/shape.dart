import 'package:simple_svg/src/define/precision.dart';

abstract class Shape with Precision {
  String format(String shapeId);

  String unique();
}
