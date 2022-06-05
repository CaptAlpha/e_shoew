import 'package:e_shoew/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

class CustomInput extends StatelessWidget {
  final String hintText;
  String value = "value";

  final Function(String) onChanged;
  final Function(String) onSubmit;
  final FocusNode focusNode;

  final bool isPassword;
  CustomInput(
      {Key? key,
      this.hintText = "text",
      required this.onChanged,
      required this.onSubmit,
      required this.focusNode,
      required TextInputAction textInputAction,
      required this.isPassword})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isPasswordField = isPassword ?? false;
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 24.0, vertical: 8.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: Color.fromARGB(255, 211, 211, 211),
      ),
      child: TextField(
        obscureText: isPasswordField,
        focusNode: focusNode,
        onChanged: onChanged,
        onSubmitted: onSubmit,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: hintText,
          contentPadding: EdgeInsets.symmetric(horizontal: 20.0),
        ),
        style: Constants.regularDarkText,
      ),
    );
  }
}
