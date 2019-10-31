import 'package:flutter/material.dart';

Widget topNavigation({
  Widget title,
  Widget leading,
  List<Widget> actions,
  PreferredSizeWidget bottom,
}) {
  return AppBar(
    title: Container(height: 35.0, child: Center(child: title)),
    elevation: 1.0,
    leading: leading ?? null,
    actions: actions ?? null,
    bottom: bottom ?? null,
    automaticallyImplyLeading: false,
  );
}
