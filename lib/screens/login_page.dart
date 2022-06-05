import 'package:e_shoew/widgets/custom_button.dart';
import 'package:e_shoew/widgets/input_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../constants.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: EdgeInsets.only(top: 24),
                child: Text(
                  "Welcome User,\n Login to your account",
                  style: Constants.boldHeading,
                  textAlign: TextAlign.center,
                ),
              ),
              Column(
                children: [
                  CustomInput(),
                  CustomInput(),
                  CustomBtn(
                      text: "Login",
                      onPressed: () {
                        print("Login");
                      }),
                ],
              ),
              CustomBtn(
                  text: "Create New Account",
                  onPressed: () {
                    print("Clicked");
                  },
                  outlineBtn: true),
            ],
          ),
        ),
      ),
    );
  }
}
