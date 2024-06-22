import 'package:flutter/material.dart';
import 'package:modular_ui/modular_ui.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key, required this.title});

  final String title;
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: MUISignInCard(
        emailController: TextEditingController(),
        passwordController: TextEditingController(),
        onSignInPressed: () async {},
        onRegisterNow: () {},
      )),
    );
  }
}
