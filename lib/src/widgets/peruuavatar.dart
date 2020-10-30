import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class PeruuAvatar extends StatelessWidget {
  final double size;
  final String imageurl;
  final String assetimageurl;

  const PeruuAvatar({
    Key key,
    this.size,
    @required this.imageurl,
    @required this.assetimageurl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: size / 2 ?? 18.0,
      backgroundColor: Colors.transparent,
      child: ClipOval(
        child: CachedNetworkImage(
          imageUrl: imageurl,
          fit: BoxFit.cover,
          width: size ?? 36.0,
          height: size ?? 36.0,
          placeholder: (context, url) {
            return Image.asset(
              assetimageurl,
              fit: BoxFit.cover,
              width: size ?? 36.0,
              height: size ?? 36.0,
            );
          },
          errorWidget: (context, url, error) {
            return Image.asset(
              assetimageurl,
              fit: BoxFit.cover,
              width: size ?? 36.0,
              height: size ?? 36.0,
            );
          },
        ),
      ),
    );
  }
}
