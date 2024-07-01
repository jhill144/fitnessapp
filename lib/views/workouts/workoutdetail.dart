import 'package:flutter/material.dart';
import 'package:fitnessapp/models/fitnessworkout.dart';

class WorkoutDetailPage extends StatefulWidget {
  const WorkoutDetailPage({super.key, required this.fitnessworkout});

  final Fitnessworkout fitnessworkout;
  @override
  State<WorkoutDetailPage> createState() => _WorkoutDetailPageState();
}

class _WorkoutDetailPageState extends State<WorkoutDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.fitnessworkout.workoutName),
      ),
      body: Center(
        child: Column(
          children: [
            Text('Description: ${widget.fitnessworkout.workoutDescription}'),
            widget.fitnessworkout.workoutImage,
            const Text('Instructor: '),
            const Text('Schedule: '),
          ],
        ),
      ),
    );
  }
}
