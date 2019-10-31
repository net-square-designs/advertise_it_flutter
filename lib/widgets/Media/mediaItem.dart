import 'package:flutter/material.dart';

Widget mediaItem({@required mediaUrl, mediaType = 'image'}) {
    return ClipRRect(
      child: Image.network(mediaUrl),
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(20.0),
        topRight: Radius.circular(20.0),
      ),
    );
  }