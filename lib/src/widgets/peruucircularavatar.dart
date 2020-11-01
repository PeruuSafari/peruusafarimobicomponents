import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class PeruuCircularAvatar extends StatelessWidget {
  final double size;
  final String imageurl;
  final String assetimageurl;

  const PeruuCircularAvatar({
    Key key,
    this.size,
    @required this.imageurl,
    @required this.assetimageurl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: size == null ? 16.0 : size / 2,
      backgroundColor: Colors.transparent,
      child: ClipOval(
        child: CachedNetworkImage(
          imageUrl: imageurl,
          fit: BoxFit.cover,
          width: size ?? 32.0,
          height: size ?? 32.0,
          placeholder: (context, url) {
            return Image.asset(
              assetimageurl,
              fit: BoxFit.cover,
              width: size ?? 32.0,
              height: size ?? 32.0,
            );
          },
          errorWidget: (context, url, error) {
            return Image.asset(
              assetimageurl,
              fit: BoxFit.cover,
              width: size ?? 32.0,
              height: size ?? 32.0,
            );
          },
        ),
      ),
    );
  }
}
