import 'package:advertise_it/widgets/Avatar/avatar.dart';
import 'package:advertise_it/widgets/CustomText/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Product extends StatelessWidget {
  final String mediaUrl;
  final String views;
  final String likes;
  final String price;
  final String title;
  final String ownerName;
  final String avatarUrl;

  Product({
    this.mediaUrl,
    this.views,
    this.likes,
    this.price,
    this.ownerName,
    this.avatarUrl,
    this.title,
  });

  Widget postMedia({@required mediaUrl, mediaType = 'image'}) {
    return Flexible(
      child: ClipRRect(
        child: Image.network(mediaUrl),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.0),
          topRight: Radius.circular(20.0),
        ),
      ),
    );
  }

  Widget postTitle({
    @required String title,
    @required String ownerName,
    @required String ownerAvatar,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 25),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              CustomText(
                title,
                styleName: StyleName.title,
              ),
              CustomText(
                'by $ownerName',
                styleName: StyleName.caption,
              ),
            ],
          ),
          Avatar(
            avatarUrl: avatarUrl,
            size: 20,
          )
        ],
      ),
    );
  }

  Widget postActions({
    @required int views,
    @required int likes,
    @required int price,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            children: <Widget>[
              Icon(Icons.remove_red_eye, size: 18),
              SizedBox(width: 2),
              CustomText('$views'),
            ],
          ),
          Row(
            children: <Widget>[
              Icon(Icons.favorite, size: 18),
              SizedBox(width: 2),
              CustomText('$likes')
            ],
          ),
          Icon(FontAwesomeIcons.solidCommentDots, size: 18),
          Icon(FontAwesomeIcons.share, size: 18),
          CustomText('N $price')
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          postMedia(mediaUrl: mediaUrl),
          postTitle(
            title: title,
            ownerAvatar: avatarUrl,
            ownerName: ownerName,
          ),
          postActions(views: int.parse(views), likes: int.parse(likes), price: 200)
        ],
      ),
    );
  }
}
