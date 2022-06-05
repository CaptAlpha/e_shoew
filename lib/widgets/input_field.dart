import 'package:e_shoew/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

class CustomInput extends StatelessWidget {
  const CustomInput({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 20.0),
      color: Colors.grey[200],
      child: TextField(
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: "Email",
          contentPadding: EdgeInsets.symmetric(horizontal: 20.0),
        ),
        style: Constants.regularDarkText,
      ),
    );
  }
}
