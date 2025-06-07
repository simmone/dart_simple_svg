import 'sstyle.dart';
import 'package:simple_svg/tool.dart';
import 'package:simple_svg/define/precision.dart';

class Widget with Precision {
  final String shapeId;
  (num, num)? at;
  Sstyle? sstyle;
  String? filterId;
  String? markerStartId;
  String? markerMidId;
  String? markerEndId;

  Widget(this.shapeId);

  String format() {
    final outItems = <String>[];

    outItems.add('<use xlink:href="#$shapeId"');

    if (at != null) {
      final atStr =
          (Tool.round(at!.$1, precision!), Tool.round(at!.$2, precision!));
      if (atStr != ('0', '0')) {
        outItems.add('x="${atStr.$1}" y="${atStr.$2}"');
      }
    }

    if (sstyle != null) {
      outItems.add(sstyle!.format());
    }

    if (filterId != null) {
      outItems.add('filter="url(#$filterId)"');
    }

    if (markerStartId != null) {
      outItems.add('marker-start="url(#$markerStartId)"');
    }

    if (markerMidId != null) {
      outItems.add('marker-mid="url(#$markerMidId)"');
    }

    if (markerEndId != null) {
      outItems.add('marker-end="url(#$markerEndId)"');
    }

    outItems.add('/>');

    return outItems.join(' ');
  }
}
