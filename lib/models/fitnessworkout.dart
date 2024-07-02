import 'package:uuid/uuid.dart';
import 'package:flutter/material.dart';
import 'package:fitnessapp/utilities/enums.dart';
import 'package:uuid/v1.dart';

//  This is a model for workouts
String defaultImage =
    'assets/man-doing-gym-front-squat-royalty-free-image-1649261343.jpg';

class Fitnessworkout {
  String workoutId;
  String workoutName;
  String workoutDescription;
  Icon workoutIcon;
  Image workoutImage;
  Image workoutThumbnail;
  WorkoutCategory workoutCategory;
  int workoutDuration;
  int workoutWeights;
  int workoutReps;
  int workoutSets;

  Fitnessworkout({
    this.workoutId = 'f8e06930-e68e-1062-93c9-779050ef9446',
    this.workoutName = '',
    this.workoutDescription = '',
    this.workoutIcon = const Icon(Icons.king_bed),
    this.workoutImage = const Image(image: AssetImage('')),
    this.workoutThumbnail = const Image(image: AssetImage('')),
    this.workoutCategory = WorkoutCategory.arms,
    this.workoutDuration = 0,
    this.workoutWeights = 0,
    this.workoutReps = 0,
    this.workoutSets = 0,
  });
}

List<Fitnessworkout> getWorkouts() {
  return [
    Fitnessworkout(
      workoutId: 'f8e06930-e68e-1062-93c9-779050ef9446',
      workoutName: "Squats",
      workoutDescription:
          "A squat is a strength exercise in which the trainee lowers their hips from a standing position and then stands back up.",
      workoutIcon: const Icon(Icons.king_bed),
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
      workoutCategory: WorkoutCategory.legs,
    ),
    Fitnessworkout(
      workoutId: 'f9122790-e68e-1062-93c9-779050ef9446',
      workoutName: "Pushups",
      workoutDescription:
          "Push-ups are a full-body exercise that can be done almost anywhere and work your chest, shoulders, arms, core muscles, and coordination.",
      workoutIcon: const Icon(Icons.access_alarm),
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
      workoutCategory: WorkoutCategory.chest,
    ),
    Fitnessworkout(
      workoutId: 'f91a8c00-e68e-1062-93c9-779050ef9446',
      workoutName: "HIIT",
      workoutDescription:
          "High-intensity interval training (HIIT) is a type of exercise that alternates between short periods of intense anaerobic exercise and brief recovery periods.",
      workoutIcon: const Icon(Icons.air),
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
      workoutCategory: WorkoutCategory.cardio,
    ),
    Fitnessworkout(
      workoutId: 'f920cd90-e68e-1062-93c9-779050ef9446',
      workoutName: "Cardio Kickboxing",
      workoutDescription:
          "Cardio kickboxing can be an effective workout for improving cardiovascular health, burning calories, and building overall body strength. It combines elements of martial arts and high-intensity cardio, targeting various muscle groups including the legs, core, and upper body, while also enhancing coordination and agility.",
      workoutIcon: const Icon(Icons.air),
      workoutImage: Image.asset(
        'assets/cardiokickboxing.jpg',
        width: 200,
        height: 100,
      ),
      workoutThumbnail: Image.asset(
        'assets/cardiokickboxing.jpg',
        width: 100,
        height: 50,
      ),
      workoutCategory: WorkoutCategory.cardio,
    ),
    Fitnessworkout(
      workoutId: 'f925af90-e68e-1062-93c9-779050ef9446',
      workoutName: "Running",
      workoutDescription:
          "Running can be an effective exercise for improving cardiovascular health, burning calories, and building endurance. It primarily targets the legs, including the quadriceps, hamstrings, calves, and glutes, while also engaging the core muscles and improving overall aerobic fitness.",
      workoutIcon: const Icon(Icons.air),
      workoutImage: Image.asset(
        'assets/running.jpg',
        width: 200,
        height: 100,
      ),
      workoutThumbnail: Image.asset(
        'assets/running.jpg',
        width: 100,
        height: 50,
      ),
      workoutCategory: WorkoutCategory.cardio,
    ),
    Fitnessworkout(
      workoutId: 'f92a1c60-e68e-1062-93c9-779050ef9446',
      workoutName: "Jump Roping",
      workoutDescription:
          "Jump rope can be an effective exercise for improving cardiovascular health, burning calories, and enhancing coordination. It primarily targets the legs, including the calves, quadriceps, and hamstrings, while also engaging the core, shoulders, and arms, providing a full-body workout.",
      workoutIcon: const Icon(Icons.air),
      workoutImage: Image.asset(
        'assets/jump-roping.jpg',
        width: 200,
        height: 100,
      ),
      workoutThumbnail: Image.asset(
        'assets/jump-roping.jpg',
        width: 100,
        height: 50,
      ),
      workoutCategory: WorkoutCategory.cardio,
    ),
    Fitnessworkout(
      workoutId: 'f92eb040-e68e-1062-93c9-779050ef9446',
      workoutName: "Bicycling",
      workoutDescription:
          "Bicycling can be an effective exercise for improving cardiovascular health, burning calories, and building leg strength. It primarily targets the quadriceps, hamstrings, calves, and glutes, while also engaging the core muscles, providing a low-impact yet intense aerobic workout.",
      workoutIcon: const Icon(Icons.air),
      workoutImage: Image.asset(
        'assets/biking.jpg',
        width: 200,
        height: 100,
      ),
      workoutThumbnail: Image.asset(
        'assets/biking.jpg',
        width: 100,
        height: 50,
      ),
      workoutCategory: WorkoutCategory.cardio,
    ),
    Fitnessworkout(
      workoutId: 'f932f600-e68e-1062-93c9-779050ef9446',
      workoutName: "Bench Press",
      workoutDescription:
          "Bench presses can be an effective exercise for building up chest, arm, and shoulder muscles. They work several different muscles in your upper body, including the chest, shoulders, and arms.",
      workoutIcon: const Icon(Icons.air),
      workoutImage: Image.asset(
        'assets/AF-HERO_BenchPress-1024x683.jpg',
        width: 200,
        height: 100,
      ),
      workoutThumbnail: Image.asset(
        'assets/AF-HERO_BenchPress-1024x683.jpg',
        width: 100,
        height: 50,
      ),
      workoutCategory: WorkoutCategory.chest,
    ),
    Fitnessworkout(
      workoutId: 'f93fc740-e68e-1062-93c9-779050ef9446',
      workoutName: "Incline Dumbell Press",
      workoutDescription:
          "Incline dumbbell presses can be an effective exercise for building up the upper chest, shoulders, and triceps. They primarily target the upper part of the chest while also engaging the shoulders and triceps.",
      workoutIcon: const Icon(Icons.air),
      workoutImage: Image.asset(
        'assets/incline-dumbbell-picture-1024x683.jpg',
        width: 200,
        height: 100,
      ),
      workoutThumbnail: Image.asset(
        'assets/incline-dumbbell-picture-1024x683.jpg',
        width: 100,
        height: 50,
      ),
      workoutCategory: WorkoutCategory.chest,
    ),
    Fitnessworkout(
      workoutId: 'f9493d20-e68e-1062-93c9-779050ef9446',
      workoutName: "Pectoral Fly",
      workoutDescription:
          "Pectoral flys can be an effective exercise for building and defining the chest muscles. They primarily target the pectoral muscles while also engaging the shoulders and biceps.",
      workoutIcon: const Icon(Icons.air),
      workoutImage: Image.asset(
        'assets/Pec-Fly-Machine.jpg',
        width: 200,
        height: 100,
      ),
      workoutThumbnail: Image.asset(
        'assets/Pec-Fly-Machine.jpg',
        width: 100,
        height: 50,
      ),
      workoutCategory: WorkoutCategory.chest,
    ),
    Fitnessworkout(
      workoutId: 'f94e4630-e68e-1062-93c9-779050ef9446',
      workoutName: "Decline Machine Press",
      workoutDescription:
          "Decline machine presses can be an effective exercise for developing the lower part of the chest muscles. They primarily target the lower pectorals while also engaging the shoulders and triceps.",
      workoutIcon: const Icon(Icons.air),
      workoutImage: Image.asset(
        'assets/decline-machine-press.jpg',
        width: 200,
        height: 100,
      ),
      workoutThumbnail: Image.asset(
        'assets/decline-machine-press.jpg',
        width: 100,
        height: 50,
      ),
      workoutCategory: WorkoutCategory.chest,
    ),
    Fitnessworkout(
      workoutId: 'f952b300-e68e-1062-93c9-779050ef9446',
      workoutName: "Dips",
      workoutDescription:
          "Dips can be an effective exercise for building up the chest, triceps, and shoulders. They primarily target the triceps and lower chest muscles while also engaging the shoulders and core.",
      workoutIcon: const Icon(Icons.air),
      workoutImage: Image.asset(
        'assets/dips-1608221119.jpg',
        width: 200,
        height: 100,
      ),
      workoutThumbnail: Image.asset(
        'assets/dips-1608221119.jpg',
        width: 100,
        height: 50,
      ),
      workoutCategory: WorkoutCategory.chest,
    ),
    Fitnessworkout(
      workoutId: 'f9571fd0-e68e-1062-93c9-779050ef9446',
      workoutName: "Leg Press",
      workoutDescription:
          "Leg presses can be an effective exercise for building and strengthening the lower body muscles. They primarily target the quadriceps, hamstrings, and glutes, providing a comprehensive workout for the legs.",
      workoutIcon: const Icon(Icons.air),
      workoutImage: Image.asset(
        'assets/leg-press-machine.jpg',
        width: 200,
        height: 100,
      ),
      workoutThumbnail: Image.asset(
        'assets/leg-press-machine.jpg',
        width: 100,
        height: 50,
      ),
      workoutCategory: WorkoutCategory.legs,
    ),
    Fitnessworkout(
      workoutId: 'f95b8ca0-e68e-1062-93c9-779050ef9446',
      workoutName: "Deadlift",
      workoutDescription:
          "Deadlifts can be an effective exercise for building overall strength and muscle mass. They primarily target the lower back, glutes, hamstrings, and core, while also engaging the upper back and forearms.",
      workoutIcon: const Icon(Icons.air),
      workoutImage: Image.asset(
        'assets/deadlift-picture.jpg',
        width: 200,
        height: 100,
      ),
      workoutThumbnail: Image.asset(
        'assets/deadlift-picture.jpg',
        width: 100,
        height: 50,
      ),
      workoutCategory: WorkoutCategory.legs,
    ),
    Fitnessworkout(
      workoutId: 'f961ce30-e68e-1062-93c9-779050ef9446',
      workoutName: "Hamstring Curls Machine",
      workoutDescription:
          "Hamstring curls can be an effective exercise for strengthening and isolating the hamstring muscles. They primarily target the hamstrings, helping to improve leg strength, stability, and muscle definition",
      workoutIcon: const Icon(Icons.air),
      workoutImage: Image.asset(
        'assets/hamstring-curls.jpg',
        width: 200,
        height: 100,
      ),
      workoutThumbnail: Image.asset(
        'assets/hamstring-curls.jpg',
        width: 100,
        height: 50,
      ),
      workoutCategory: WorkoutCategory.legs,
    ),
    Fitnessworkout(
      workoutId: 'f9668920-e68e-1062-93c9-779050ef9446',
      workoutName: "Leg Extension Machine",
      workoutDescription:
          "Leg extensions can be an effective exercise for isolating and strengthening the quadriceps. They primarily target the quadriceps muscles, helping to improve leg strength, stability, and muscle definition.",
      workoutIcon: const Icon(Icons.air),
      workoutImage: Image.asset(
        'assets/leg-extension-machine.jpg',
        width: 200,
        height: 100,
      ),
      workoutThumbnail: Image.asset(
        'assets/leg-extension-machine.jpg',
        width: 100,
        height: 50,
      ),
      workoutCategory: WorkoutCategory.legs,
    ),
    Fitnessworkout(
      workoutId: 'f96acee0-e68e-1062-93c9-779050ef9446',
      workoutName: "Goblin Squats",
      workoutDescription:
          "Goblet squats can be an effective exercise for building lower body strength and improving core stability. They primarily target the quadriceps, glutes, and hamstrings, while also engaging the core and improving overall squat technique.",
      workoutIcon: const Icon(Icons.air),
      workoutImage: Image.asset(
        'assets/goblin-squats.jpg',
        width: 200,
        height: 100,
      ),
      workoutThumbnail: Image.asset(
        'assets/goblin-squats.jpg',
        width: 100,
        height: 50,
      ),
      workoutCategory: WorkoutCategory.legs,
    ),
    Fitnessworkout(
      workoutId: 'f96fd7f0-e68e-1062-93c9-779050ef9446',
      workoutName: "Lat Pulldowns",
      workoutDescription:
          "Lat pulldowns can be an effective exercise for building and strengthening the upper back and shoulder muscles. They primarily target the latissimus dorsi, while also engaging the biceps, shoulders, and upper back.",
      workoutIcon: const Icon(Icons.air),
      workoutImage: Image.asset(
        'assets/latpulldown-machine.jpg',
        width: 200,
        height: 100,
      ),
      workoutThumbnail: Image.asset(
        'assets/latpulldown-machine.jpg',
        width: 100,
        height: 50,
      ),
      workoutCategory: WorkoutCategory.back,
    ),
    Fitnessworkout(
      workoutId: 'f97444c0-e68e-1062-93c9-779050ef9446',
      workoutName: "Barbell Rows",
      workoutDescription:
          "Barbell rows can be an effective exercise for developing and strengthening the upper back, shoulders, and arms. They primarily target the latissimus dorsi and rhomboids, while also engaging the biceps and lower back muscles.",
      workoutIcon: const Icon(Icons.air),
      workoutImage: Image.asset(
        'assets/barbell-rows-form.jpg',
        width: 200,
        height: 100,
      ),
      workoutThumbnail: Image.asset(
        'assets/barbell-rows-form.jpg',
        width: 100,
        height: 50,
      ),
      workoutCategory: WorkoutCategory.back,
    ),
    Fitnessworkout(
      workoutId: 'f9788a80-e68e-1062-93c9-779050ef9446',
      workoutName: "Pushups",
      workoutDescription: "",
      workoutIcon: const Icon(Icons.air),
      workoutImage: Image.asset(
        'assets/Pushups.jpg',
        width: 200,
        height: 100,
      ),
      workoutThumbnail: Image.asset(
        'assets/Pushups.jpg',
        width: 100,
        height: 50,
      ),
      workoutCategory: WorkoutCategory.back,
    ),
    Fitnessworkout(
      workoutId: 'f97cd040-e68e-1062-93c9-779050ef9446',
      workoutName: "Iso Cable Lat Pulldowns",
      workoutDescription:
          "Iso cable lat pulldowns can be an effective exercise for isolating and strengthening the latissimus dorsi muscles. They primarily target the lats, while also engaging the biceps, shoulders, and upper back, allowing for a focused and controlled workout.",
      workoutIcon: const Icon(Icons.air),
      workoutImage: Image.asset(
        'assets/isocable-lat-pulldowns.jpg',
        width: 200,
        height: 100,
      ),
      workoutThumbnail: Image.asset(
        'assets/isocable-lat-pulldowns.jpg',
        width: 100,
        height: 50,
      ),
      workoutCategory: WorkoutCategory.back,
    ),
    Fitnessworkout(
      workoutId: 'f980eef0-e68e-1062-93c9-779050ef9446',
      workoutName: "T-Bar Rows",
      workoutDescription:
          "T-bar rows can be an effective exercise for building and strengthening the back muscles. They primarily target the middle back, including the latissimus dorsi and rhomboids, while also engaging the biceps and lower back",
      workoutIcon: const Icon(Icons.air),
      workoutImage: Image.asset(
        'assets/tbar-rows-.jpg',
        width: 200,
        height: 100,
      ),
      workoutThumbnail: Image.asset(
        'assets/tbar-rows-.jpg',
        width: 100,
        height: 50,
      ),
      workoutCategory: WorkoutCategory.back,
    ),
    Fitnessworkout(
      workoutId: 'f9850da0-e68e-1062-93c9-779050ef9446',
      workoutName: "Pull-Ups",
      workoutDescription:
          "Pull-ups can be an effective exercise for building and strengthening the upper body muscles. They primarily target the latissimus dorsi, while also engaging the biceps, shoulders, and upper back, making them a comprehensive bodyweight exercise.",
      workoutIcon: const Icon(Icons.air),
      workoutImage: Image.asset(
        'assets/pullups-form.jpg',
        width: 200,
        height: 100,
      ),
      workoutThumbnail: Image.asset(
        'assets/pullups-form.jpg',
        width: 100,
        height: 50,
      ),
      workoutCategory: WorkoutCategory.back,
    ),
    Fitnessworkout(
      workoutId: 'f9897a70-e68e-1062-93c9-779050ef9446',
      workoutName: "Dumbbell Should Press",
      workoutDescription:
          "Dumbbell shoulder presses can be an effective exercise for building and strengthening the shoulder muscles. They primarily target the deltoids, while also engaging the triceps and upper chest, helping to improve overall upper body strength and stability.",
      workoutIcon: const Icon(Icons.air),
      workoutImage: Image.asset(
        'assets/dumbbell-shoulder-press.jpg',
        width: 200,
        height: 100,
      ),
      workoutThumbnail: Image.asset(
        'assets/dumbbell-shoulder-press.jpg',
        width: 100,
        height: 50,
      ),
      workoutCategory: WorkoutCategory.shoulders,
    ),
    Fitnessworkout(
      workoutId: 'f98d9920-e68e-1062-93c9-779050ef9446',
      workoutName: "Military Press",
      workoutDescription:
          "Military presses can be an effective exercise for building and strengthening the shoulder muscles. They primarily target the deltoids, while also engaging the triceps and upper chest, contributing to overall upper body strength and stabilit",
      workoutIcon: const Icon(Icons.air),
      workoutImage: Image.asset(
        'assets/military-press.jpg',
        width: 200,
        height: 100,
      ),
      workoutThumbnail: Image.asset(
        'assets/military-press.jpg',
        width: 100,
        height: 50,
      ),
      workoutCategory: WorkoutCategory.shoulders,
    ),
    Fitnessworkout(
      workoutId: 'f9922d00-e68e-1062-93c9-779050ef9446',
      workoutName: "Lat Raises",
      workoutDescription:
          "Lateral raises can be an effective exercise for isolating and strengthening the shoulder muscles. They primarily target the lateral deltoids, helping to build shoulder width and improve overall shoulder definition and strength.",
      workoutIcon: const Icon(Icons.air),
      workoutImage: Image.asset(
        'assets/lat-raiess.jpg',
        width: 200,
        height: 100,
      ),
      workoutThumbnail: Image.asset(
        'assets/lat-raiess.jpg',
        width: 100,
        height: 50,
      ),
      workoutCategory: WorkoutCategory.shoulders,
    ),
    Fitnessworkout(
      workoutId: 'f99672c0-e68e-1062-93c9-779050ef9446',
      workoutName: "Shrugs",
      workoutDescription:
          "Shrugs can be an effective exercise for building and strengthening the upper trapezius muscles. They primarily target the trapezius, helping to improve shoulder and neck stability, as well as enhancing upper back definition.",
      workoutIcon: const Icon(Icons.air),
      workoutImage: Image.asset(
        'assets/shrugs.jpg',
        width: 200,
        height: 100,
      ),
      workoutThumbnail: Image.asset(
        'assets/shrugs.jpg',
        width: 100,
        height: 50,
      ),
      workoutCategory: WorkoutCategory.shoulders,
    ),
    Fitnessworkout(
      workoutId: 'f99a9170-e68e-1062-93c9-779050ef9446',
      workoutName: "Rear Delt Fly",
      workoutDescription:
          "Rear delt flys can be an effective exercise for targeting and strengthening the rear deltoid muscles. They primarily focus on the posterior part of the shoulders, while also engaging the upper back muscles, helping to improve shoulder stability and overall upper body strength.",
      workoutIcon: const Icon(Icons.air),
      workoutImage: Image.asset(
        'assets/rear-delt-fly.jpg',
        width: 200,
        height: 100,
      ),
      workoutThumbnail: Image.asset(
        'assets/rear-delt-fly.jpg',
        width: 100,
        height: 50,
      ),
      workoutCategory: WorkoutCategory.shoulders,
    ),
    Fitnessworkout(
      workoutId: 'f99eb020-e68e-1062-93c9-779050ef9446',
      workoutName: "Bicep Curls",
      workoutDescription:
          "Bicep curls can be an effective exercise for building and strengthening the biceps muscles. They primarily target the biceps brachii, helping to improve arm strength, definition, and overall upper body aesthetics.",
      workoutIcon: const Icon(Icons.air),
      workoutImage: Image.asset(
        'assets/bicep-curls.jpg',
        width: 200,
        height: 100,
      ),
      workoutThumbnail: Image.asset(
        'assets/bicep-curls.jpg',
        width: 100,
        height: 50,
      ),
      workoutCategory: WorkoutCategory.arms,
    ),
    Fitnessworkout(
      workoutId: 'f9a2ced0-e68e-1062-93c9-779050ef9446',
      workoutName: "Hammer Curls",
      workoutDescription:
          "Hammer curls can be an effective exercise for building and strengthening the arm muscles. They primarily target the brachialis and biceps brachii, while also engaging the forearms, helping to improve overall arm strength and muscle definition.",
      workoutIcon: const Icon(Icons.air),
      workoutImage: Image.asset(
        'assets/hammercurls-long.jpg',
        width: 200,
        height: 100,
      ),
      workoutThumbnail: Image.asset(
        'assets/hammercurls-long.jpg',
        width: 100,
        height: 50,
      ),
      workoutCategory: WorkoutCategory.arms,
    ),
    Fitnessworkout(
      workoutId: 'f9a6ed80-e68e-1062-93c9-779050ef9446',
      workoutName: "Preacher Curls",
      workoutDescription:
          "Preacher curls can be an effective exercise for isolating and strengthening the biceps muscles. They primarily target the biceps brachii, helping to improve muscle definition and arm strength by providing a controlled and focused movement.",
      workoutIcon: const Icon(Icons.air),
      workoutImage: Image.asset(
        'assets/preacher-curls-form.jpg',
        width: 200,
        height: 100,
      ),
      workoutThumbnail: Image.asset(
        'assets/preacher-curls-form.jpg',
        width: 100,
        height: 50,
      ),
      workoutCategory: WorkoutCategory.arms,
    ),
    Fitnessworkout(
      workoutId: 'f9ab0c30-e68e-1062-93c9-779050ef9446',
      workoutName: "Tricep Rope Pulldowns",
      workoutDescription:
          "Tricep rope pulldowns can be an effective exercise for building and strengthening the triceps muscles. They primarily target the triceps brachii, helping to improve arm strength, definition, and overall upper body stability.",
      workoutIcon: const Icon(Icons.air),
      workoutImage: Image.asset(
        'assets/tricep-rope-pulldown.jpg',
        width: 200,
        height: 100,
      ),
      workoutThumbnail: Image.asset(
        'assets/tricep-rope-pulldown.jpg',
        width: 100,
        height: 50,
      ),
      workoutCategory: WorkoutCategory.arms,
    ),
    Fitnessworkout(
      workoutId: 'f9af2ae0-e68e-1062-93c9-779050ef9446',
      workoutName: "Skull-Crushers",
      workoutDescription:
          "Skull crushers can be an effective exercise for isolating and strengthening the triceps muscles. They primarily target the triceps brachii, helping to improve arm strength and muscle definition through a controlled and focused movement.",
      workoutIcon: const Icon(Icons.air),
      workoutImage: Image.asset(
        'assets/skullcrushers.jpg',
        width: 200,
        height: 100,
      ),
      workoutThumbnail: Image.asset(
        'assets/skullcrushers.jpg',
        width: 100,
        height: 50,
      ),
      workoutCategory: WorkoutCategory.arms,
    ),
    Fitnessworkout(
      workoutId: 'f9b3bec0-e68e-1062-93c9-779050ef9446',
      workoutName: "Close Grip Bench Press",
      workoutDescription:
          "Close grip bench presses can be an effective exercise for building and strengthening the triceps muscles. They primarily target the triceps brachii while also engaging the chest and shoulders, helping to improve upper body strength and muscle definition.",
      workoutIcon: const Icon(Icons.air),
      workoutImage: Image.asset(
        'assets/close-grip-benchpress.jpg',
        width: 200,
        height: 100,
      ),
      workoutThumbnail: Image.asset(
        'assets/close-grip-benchpress.jpg',
        width: 100,
        height: 50,
      ),
      workoutCategory: WorkoutCategory.arms,
    ),
  ];
}
