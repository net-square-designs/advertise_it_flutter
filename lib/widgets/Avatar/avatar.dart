import 'package:advertise_it/themes/colors.dart';
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
      backgroundImage: NetworkImage(avatarUrl),
    );
  }
}
