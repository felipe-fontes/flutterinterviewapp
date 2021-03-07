import 'package:flutter/material.dart';

class CommonButton extends StatelessWidget {
  const CommonButton({
    Key key,
    this.onPressed,
    this.text,
  }) : super(key: key);
  final Function onPressed;
  //final Widget child;
  final String text;

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4.0),
      ),
      onPressed: this.onPressed,
      child: Text(
        this.text,
        style: Theme.of(context).textTheme.caption,
      ),
    );
  }
}
