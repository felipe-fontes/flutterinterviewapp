import 'package:flutter/material.dart';

class CommonTextField extends StatefulWidget {
  const CommonTextField({
    @required this.onChanged,
    @required this.label,
    this.obscureText = false,
    Key key,
  }) : super(key: key);

  final void Function(String text) onChanged;
  final String label;
  final bool obscureText;

  @override
  _CommonTextFieldState createState() => _CommonTextFieldState();
}

class _CommonTextFieldState extends State<CommonTextField> {
  FocusNode _focusNode;

  @override
  void initState() {
    _focusNode = FocusNode();

    _focusNode.addListener(() {
      setState(() {
        //Redraw so that the password label reflects the focus state
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      child: TextField(
        onChanged: this.widget.onChanged,
        style: Theme.of(context).textTheme.caption,
        obscureText: widget.obscureText,
        decoration: InputDecoration(
          labelText: widget.label,
          labelStyle: TextStyle(
            color: _focusNode.hasFocus
                ? Theme.of(context).accentColor
                : Colors.grey[600],
          ),
        ),
        focusNode: _focusNode,
      ),
    );
  }
}
