import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:peruusafarimobicomponents/icons.dart';

class PeruuAppAlert extends StatelessWidget {
  final String title;
  final String action;
  final String subtitle;
  final VoidCallback onPressAction;

  const PeruuAppAlert({
    Key key,
    @required this.title,
    @required this.action,
    @required this.subtitle,
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
          _alertIcon(),
          _alertTitle(context),
          _alertSubtitle(context),
          _alertAction(context),
          SizedBox(
            height: 72.0,
            width: double.infinity,
          )
        ],
      ),
    );
  }

  Widget _alertIcon() {
    return Icon(
      PeruuIcons.alert,
      size: 76.0,
    );
  }

  Widget _alertTitle(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 32.0),
      child: Text(
        title,
        style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w600, color: Theme.of(context).iconTheme.color),
      ),
    );
  }

  Widget _alertSubtitle(BuildContext context) {
    double width = MediaQuery.of(context).size.width * 0.75;
    return Container(
      width: width,
      margin: EdgeInsets.only(top: 8.0),
      child: Text(
        subtitle,
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w500, color: Theme.of(context).iconTheme.color),
      ),
    );
  }

  Widget _alertAction(BuildContext context) {
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
