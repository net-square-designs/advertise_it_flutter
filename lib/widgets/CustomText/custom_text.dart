import 'package:flutter/material.dart';

enum StyleName { headline, subhead, title, subtitle, body1, body2, caption }

class CustomText extends StatelessWidget {
  final String text;
  final StyleName styleName;
  final TextStyle style;
  final Color color;

  CustomText(this.text, {this.styleName, this.style, this.color});

  TextStyle getStyle(context, styleName, {color = Colors.white}) {
    if (style != null) {
      return style;
    }
    switch (styleName) {
      case StyleName.headline:
        return Theme.of(context).textTheme.headline.copyWith(color: color);
        break;
      case StyleName.subhead:
        return Theme.of(context).textTheme.subhead.copyWith(color: color);
        break;
      case StyleName.title:
        return Theme.of(context).textTheme.title.copyWith(color: color);
        break;
      case StyleName.subtitle:
        return Theme.of(context).textTheme.subtitle.copyWith(color: color);
        break;
      case StyleName.body1:
        return Theme.of(context).textTheme.body1.copyWith(color: color);
        break;
      case StyleName.body2:
        return Theme.of(context).textTheme.body2.copyWith(color: color);
        break;
      case StyleName.caption:
        return Theme.of(context).textTheme.caption.copyWith(color: color);
        break;
      default:
        return Theme.of(context).textTheme.body1.copyWith(color: color);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: getStyle(context, styleName, color: color),
    );
  }
}
