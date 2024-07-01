import 'package:fitnessapp/utilities/route_constants.dart';
import 'package:fitnessapp/utilities/database_helper.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final dbHelper = DatabaseHelper();

class LoginPage extends StatefulWidget {
  const LoginPage({super.key, required this.title});

  final String title;
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  void initState() {
    super.initState();
    dbHelper.init();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Column(
      children: [
        Image.asset('assets/istockphoto-1397734203-612x612.jpg'),
        ElevatedButton(
            onPressed: () async {
              final intCount = await dbHelper.queryRowCount();
              print(intCount);
              if (intCount == 0) {
                context.goNamed(RouteConstants.questionnaire);
              } else {
                context.goNamed(RouteConstants.workout);
              }
            },
            child: const Text('Open App')),
      ],
      /*MUISignInCard(
        emailController: TextEditingController(),
        passwordController: TextEditingController(),
        onSignInPressed: () async {
          context.goNamed("/home");
        },
        onRegisterNow: () async {
          context.pushNamed("/register");
        },
      )),*/
    )));
  }
}
