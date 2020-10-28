import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';
import 'package:peruusafarimobicomponents/widgets.dart';
import 'package:cached_network_image/cached_network_image.dart';

class HomeDialogs {
  static void showGalleryDialog({
    @required String title,
    @required List<String> images,
    @required BuildContext context,
  }) {
    showGeneralDialog(
      barrierLabel: "Barrier",
      barrierDismissible: false,
      barrierColor: Colors.black.withOpacity(0.5),
      transitionDuration: Duration(milliseconds: 500),
      context: context,
      pageBuilder: (_, __, ___) {
        return Scaffold(
          appBar: PeruuTitleAppBar(
            title: title,
            onClickBack: () {
              Navigator.of(context, rootNavigator: true).pop();
            },
          ),
          body: PhotoViewGallery.builder(
            itemCount: images.length,
            scrollPhysics: BouncingScrollPhysics(),
            backgroundDecoration: BoxDecoration(
              color: Theme.of(context).canvasColor,
            ),
            loadingBuilder: (context, event) {
              return Image.asset('assets/images/cover.png');
            },
            builder: (context, index) {
              return PhotoViewGalleryPageOptions(
                maxScale: PhotoViewComputedScale.covered * 2,
                minScale: PhotoViewComputedScale.contained * 0.8,
                imageProvider: CachedNetworkImageProvider(images[index]),
              );
            },
          ),
        );
      },
    );
  }

  static void showErrorDialog({
    @required String title,
    @required String action,
    @required String subtitle,
    VoidCallback onClickAction,
    @required BuildContext context,
  }) {
    showGeneralDialog(
      barrierLabel: "Barrier",
      barrierDismissible: true,
      barrierColor: Colors.black.withOpacity(0.5),
      transitionDuration: Duration(milliseconds: 500),
      context: context,
      pageBuilder: (_, __, ___) {
        return Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            height: 132.0,
            width: double.infinity,
            margin: EdgeInsets.only(
              left: 12,
              right: 12,
              bottom: 60,
            ),
            padding: EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
              color: Theme.of(context).scaffoldBackgroundColor,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.subtitle1.copyWith(fontSize: 18.0, fontWeight: FontWeight.w700),
                ),
                Text(
                  subtitle,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.subtitle2.copyWith(
                        fontSize: 16.0,
                        fontWeight: FontWeight.w500,
                      ),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ButtonTheme(
                      height: 32,
                      minWidth: 76,
                      textTheme: ButtonTextTheme.primary,
                      buttonColor: Theme.of(context).accentColor,
                      shape: ContinuousRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: RaisedButton(
                        elevation: 0,
                        hoverElevation: 0,
                        focusElevation: 0,
                        highlightElevation: 0,
                        child: Text(
                          action,
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        onPressed: () {
                          if (onClickAction != null) {
                            onClickAction();
                          }
                          Navigator.of(context, rootNavigator: true).pop();
                        },
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        );
      },
      transitionBuilder: (_, anim, __, child) {
        return SlideTransition(
          position: Tween(begin: Offset(0, 1), end: Offset(0, 0)).animate(anim),
          child: child,
        );
      },
    );
  }
}
