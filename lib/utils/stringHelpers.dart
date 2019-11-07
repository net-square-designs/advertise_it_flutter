import 'package:flutter/foundation.dart';

String truncateWithEllipsis({int cutoff = 40, @required String text}) {
  return (text.length <= cutoff) ? text : '${text.substring(0, cutoff)}...';
}