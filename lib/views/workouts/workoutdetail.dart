import 'package:flutter/material.dart';
import 'package:fitnessapp/models/fitnessworkout.dart';
import 'package:fitnessapp/utilities/database_helper.dart';
import 'package:sqflite/sqflite.dart';

class WorkoutDetailPage extends StatefulWidget {
  const WorkoutDetailPage({super.key, required this.fitnessworkout});

  final Fitnessworkout fitnessworkout;
  @override
  State<WorkoutDetailPage> createState() => _WorkoutDetailPageState();
}

class _WorkoutDetailPageState extends State<WorkoutDetailPage> {
  @override
  void initState() {
    super.initState();
    DatabaseHelper.instance.database;

    _getRoutines();
  }

  _getRoutines() async {
    Database dbHelper = await DatabaseHelper.instance.database;
    final routineList =
        await dbHelper.rawQuery('SELECT * FROM ${DatabaseHelper.workoutTable}');
    print(routineList.toString());
  }

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
            ElevatedButton(
                onPressed: () {}, child: const Text('Add to Routine: ')),
          ],
        ),
      ),
    );
  }
}
