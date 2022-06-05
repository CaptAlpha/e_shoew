import 'package:e_shoew/screens/register_page.dart';
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
  String registerEmail = '';
  String registerPassword = '';

  //FocusNode
  late FocusNode passwordFocusNode;

  void initState() {
    super.initState();
    passwordFocusNode = FocusNode();
  }

  void dispose() {
    passwordFocusNode.dispose();
    super.dispose();
  }

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
                  CustomInput(
                    hintText: "Email",
                    onChanged: (value) {
                      registerEmail = value;
                    },
                    onSubmit: (value) {
                      passwordFocusNode.requestFocus();
                    },
                    focusNode: FocusNode(),
                    textInputAction: TextInputAction.next,
                    isPassword: false,
                  ),
                  CustomInput(
                    hintText: "Password",
                    onChanged: (value) {
                      registerPassword = value;
                    },
                    onSubmit: (value) {
                      passwordFocusNode.unfocus();
                    },
                    focusNode: passwordFocusNode,
                    textInputAction: TextInputAction.done,
                    isPassword: true,
                  ),
                  CustomBtn(
                      text: "Login",
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LoginPage()));
                      }),
                ],
              ),
              CustomBtn(
                  text: "Create New Account",
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => RegisterPage()));
                  },
                  outlineBtn: true),
            ],
          ),
        ),
      ),
    );
  }
}
