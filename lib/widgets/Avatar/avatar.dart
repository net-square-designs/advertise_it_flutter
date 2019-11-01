import 'package:flutter/material.dart';

class Avatar extends StatelessWidget {
  final String avatarUrl;
  final double size;

  Avatar({@required this.avatarUrl, this.size});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      maxRadius: size ?? 30,
      backgroundColor: Colors.grey,
      backgroundImage: NetworkImage(avatarUrl),
    );
  }
}
