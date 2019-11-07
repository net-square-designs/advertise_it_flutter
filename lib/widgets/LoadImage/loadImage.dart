import 'package:advertise_it/widgets/CustomText/custom_text.dart';
import 'package:advertise_it/widgets/Loaders/loaders.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomImage extends StatelessWidget {
  final String imageUrl;
  final double containerHeight = 200;
  CustomImage({@required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    try {
      Widget image = CachedNetworkImage(
        fit: BoxFit.cover,
        imageUrl: imageUrl,
        placeholder: (context, url) => Container(
          height: containerHeight,
          child: Center(child: circleLoader()),
        ),
        errorWidget: (context, url, error) => Container(
          height: containerHeight,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(Icons.error),
              CustomText('Failed to load image'),
            ],
          ),
        ),
      );

      return Container(child: image, height: 300,);
    } on PlatformException {
      print('Image failed to load');
      return Container();
    }
  }
}

ImageProvider getImage(imageUrl, context) {
  final image = NetworkImage(imageUrl);
  bool imageFailedToLoad = false;

  precacheImage(image, context, onError: (e, stack) {
    print('$imageUrl failed to load');
    imageFailedToLoad = true;
  });

  return imageFailedToLoad ? AssetImage('assetName') : NetworkImage('url');
}
