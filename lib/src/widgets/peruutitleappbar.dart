import 'package:flutter/material.dart';
import 'package:peruusafarimobicomponents/src/icons/peruuicons.dart';

class PeruuTitleAppBar extends AppBar {
  PeruuTitleAppBar({
    Key key,
    List<Widget> actions,
    @required String title,
    @required VoidCallback onClickBack,
  }) : super(
          key: key,
          elevation: 0.0,
          actions: actions,
          leading: IconButton(
            icon: Icon(PeruuIcons.back),
            hoverColor: Colors.transparent,
            focusColor: Colors.transparent,
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onPressed: () {
              onClickBack();
            },
          ),
          title: Container(
            child: Text(title),
            transform: Matrix4.translationValues(-12.0, 0.0, 0.0),
          ),
        );
}
