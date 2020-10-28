import 'package:flutter/material.dart';
import 'package:peruusafarimobicomponents/src/icons/peruuicons.dart';

class PeruuMainAppBar extends AppBar {
  final BuildContext context;
  final List<Widget> actions;
  final PreferredSizeWidget bottom;
  final VoidCallback onClickLeading;
  PeruuMainAppBar({
    this.context,
    this.actions,
    this.bottom,
    this.onClickLeading,
  }) : super(
          textTheme: Theme.of(context).textTheme,
          iconTheme: Theme.of(context).iconTheme,
          leading: IconButton(
            icon: Icon(
              PeruuIcons.menu,
              color: Theme.of(context).appBarTheme.iconTheme.color,
            ),
            hoverColor: Colors.transparent,
            focusColor: Colors.transparent,
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onPressed: () => onClickLeading(),
          ),
          actions: actions,
          bottom: bottom,
        );
}