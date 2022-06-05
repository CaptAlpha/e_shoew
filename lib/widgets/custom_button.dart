import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../constants.dart';

class CustomBtn extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final bool outlineBtn;
  final bool isLoading;
  const CustomBtn(
      {required this.text,
      required this.onPressed,
      this.outlineBtn = false,
      this.isLoading = false});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: 60.0,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: outlineBtn ? Colors.transparent : Colors.black,
          border: Border.all(
            color: Colors.black,
            width: 2.0,
          ),
          borderRadius: BorderRadius.circular(10.0),
        ),
        margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
        child: Text(
          text,
          style: TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.w600,
            color: outlineBtn ? Colors.black : Colors.white,
          ),
        ),
      ),
    );
  }
}
