import 'package:flutter_test/flutter_test.dart';
import 'package:simple_svg/define/widget.dart';
import 'package:simple_svg/define/sstyle.dart';

void main() {
  test('widget', () {
    final widget = Widget('s1');
    expect(widget.shapeId, 's1');
    expect(widget.sstyle, null);
  });

  test('format basic', () {
    final widget = Widget('s1');
    widget.precision = 4;
    expect(widget.format(), '<use xlink:href="#s1" />');
  });

  test('format fill', () {
    var sstyle = Sstyle();
    sstyle.precision = 4;
    sstyle.fill = '#BBC42A';

    var widget = Widget('s1');
    widget.sstyle = sstyle;

    expect(widget.format(), '<use xlink:href="#s1" fill="#BBC42A" />');
  });

  test('format at', () {
    var widget1 = Widget('s1');
    widget1.precision = 4;
    widget1.at = (0, 0);
    expect(widget1.format(), '<use xlink:href="#s1" />');

    var widget2 = Widget('s1');
    widget2.precision = 4;
    widget2.at = (100.0, 50.0);
    expect(widget2.format(), '<use xlink:href="#s1" x="100" y="50" />');
  });

  test('format else', () {
    var widget = Widget('s1');
    widget.precision = 4;
    widget.filterId = 's2';
    widget.markerStartId = 's3';
    widget.markerMidId = 's4';
    widget.markerEndId = 's5';

    expect(widget.format(),
        '<use xlink:href="#s1" filter="url(#s2)" marker-start="url(#s3)" marker-mid="url(#s4)" marker-end="url(#s5)" />');
  });
}
