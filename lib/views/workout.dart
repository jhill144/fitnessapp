import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:modular_ui/modular_ui.dart';

class WorkoutPage extends StatefulWidget {
  const WorkoutPage({super.key, required this.title});

  final String title;
  @override
  State<WorkoutPage> createState() => _WorkoutPageState();
}

class _WorkoutPageState extends State<WorkoutPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(),
    );
  }
}
