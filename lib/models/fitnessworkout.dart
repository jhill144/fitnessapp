import 'package:uuid/uuid.dart';
import 'package:flutter/material.dart';

//  This is a model for workouts

class Fitnessworkout {
  Uuid workoutId;
  String workoutName;
  String workoutDescription;
  Icon workoutIcon;

  Fitnessworkout({
    required this.workoutId,
    required this.workoutName,
    required this.workoutDescription,
    required this.workoutIcon,
  });
}
