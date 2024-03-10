import 'package:flutter/material.dart';
import 'package:hello_aisha1/config.dart';

// ignore: must_be_immutable
class InputTextField extends StatefulWidget {
  String labelText;
  TextEditingController controller;
  bool obscured;

  InputTextField({
    required this.labelText,
    required this.controller,
    this.obscured = false,
  });

  @override
  State<InputTextField> createState() => _InputTextFieldState();
}

class _InputTextFieldState extends State<InputTextField> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: fullWidth(context) * 0.9,
      height: fullHeight(context) * 0.06,
      child: TextField(
        controller: widget.controller,
        obscureText: widget.obscured,
        decoration: InputDecoration(
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          labelText: widget.labelText,
          labelStyle: const TextStyle(color: Colors.grey),
          suffixIcon: widget.obscured
              ? IconButton(
                  icon: const Icon(Icons.visibility),
                  onPressed: () {
                    setState(() {
                      widget.obscured = !widget.obscured;
                    });
                  },
                )
              : null,
        ),
      ),
    );
  }
}
