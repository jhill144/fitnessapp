import 'package:fitnessapp/utilities/route_constants.dart';
import 'package:fitnessapp/utilities/database_helper.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sqflite/sqflite.dart';

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
  }

  _queryRecords() async {
    Database dbHelper = await DatabaseHelper.instance.database;
    final intCount =
        await dbHelper.rawQuery('SELECT COUNT(*) FROM ${DatabaseHelper.table}');
    /*print(
        '${intCount.first.values} - ${intCount.first.values.toString() == '(0)'}');*/

    if (intCount.isEmpty) {
      context.goNamed(RouteConstants.questionnaire);
    } else {
      if (intCount.first.values.toString() == '(0)') {
        context.goNamed(RouteConstants.questionnaire);
      } else {
        context.goNamed(RouteConstants.workout);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Column(
      children: [
        Image.asset('assets/istockphoto-1397734203-612x612.jpg'),
        ElevatedButton(
            onPressed: () {
              _queryRecords();
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
