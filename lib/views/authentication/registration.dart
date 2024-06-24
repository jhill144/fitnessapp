import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:modular_ui/modular_ui.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({super.key, required this.title});

  final String title;
  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: MUISignUpCard(
        emailController: TextEditingController(),
        passwordController: TextEditingController(),
        confirmPasswordController: TextEditingController(),
        onSignUpPressed: () async {
          context.goNamed("/questionnaire");
        },
        onLogInNowPressed: () async {
          context.pushNamed("/login");
        },
      )),
    );
  }
}
