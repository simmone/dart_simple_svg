import 'package:simple_svg/define/shape.dart';
import 'package:simple_svg/tool.dart';

enum GradientUnits {
  userSpaceOnUse,
  objectBoundingBox,
}

extension GradientUnitsExtension on GradientUnits {
  String get name {
    switch (this) {
      case GradientUnits.userSpaceOnUse:
        return 'userSpaceOnUse';
      case GradientUnits.objectBoundingBox:
        return 'objectBoundingBox';
    }
  }
}

enum SpreadMethod {
  repeat,
  reflect,
}

extension SpreadMethodExtension on SpreadMethod {
  String get name {
    switch (this) {
      case SpreadMethod.repeat:
        return 'repeat';
      case SpreadMethod.reflect:
        return 'reflect';
    }
  }
}

class LinearGradient extends Shape {
  List<(num, String, num)> stops;
  num? x1;
  num? y1;
  num? x2;
  num? y2;
  GradientUnits? gradientUnits;
  SpreadMethod? spreadMethod;

  LinearGradient(this.stops);

  @override
  String unique() {
    return 'LinearGradient/stops/$stops/x1/$x1/y1/$y1/x2/$x2/y2/$y2/gradientUnits/$gradientUnits/spreadMethod/$spreadMethod';
  }

  @override
  String format(String shapeId) {
    final buffer = StringBuffer();

    buffer.write('    <linearGradient id="$shapeId" ');

    final outItems = <String>[];

    if (x1 != null) {
      outItems.add('x1="${Tool.round(x1!, precision!)}"');
    }

    if (y1 != null) {
      outItems.add('y1="${Tool.round(y1!, precision!)}"');
    }

    if (x2 != null) {
      outItems.add('x2="${Tool.round(x2!, precision!)}"');
    }

    if (y2 != null) {
      outItems.add('y2="${Tool.round(y2!, precision!)}"');
    }

    if (gradientUnits != null) {
      outItems.add('gradientUnits="${gradientUnits!.name}"');
    }

    if (spreadMethod != null) {
      outItems.add('spreadMethod="${spreadMethod!.name}"');
    }

    buffer.write(outItems.join(' '));

    buffer.write('>\n');

    for (final stop in stops) {
      buffer.write(
          '      <stop offset="${Tool.round(stop.$1, precision!)}%" stop-color="${stop.$2}" ');

      if (stop.$3 != 1.0) {
        buffer.write('stop-opacity="${Tool.round(stop.$3, precision!)}" ');
      }

      buffer.write('/>\n');
    }

    buffer.write('    </linearGradient>\n');

    return buffer.toString();
  }
}

class RadialGradient extends Shape {
  List<(num, String, num)> stops;
  num? cx;
  num? cy;
  num? fx;
  num? fy;
  num? r;
  GradientUnits? gradientUnits;
  SpreadMethod? spreadMethod;

  RadialGradient(this.stops);

  @override
  String unique() {
    return 'RadialGradient/stops/$stops/cx/$cx/cy/$cy/fx/$fx/fy/$fy/r/$r';
  }

  @override
  String format(String shapeId) {
    final buffer = StringBuffer();

    buffer.write('    <radialGradient id="$shapeId" ');

    final outItems = <String>[];

    if (cx != null) {
      outItems.add('cx="${Tool.round(cx!, precision!)}"');
    }

    if (cy != null) {
      outItems.add('cy="${Tool.round(cy!, precision!)}"');
    }

    if (fx != null) {
      outItems.add('fx="${Tool.round(fx!, precision!)}"');
    }

    if (fy != null) {
      outItems.add('fy="${Tool.round(fy!, precision!)}"');
    }

    if (r != null) {
      outItems.add('r="${Tool.round(r!, precision!)}"');
    }

    if (gradientUnits != null) {
      outItems.add('gradientUnits="${gradientUnits!.name}"');
    }

    if (spreadMethod != null) {
      outItems.add('spreadMethod="${spreadMethod!.name}"');
    }

    buffer.write(outItems.join(' '));

    buffer.write('>\n');

    for (final stop in stops) {
      buffer.write(
          '      <stop offset="${Tool.round(stop.$1, precision!)}%" stop-color="${stop.$2}" ');

      if (stop.$3 != 1.0) {
        buffer.write('stop-opacity="${Tool.round(stop.$3, precision!)}" ');
      }

      buffer.write('/>\n');
    }

    buffer.write('    </radialGradient>\n');

    return buffer.toString();
  }
}
