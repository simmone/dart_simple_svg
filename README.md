A simple api for create svg image in Dart/Flutter.

For Exampe, Create a five circle svg image:

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

final svg = Svg(100, 100);

final rectId = svg.defShape(Rect(100, 100));

var defaultGroup = Group();

var sstyle = Sstyle();
sstyle.fill = '#BBC42A';
var widget = Widget(rectId);
widget.sstyle = sstyle;

defaultGroup.placeWidget(widget);
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
