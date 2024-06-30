import 'package:flutter/material.dart';
import 'package:fitnessapp/models/fitnessworkout.dart';
import 'package:fitnessapp/utilities/enums.dart';
import 'package:go_router/go_router.dart';
import 'package:fitnessapp/utilities/route_constants.dart';

class WorkoutPage extends StatefulWidget {
  const WorkoutPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _WorkoutPageState createState() => _WorkoutPageState();
}

class _WorkoutPageState extends State<WorkoutPage> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final List<Fitnessworkout> _workouts = getWorkouts();

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 6, vsync: this);
  }

  List<Fitnessworkout> _getWorkoutsByCategory(WorkoutCategory category) {
    return _workouts.where((workout) => workout.workoutCategory == category).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(text: "Chest"),
            Tab(text: "Shoulders"),
            Tab(text: "Back"),
            Tab(text: "Arms"),
            Tab(text: "Legs"),
            Tab(text: "Cardio"),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          _buildWorkoutList(WorkoutCategory.chest),
          _buildWorkoutList(WorkoutCategory.shoulders),
          _buildWorkoutList(WorkoutCategory.back),
          _buildWorkoutList(WorkoutCategory.arms),
          _buildWorkoutList(WorkoutCategory.legs),
          _buildWorkoutList(WorkoutCategory.cardio),
        ],
      ),
    );
  }

  Widget _buildWorkoutList(WorkoutCategory category) {
    final workouts = _getWorkoutsByCategory(category);
    return ListView.builder(
      itemCount: workouts.length,
      itemBuilder: (context, index) {
        return Card(
          elevation: 3,
          child: ListTile(
            title: Text(
              workouts[index].workoutName,
              style: TextStyle(color: Colors.black),
            ),
            subtitle: Text(workouts[index].workoutDescription),
            leading: workouts[index].workoutThumbnail,
            onTap: () {
              context.pushNamed(RouteConstants.workoutdetails, extra: workouts[index]);
            },
          ),
        );
      },
    );
  }
}
