import 'package:advertise_it/widgets/Loaders/loaders.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

Widget mediaItem({@required mediaUrl, mediaType = 'image'}) {
  Widget image = CachedNetworkImage(
    imageUrl: mediaUrl,
    placeholder: (context, url) => circleLoader(),
    errorWidget: (context, url, error) => Icon(Icons.error),
  );

  return ClipRRect(
    child: image,
    borderRadius: BorderRadius.only(
      topLeft: Radius.circular(20.0),
      topRight: Radius.circular(20.0),
    ),
  );
}
