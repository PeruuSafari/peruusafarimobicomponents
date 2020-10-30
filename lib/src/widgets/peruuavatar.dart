import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

enum AvatarPlaceholder { Bus, User }

Map<AvatarPlaceholder, String> placeholders = {
  AvatarPlaceholder.Bus: 'assets/images/bus.png',
  AvatarPlaceholder.User: 'assets/images/user.png'
};

class PeruuAvatar extends StatelessWidget {
  final double size;
  final String imageurl;
  final AvatarPlaceholder placeholder;

  const PeruuAvatar({
    Key key,
    this.size,
    @required this.imageurl,
    @required this.placeholder,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: CachedNetworkImage(
        imageUrl: imageurl,
        fit: BoxFit.cover,
        width: size ?? 36.0,
        height: size ?? 36.0,
        placeholder: (context, url) {
          return Image.asset(
            placeholders[placeholder],
            fit: BoxFit.cover,
            width: size ?? 36.0,
            height: size ?? 36.0,
          );
        },
        errorWidget: (context, url, error) {
          return Image.asset(
            placeholders[placeholder],
            fit: BoxFit.cover,
            width: size ?? 36.0,
            height: size ?? 36.0,
          );
        },
      ),
    );
  }
}
