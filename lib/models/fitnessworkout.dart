import 'package:fitnessapp/utilities/route_constants.dart';
import 'package:go_router/go_router.dart';
import 'package:uuid/uuid.dart';
import 'package:flutter/material.dart';
import 'package:fitnessapp/utilities/enums.dart';

//  This is a model for workouts

class Fitnessworkout {
  Uuid workoutId;
  String workoutName;
  String workoutDescription;
  Icon workoutIcon;
  Image workoutImage;
  Image workoutThumbnail;
  WorkoutCategory workoutCategory;

  Fitnessworkout({
    required this.workoutId,
    required this.workoutName,
    required this.workoutDescription,
    required this.workoutIcon,
    required this.workoutImage,
    required this.workoutThumbnail,
    required this.workoutCategory,
  });
}

Widget generateWorkOutsList() {
  final List<Fitnessworkout> entries = <Fitnessworkout>[
    Fitnessworkout(
        workoutId: const Uuid(),
        workoutName: "Squats",
        workoutDescription:
            "A squat is a strength exercise in which the trainee lowers their hips from a standing position and then stands back up.",
        workoutIcon: Icon(Icons.king_bed),
        workoutImage: Image.asset(
          'assets/man-doing-gym-front-squat-royalty-free-image-1649261343.jpg',
          width: 200,
          height: 100,
        ),
        workoutThumbnail: Image.asset(
          'assets/man-doing-gym-front-squat-royalty-free-image-1649261343.jpg',
          width: 100,
          height: 50,
        ),
        workoutCategory: WorkoutCategory.strengthening),
    Fitnessworkout(
        workoutId: const Uuid(),
        workoutName: "Pushups",
        workoutDescription:
            "Push-ups are a full-body exercise that can be done almost anywhere and work your chest, shoulders, arms, core muscles, and coordination.",
        workoutIcon: Icon(Icons.access_alarm),
        workoutImage: Image.asset(
          'assets/health-benefits-of-pushups-GettyImages-498315681-7008d40842444270868c88b516496884.jpg',
          width: 200,
          height: 100,
        ),
        workoutThumbnail: Image.asset(
          'assets/health-benefits-of-pushups-GettyImages-498315681-7008d40842444270868c88b516496884.jpg',
          width: 100,
          height: 50,
        ),
        workoutCategory: WorkoutCategory.lowimpact),
    Fitnessworkout(
        workoutId: const Uuid(),
        workoutName: "HIIT",
        workoutDescription:
            "High-intensity interval training (HIIT) is a type of exercise that alternates between short periods of intense anaerobic exercise and brief recovery periods.",
        workoutIcon: Icon(Icons.air),
        workoutImage: Image.asset(
          'assets/HIGH-INTENSITY-INTERVAL-TRAINING-HIIT-300x169.png',
          width: 200,
          height: 100,
        ),
        workoutThumbnail: Image.asset(
          'assets/HIGH-INTENSITY-INTERVAL-TRAINING-HIIT-300x169.png',
          width: 100,
          height: 50,
        ),
        workoutCategory: WorkoutCategory.hiit),
  ];

  return ListView.separated(
      itemBuilder: (BuildContext context, int index) {
        return Card(
            elevation: 3,
            child: ListTile(
              title: Text(
                entries[index].workoutName,
                style: TextStyle(color: Colors.white),
              ),
              tileColor: Colors.black,
              onTap: () {
                context.pushNamed(RouteConstants.workoutdetails,
                    extra: entries[index]);
              },
              trailing: entries[index].workoutThumbnail,
              contentPadding: EdgeInsets.all(20),
              dense: false,
            ));
      },
      separatorBuilder: (BuildContext context, int index) => const Divider(),
      itemCount: entries.length);
}
