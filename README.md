A simple api for create svg image in Dart/Flutter programatically.

thanks to Joni's tutorial: [SVG Pocket Guide](http://svgpocketguide.com/)

![](https://raw.githubusercontent.com/simmone/dart_simple_svg/refs/heads/master/showcase/example/five_circles.svg)

## Features

1. Create svg image programmatically.
2. Include most of svg shape and filters.

## Getting started

dart pub add simple_svg

## Usage

Basic steps: Create shape, set its style, place it somewhere in the group.

1. Create a svg object by width and height.
2. svg.defShape(...), add shape.
3. Create a sstyle to define styles: stroke width, stroke color, etc.
4. Create a widget to include the sstyle.
5. Create a group, use group.placeWidget(...) to place widget in group.
6. svg.addDefaultGroup(...) to set group to default.
7. use svg.out() to output the whole svg content.

```dart
import 'dart:io';
import 'package:simple_svg/simple_svg.dart';

// create the canvas
final svg = Svg(100, 100);

// add a shape, you can reuse it by shape id.
final rectId = svg.defShape(Rect(100, 100));

// create a group as default group, you create shapes or groups in it.
var defaultGroup = Group();

// only need define a basic shape once(a rectangle has same width and height), 
// but can give it different style and place it in different position.
//
// create a sstyle, give a shape a style: 
// fill color, stroke color, stroke width, etc.
var sstyle = Sstyle();
sstyle.fill = '#BBC42A';

// create a widget to include the sstyle or specify the shape position
// widget.at = (100, 100), etc.
var widget = Widget(rectId);
widget.sstyle = sstyle;

// group include widget.
defaultGroup.placeWidget(widget);

// set default group
svg.addDefaultGroup(defaultGroup);

final file = File('rect.svg');
var sink = file.openWrite();
sink.write(svg.out());
await sink.flush();
await sink.close();
```

![](https://raw.githubusercontent.com/simmone/dart_simple_svg/refs/heads/master/showcase/shapes/rect/rect.svg)

Shape, Group, Filter, Effect, etc.'s usage, check the their class doc.

## Showcases

### A recursive circle image.

![](https://raw.githubusercontent.com/simmone/dart_simple_svg/refs/heads/master/showcase/example/recursive.svg)

Code :[recursive circle](https://raw.githubusercontent.com/simmone/dart_simple_svg/refs/heads/master/test/showcase/recursive_test.dart)

### A recursive fern image.

![](https://raw.githubusercontent.com/simmone/dart_simple_svg/refs/heads/master/showcase/example/fern.svg)

Code: [recursive circle](https://raw.githubusercontent.com/simmone/dart_simple_svg/refs/heads/master/test/showcase/fern_test.dart)
