import 'package:simple_svg/define/shape.dart';

enum TextKerningType {
  number,
  auto,
  inherit,
}

extension TextKerningTypeExtension on TextKerningType {
  String get name {
    switch (this) {
      case TextKerningType.number:
        return 'number';
      case TextKerningType.auto:
        return 'auto';
      case TextKerningType.inherit:
        return 'inherit';
    }
  }
}

class TextKerning {
  TextKerningType type;
  num? val;

  TextKerning(this.type);
  TextKerning.optional(this.type, [this.val = 0]);

  String formatted() {
    if (val != null) {
      return '$this.val';
    } else {
      return type.name;
    }
  }
}

enum TextSpaceType {
  number,
  normal,
  inherit,
}

extension TextSpaceTypeExtension on TextSpaceType {
  String get name {
    switch (this) {
      case TextSpaceType.number:
        return 'number';
      case TextSpaceType.normal:
        return 'normal';
      case TextSpaceType.inherit:
        return 'inherit';
    }
  }
}

class TextSpace {
  TextSpaceType type;
  num? val;

  TextSpace(this.type);
  TextSpace.optional(this.type, [this.val = 0]);

  String formatted() {
    if (val != null) {
      return '$this.val';
    } else {
      return type.name;
    }
  }
}

enum TextDecoration {
  overLine,
  underLine,
  lineThrough,
}

extension TextDecorationExtension on TextDecoration {
  String get name {
    switch (this) {
      case TextDecoration.overLine:
        return 'overline';
      case TextDecoration.underLine:
        return 'underline';
      case TextDecoration.lineThrough:
        return 'line-through';
    }
  }
}

class Text extends Shape {
  String text;
  num? fontSize;
  String? fontFamily;
  num? dx;
  num? dy;
  List<num>? rotate;
  num? textLength;
  TextKerning? kerning;
  TextSpace? letterSpace;
  TextSpace? wordSpace;
  TextDecoration? textDecoration;
  String? path;
  num? pathStartOffset;

  Text(this.text);

  @override
  String unique() {
    return 'Polyline/text/$text/fontSize/$fontSize/fontFamily/$fontFamily/dx/$dx/dy/$dy'
        '/rotate/$rotate/textLength/$textLength/kerning/$kerning/letterSpace/$letterSpace/wordSpace/$wordSpace'
        '/textDecoration/$textDecoration/path/$path/pathStartOffset/$pathStartOffset';
  }

  @override
  String format(String shapeId) {
    final buffer = StringBuffer();

    buffer.write('    <text ');

    buffer.write(() {
      var options = <String>[];

      options.add('id="$shapeId"');

      if (dx != null) {
        options.add('dx="$dx"');
      }

      if (dy != null) {
        options.add('dy="$dy"');
      }

      if (fontSize != null) {
        options.add('font-size="$fontSize"');
      }

      if (fontFamily != null) {
        options.add('font-family="$fontFamily"');
      }

      if (rotate != null) {
        options.add(() {
          var rotateBuffer = StringBuffer();

          rotateBuffer.write('rotate="');
          rotateBuffer.write(() {
            var rotateItems = <String>[];

            for (final item in rotate!) {
              rotateItems.add('$item');
            }

            return rotateItems.join(' ');
          }());
          rotateBuffer.write('"');

          return rotateBuffer.toString();
        }());
      }

      if (textLength != null) {
        options.add('textLength="$textLength"');
      }

      if (kerning != null) {
        options.add('kerning="${kerning!.formatted()}"');
      }

      if (letterSpace != null) {
        options.add('letter-space="${letterSpace!.formatted()}"');
      }

      if (wordSpace != null) {
        options.add('word-space="${wordSpace!.formatted()}"');
      }

      if (textDecoration != null) {
        options.add('text-decoration="${textDecoration!.name}"');
      }

      return options.join(' ');
    }());

    buffer.write('>');

    if (path != null) {
      buffer.write('\n      <textPath ');

      var options = <String>[];

      options.add('xlink:href="#$path"');

      if (pathStartOffset != null) {
        options.add('startOffset="$pathStartOffset%"');
      }

      buffer.write(options.join(' '));

      buffer.write('>$text</textPath>\n    ');
    } else {
      buffer.write(text);
    }

    buffer.write('</text>\n');

    return buffer.toString();
  }
}
