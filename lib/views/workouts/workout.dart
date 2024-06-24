import 'package:fitnessapp/main.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:modular_ui/modular_ui.dart';
import 'package:fitnessapp/views/navigation_menu.dart';
import 'package:fitnessapp/models/fitnessworkout.dart';

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
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: generateWorkOutsList(),
      ),
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      bottomNavigationBar: const NavigationBanner(
        title: 'navigation',
      ),
    );
  }
}
