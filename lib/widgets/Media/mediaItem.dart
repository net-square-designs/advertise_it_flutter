import 'package:advertise_it/widgets/LoadImage/loadImage.dart';
import 'package:flutter/material.dart';

Widget mediaItem({@required mediaUrl, mediaType = 'image'}) {
  Widget image = CustomImage(imageUrl: mediaUrl);

  return ClipRRect(
    child: image,
    borderRadius: BorderRadius.only(
      topLeft: Radius.circular(20.0),
      topRight: Radius.circular(20.0),
    ),
  );
}
