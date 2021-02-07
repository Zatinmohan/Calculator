import 'package:flutter/material.dart';

class ButtonsSection extends StatelessWidget {
  final String text;
  final Color color;
  final Function callback;

  const ButtonsSection({Key key, this.callback, this.text, this.color})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ButtonTheme(
      height: 60.0,
      minWidth: 60.0,
      child: RaisedButton(
        onPressed: () {
          callback(text);
        },
        child: Text(
          '$text',
          style: TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.w600,
            color: color,
          ),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        color: Theme.of(context).accentColor,
      ),
    );
  }
}
