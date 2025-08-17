import 'package:simple_svg/src/define/shape.dart';

enum TextKerningType { number, auto, inherit }

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
      return '$val';
    } else {
      return type.name;
    }
  }
}

enum TextSpaceType { number, normal, inherit }

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
      return '$val';
    } else {
      return type.name;
    }
  }
}

enum TextDecoration { overLine, underLine, lineThrough }

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

/// ![](https://raw.githubusercontent.com/simmone/dart_simple_svg/refs/heads/master/showcase/text/text1.svg)
///
/// Example1: create a text
///
///```dart
///    final text = Text('城春草木深');
///    text.fontSize = 50;
///
///    final textId = svg.defShape(text);
///
///    var defaultGroup = Group();
///
///    var textSstyle = Sstyle();
///    textSstyle.fill = '#ED6E46';
///```
///
/// Example2: text rotate
///
/// ![](https://raw.githubusercontent.com/simmone/dart_simple_svg/refs/heads/master/showcase/text/text2.svg)
///
///```dart
///    final text = Text('城春草木深');
///    text.fontSize = 50;
///    text.rotate = [10, 20, 30, 40, 50];
///    text.textLength = 300;
///```
///
/// Example3: text decoration
///
/// ![](https://raw.githubusercontent.com/simmone/dart_simple_svg/refs/heads/master/showcase/text/text3.svg)
///
///```dart
///    final text1 = Text('国破山河在');
///    text1.fontSize = 50;
///    text1.textDecoration = TextDecoration.overLine;
///    final text1Id = svg.defShape(text1);
///
///    final text2 = Text('国破山河在');
///    text2.fontSize = 50;
///    text2.textDecoration = TextDecoration.underLine;
///    final text2Id = svg.defShape(text2);
///
///    final text3 = Text('国破山河在');
///    text3.fontSize = 50;
///    text3.textDecoration = TextDecoration.lineThrough;
///    final text3Id = svg.defShape(text3);
///```
///
/// Example4: text path
///
/// ![](https://raw.githubusercontent.com/simmone/dart_simple_svg/refs/heads/master/showcase/text/text4.svg)
///
///```dart
///    final svg = Svg(500, 100);
///
///    final qcurvePath = Path();
///    qcurvePath.movetoAbs((10, 60));
///    qcurvePath.qcurveAbs((110, 10), (210, 60));
///    qcurvePath.qcurveAbs((310, 110), (410, 60));
///    final qcurveId = svg.defShape(qcurvePath);
///
///    final text = Text('国破山河在 城春草木深 感时花溅泪 恨别鸟惊心');
///    text.path = qcurveId;
///    text.pathStartOffset = 5;
///    final textId = svg.defShape(text);
///```
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
