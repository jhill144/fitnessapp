import 'package:flutter/material.dart';
import 'package:fitnessapp/views/navigation_menu.dart';

class WorkoutDetailPage extends StatefulWidget {
  const WorkoutDetailPage({super.key, required this.title});

  final String title;
  @override
  State<WorkoutDetailPage> createState() => _WorkoutDetailPageState();
}

class _WorkoutDetailPageState extends State<WorkoutDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: const Center(
        child: Text(''),
      ),
      bottomNavigationBar: const NavigationBanner(
        title: 'navigation',
      ),
    );
  }
}
