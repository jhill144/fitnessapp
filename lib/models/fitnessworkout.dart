import 'package:uuid/uuid.dart';
import 'package:flutter/material.dart';
import 'package:fitnessapp/utilities/enums.dart';

//  This is a model for workouts

class Fitnessworkout {
  Uuid workoutId;
  String workoutName;
  String workoutDescription;
  Icon workoutIcon;
  WorkoutCategory workoutCategory;

  Fitnessworkout({
    required this.workoutId,
    required this.workoutName,
    required this.workoutDescription,
    required this.workoutIcon,
    required this.workoutCategory,
  });
}

Widget generateWorkOutsList() {
  final List<Fitnessworkout> entries = <Fitnessworkout>[
    Fitnessworkout(
        workoutId: const Uuid(),
        workoutName: "Squats",
        workoutDescription: "Squatting",
        workoutIcon: Icon(Icons.king_bed),
        workoutCategory: WorkoutCategory.strengthening),
    Fitnessworkout(
        workoutId: const Uuid(),
        workoutName: "Pushups",
        workoutDescription: "Pushing Up",
        workoutIcon: Icon(Icons.access_alarm),
        workoutCategory: WorkoutCategory.lowimpact),
    Fitnessworkout(
        workoutId: const Uuid(),
        workoutName: "Bird Dog",
        workoutDescription: "Bird Doggy",
        workoutIcon: Icon(Icons.air),
        workoutCategory: WorkoutCategory.meditation),
  ];

  return ListView.separated(
      itemBuilder: (BuildContext context, int index) {
        return Container(
          height: 50,
          color: Colors.amber,
          child: Center(
            child: Text('Entry ${entries[index].workoutName}'),
          ),
        );
      },
      separatorBuilder: (BuildContext context, int index) => const Divider(),
      itemCount: entries.length);
}
