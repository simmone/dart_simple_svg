import 'widget.dart';

/// ![](https://raw.githubusercontent.com/simmone/dart_simple_svg/refs/heads/master/showcase/group/group1.svg)
///
/// Group is a basic type in svg. You can use multiple shapes to define a group, then reuse this group.
///
/// Example: Define a star group:
///```dart
///    final line1Id = svg.defShape(Line((0.00001, 0.00001), (30, 30)));
///    final line2Id = svg.defShape(Line((0, 15), (30, 15)));
///    final line3Id = svg.defShape(Line((15, 0), (15, 30)));
///    final line4Id = svg.defShape(Line((30, 0), (0, 30)));
///
///    var starGroup = Group();
///
///    var widgetLine1 = Widget(line1Id);
///    widgetLine1.at = (5, 5);
///
///    var widgetLine2 = Widget(line2Id);
///    widgetLine2.at = (5, 5);
///
///    var widgetLine3 = Widget(line3Id);
///    widgetLine3.at = (5, 5);
///
///    var widgetLine4 = Widget(line4Id);
///    widgetLine4.at = (5, 5);
///
///    starGroup.placeWidget(widgetLine1);
///    starGroup.placeWidget(widgetLine2);
///    starGroup.placeWidget(widgetLine3);
///    starGroup.placeWidget(widgetLine4);
///```
///
/// Then place it in different position.
///
///```dart
///    final starGroupId = svg.addGroup(starGroup);
///
///    var topGroup = Group();
///
///    var widget1 = Widget(starGroupId);
///    widget1.at = (50.0, 50.0);
///    topGroup.placeWidget(widget1);
///
///    var widget2 = Widget(starGroupId);
///    widget2.at = (100, 100);
///    topGroup.placeWidget(widget2);
///
///    var widget3 = Widget(starGroupId);
///    widget3.at = (80, 200);
///    topGroup.placeWidget(widget3);
///
///    var widget4 = Widget(starGroupId);
///    widget4.at = (150, 100);
///    topGroup.placeWidget(widget4);
///
///    final topGroupId = svg.addGroup(topGroup);
///```
///
/// Example2: pattern
/// ![](https://raw.githubusercontent.com/simmone/dart_simple_svg/refs/heads/master/showcase/group/group2.svg)
///
/// Example3: group reuse
/// ![](https://raw.githubusercontent.com/simmone/dart_simple_svg/refs/heads/master/showcase/group/group3.svg)
class Group {
  List<Widget> widgetList = [];

  Group();

  void placeWidget(Widget widget) {
    widgetList.add(widget);
  }
}
