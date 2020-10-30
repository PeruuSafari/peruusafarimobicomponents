import 'package:flutter/material.dart';
import 'package:peruusafarimobicomponents/src/icons/peruuicons.dart';

class PeruuMainAppBar extends AppBar {
  final BuildContext context;
  final List<Widget> actions;
  final VoidCallback onClickMenu;
  final PreferredSizeWidget bottom;
  PeruuMainAppBar({
    @required this.context,
    @required this.actions,
    @required this.bottom,
    @required this.onClickMenu,
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
            onPressed: () => onClickMenu(),
          ),
          actions: actions,
          bottom: bottom,
        );
}
