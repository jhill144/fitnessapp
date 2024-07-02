import 'package:fitnessapp/models/fitnessuser.dart';
import 'package:fitnessapp/utilities/route_constants.dart';
import 'package:flutter/material.dart';
import 'package:fitnessapp/models/fitnessworkout.dart';
import 'package:fitnessapp/utilities/database_helper.dart';
import 'package:go_router/go_router.dart';
import 'package:sqflite/sqflite.dart';
import 'package:uuid/uuid.dart';

List<Fitnessworkout> allWorkouts = [];
Fitnessworkout thisFitnessworkout = Fitnessworkout();

class WorkoutDetailPage extends StatefulWidget {
  const WorkoutDetailPage({super.key, required this.fitnessworkout});

  final Fitnessworkout fitnessworkout;

  @override
  State<WorkoutDetailPage> createState() => _WorkoutDetailPageState();
}

class _WorkoutDetailPageState extends State<WorkoutDetailPage> {
  String routineText = 'Remove from Routine';
  String buttonText = 'Add to Routine';
  bool foundRoutine = false;

  @override
  void initState() {
    super.initState();
    DatabaseHelper.instance.database;

    allWorkouts = getWorkouts();
    _getRoutines();
  }

  void changeText() {
    setState(() {
      if (foundRoutine) {
        buttonText = routineText;
      } else {
        buttonText = 'Add to Routine';
      }
    });
  }

  _getRoutines() async {
    Database dbHelper = await DatabaseHelper.instance.database;
    final routineList =
        await dbHelper.rawQuery('SELECT * FROM ${DatabaseHelper.workoutTable}');
    routineList.forEach(
      (element) {
        //print(element[DatabaseHelper.columnWorkoutID]);
        if (element[DatabaseHelper.columnWorkoutID]
            .toString()
            .toLowerCase()
            .contains(widget.fitnessworkout.workoutId.toLowerCase())) {
          foundRoutine = true;
          //funcElevated
          changeText();
        }
      },
    );
  }

  _execWorkoutRoutine() {
    if (foundRoutine) {
      _removeWorkoutRoutine();
    } else {
      _addWorkoutRoutine();
    }
  }

  _addWorkoutRoutine() async {
    Database dbHelper = await DatabaseHelper.instance.database;
    Map<String, dynamic> row = {
      DatabaseHelper.columnWorkoutID: widget.fitnessworkout.workoutId,
      DatabaseHelper.columnId: 1,
      DatabaseHelper.columnWorkoutReps: 0,
      DatabaseHelper.columnWorkoutDuration: 0,
      DatabaseHelper.columnWorkoutSets: 0,
      DatabaseHelper.columnWorkoutWeights: 0
    };
    final addRoutine = await dbHelper.insert(DatabaseHelper.workoutTable, row);

    context.goNamed(RouteConstants.workout);
  }

  _removeWorkoutRoutine() async {
    Database dbHelper = await DatabaseHelper.instance.database;
    Map<String, dynamic> row = {
      DatabaseHelper.columnWorkoutID: widget.fitnessworkout.workoutId,
      DatabaseHelper.columnId: 1
    };
    final removeRoutine = await dbHelper.delete(DatabaseHelper.workoutTable,
        where:
            '${DatabaseHelper.columnWorkoutID} = "${widget.fitnessworkout.workoutId}"');
    context.goNamed(RouteConstants.workout);
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
                onPressed: () {
                  _execWorkoutRoutine();
                },
                child: Text(buttonText)),
          ],
        ),
      ),
    );
  }
}
