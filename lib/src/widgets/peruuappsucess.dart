import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';

class PeruuAppSuccess extends StatelessWidget {
  final String title;
  final String action;
  final IconData successIcon;
  final VoidCallback onPressAction;

  const PeruuAppSuccess({
    Key key,
    @required this.title,
    @required this.action,
    @required this.successIcon,
    @required this.onPressAction,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(child: Container()),
          Icon(
            successIcon,
            size: 76.0,
            color: Theme.of(context).accentColor,
          ),
          _successTitle(context),
          _successAction(context),
          SizedBox(
            height: 120,
            width: double.infinity,
          )
        ],
      ),
    );
  }

  Widget _successTitle(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 32.0),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 20.0,
          fontWeight: FontWeight.w500,
          color: Theme.of(context).textTheme.subtitle1.color,
        ),
      ),
    );
  }

  Widget _successAction(BuildContext context) {
    double width = MediaQuery.of(context).size.width * 0.25;
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.only(top: 16.0),
      padding: EdgeInsets.symmetric(horizontal: width / 2),
      child: ButtonTheme(
        height: 48.0,
        minWidth: double.infinity,
        textTheme: ButtonTextTheme.primary,
        buttonColor: Theme.of(context).accentColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(48.0),
        ),
        child: RaisedButton(
          elevation: 0,
          hoverElevation: 0,
          focusElevation: 0,
          highlightElevation: 0,
          child: Text(
            action,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w700,
            ),
          ),
          onPressed: () {
            onPressAction();
          },
        ),
      ),
    );
  }
}
