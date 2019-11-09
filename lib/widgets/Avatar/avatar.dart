import 'package:advertise_it/themes/colors.dart';
import 'package:advertise_it/widgets/LoadImage/loadImage.dart';
import 'package:flutter/material.dart';

class Avatar extends StatelessWidget {
  final String avatarUrl;
  final double size;

  Avatar({@required this.avatarUrl, this.size});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      maxRadius: size ?? 30,
      backgroundColor: appPink,
      child: ClipRRect(
        child: CustomImage(imageUrl: avatarUrl),
        borderRadius: BorderRadius.all(
          Radius.circular(200.0),
        ),
      ),
    );
  }
}
