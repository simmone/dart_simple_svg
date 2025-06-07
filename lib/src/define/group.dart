import 'widget.dart';

class Group {
  List<Widget> widgetList = [];

  Group();

  void placeWidget(Widget widget) {
    widgetList.add(widget);
  }
}
