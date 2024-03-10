
import 'package:flutter/material.dart';
import 'package:hello_aisha1/config.dart';

class ButtonWidget extends StatefulWidget {
  final Function()? onPressed;
  final String? title;
  final Color color;
  final Color textColor;

  const ButtonWidget({
    super.key,
    this.onPressed,
    this.title,
    this.color = Colors.blue,
    this.textColor = Colors.white,
  });

  @override
  State<ButtonWidget> createState() => _ButtonWidgetState();
}

class _ButtonWidgetState extends State<ButtonWidget> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: fullWidth(context) * 0.9,
      height: fullHeight(context) * 0.06,
      child: ElevatedButton(
          onPressed: widget.onPressed,
          style: ElevatedButton.styleFrom(
              backgroundColor: widget.color,
              elevation: 3,
              foregroundColor: widget.textColor,
              textStyle: TextStyle(
                  fontWeight: FontWeight.w800,
                  fontSize: fontSize10(context) * 1.2)),
          child: Text(
            widget.title!,
          )),
    );
  }
}
