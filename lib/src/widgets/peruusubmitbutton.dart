import 'package:flutter/material.dart';

enum SubmitButtonType { Plain, Bordered }

class PeruuSubmitButton extends StatelessWidget {
  final String value;
  final VoidCallback onSubmit;
  final SubmitButtonType type;

  const PeruuSubmitButton({
    Key key,
    this.type,
    this.value,
    this.onSubmit,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 72.0,
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      decoration: type == SubmitButtonType.Bordered
          ? BoxDecoration(
              border: Border(
                top: BorderSide(
                  width: 1.0,
                  color: Theme.of(context).dividerColor,
                ),
              ),
            )
          : null,
      child: ButtonTheme(
        height: 48.0,
        minWidth: double.infinity,
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
            value,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w700,
            ),
          ),
          onPressed: () {
            onSubmit();
          },
        ),
      ),
    );
  }
}
