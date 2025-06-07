import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:simple_svg/simple_svg.dart';

void main() {
  test('arrow 1', () async {
    final svg = Svg(300, 300);

    final arrowId =
        svg.defShape(Arrow(50.0, 50.0, 280.0, 280.0, 40.0, 40.0, 80.0));

    var arrowSstyle = Sstyle();
    arrowSstyle.stroke = 'teal';
    arrowSstyle.fill = 'lavender';
    arrowSstyle.strokeWidth = 5.0;

    var defaultGroup = Group();

    var widget = Widget(arrowId);
    widget.sstyle = arrowSstyle;

    defaultGroup.placeWidget(widget);

    svg.addDefaultGroup(defaultGroup);

    final file = File('showcase/arrow/arrow1.svg');
    final arrowSvgFile = await file.readAsString();

    expect(svg.out(), arrowSvgFile);
  });

  test('arrow align', () async {
    final svg = Svg(300, 300);

    final arrowId = svg.defShape(Arrow(100, 100, 100, 250, 10, 10, 20));

    var arrowSstyle = Sstyle();
    arrowSstyle.stroke = 'teal';
    arrowSstyle.fill = 'lavender';
    arrowSstyle.strokeWidth = 5;

    var defaultGroup = Group();

    var widget = Widget(arrowId);
    widget.sstyle = arrowSstyle;

    defaultGroup.placeWidget(widget);

    svg.addDefaultGroup(defaultGroup);

    final file = File('showcase/arrow/arrow_align.svg');
    final arrowSvgFile = await file.readAsString();

    expect(svg.out(), arrowSvgFile);
  });

  test('arrow 2', () async {
    final svg = Svg(400, 400);

    final arrow10Id = svg.defShape(Arrow(200, 200, 200, 350, 10, 10, 20));
    final arrow11Id = svg.defShape(Arrow(200, 200, 150, 300, 10, 10, 20));
    final arrow12Id = svg.defShape(Arrow(200, 200, 100, 250, 10, 10, 20));
    final arrow20Id = svg.defShape(Arrow(200, 200, 50, 200, 10, 10, 20));
    final arrow21Id = svg.defShape(Arrow(200, 200, 100, 150, 10, 10, 20));
    final arrow22Id = svg.defShape(Arrow(200, 200, 150, 100, 10, 10, 20));
    final arrow30Id = svg.defShape(Arrow(200, 200, 200, 50, 10, 10, 20));
    final arrow31Id = svg.defShape(Arrow(200, 200, 250, 100, 10, 10, 20));
    final arrow32Id = svg.defShape(Arrow(200, 200, 300, 150, 10, 10, 20));
    final arrow40Id = svg.defShape(Arrow(200, 200, 350, 200, 10, 10, 20));
    final arrow41Id = svg.defShape(Arrow(200, 200, 300, 250, 10, 10, 20));
    final arrow42Id = svg.defShape(Arrow(200, 200, 250, 300, 10, 10, 20));

    var arrowSstyle = Sstyle();
    arrowSstyle.stroke = 'green';
    arrowSstyle.fill = '#ED6E46';
    arrowSstyle.strokeWidth = 2;

    var defaultGroup = Group();

    var widget10 = Widget(arrow10Id);
    widget10.sstyle = arrowSstyle;
    defaultGroup.placeWidget(widget10);

    var widget11 = Widget(arrow11Id);
    widget11.sstyle = arrowSstyle;
    defaultGroup.placeWidget(widget11);

    var widget12 = Widget(arrow12Id);
    widget12.sstyle = arrowSstyle;
    defaultGroup.placeWidget(widget12);

    var widget20 = Widget(arrow20Id);
    widget20.sstyle = arrowSstyle;
    defaultGroup.placeWidget(widget20);

    var widget21 = Widget(arrow21Id);
    widget21.sstyle = arrowSstyle;
    defaultGroup.placeWidget(widget21);

    var widget22 = Widget(arrow22Id);
    widget22.sstyle = arrowSstyle;
    defaultGroup.placeWidget(widget22);

    var widget30 = Widget(arrow30Id);
    widget30.sstyle = arrowSstyle;
    defaultGroup.placeWidget(widget30);

    var widget31 = Widget(arrow31Id);
    widget31.sstyle = arrowSstyle;
    defaultGroup.placeWidget(widget31);

    var widget32 = Widget(arrow32Id);
    widget32.sstyle = arrowSstyle;
    defaultGroup.placeWidget(widget32);

    var widget40 = Widget(arrow40Id);
    widget40.sstyle = arrowSstyle;
    defaultGroup.placeWidget(widget40);

    var widget41 = Widget(arrow41Id);
    widget41.sstyle = arrowSstyle;
    defaultGroup.placeWidget(widget41);

    var widget42 = Widget(arrow42Id);
    widget42.sstyle = arrowSstyle;
    defaultGroup.placeWidget(widget42);

    svg.addDefaultGroup(defaultGroup);

    final file = File('showcase/arrow/arrow2.svg');
    final arrowSvgFile = await file.readAsString();

    expect(svg.out(), arrowSvgFile);
  });
}
