import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CustomCachedNetworkImage extends StatelessWidget {
  final String imageurl;
  final String placeHolderImgUrl;
  const CustomCachedNetworkImage({Key key, this.imageurl, this.placeHolderImgUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageurl,
      placeholder: (_, __) => Image.asset(placeHolderImgUrl ?? 'assets/images/home/swiper.png', fit: BoxFit.cover),
      fit: BoxFit.cover,
    );
  }
}
