import 'package:e_shoew/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../constants.dart';
import '../widgets/input_field.dart';
import 'login_page.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  Future showAlertDialog(BuildContext context) async {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Error'),
          content: Text('You are registered successfully'),
          actions: <Widget>[
            TextButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => LoginPage()));
              },
            ),
          ],
        );
      },
    );
  }

  bool _isLoading = false;

  //Form Input Fields

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
                  "Welcome User,\n Create your account",
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
                    text: "Create",
                    onPressed: () {
                      setState(() {
                        _isLoading = true;
                      });
                    },
                    isLoading: _isLoading,
                  ),
                ],
              ),
              CustomBtn(
                  text: "Back to Login",
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => LoginPage()));
                  },
                  outlineBtn: true),
            ],
          ),
        ),
      ),
    );
  }
}
