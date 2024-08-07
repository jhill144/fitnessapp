import 'package:flutter/material.dart';
import 'package:fitnessapp/models/fitnessworkout.dart';
import 'package:fitnessapp/utilities/enums.dart';
import 'package:go_router/go_router.dart';
import 'package:fitnessapp/utilities/route_constants.dart';
import 'package:fitnessapp/views/navigation_menu.dart';
import 'package:fitnessapp/providers/theme_provider.dart';
import 'package:provider/provider.dart';

class WorkoutPage extends StatefulWidget {
  const WorkoutPage({super.key, required this.title});

  final String title;

  @override
  _WorkoutPageState createState() => _WorkoutPageState();
}

class _WorkoutPageState extends State<WorkoutPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final List<Fitnessworkout> _workouts = getWorkouts();

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 6, vsync: this);
  }

  List<Fitnessworkout> _getWorkoutsByCategory(WorkoutCategory category) {
    return _workouts
        .where((workout) => workout.workoutCategory == category)
        .toList();
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
      bottomNavigationBar: const NavigationMenu(
        title: '',
      ),
    );
  }

  Widget _buildWorkoutList(WorkoutCategory category) {
    var themeProvider = Provider.of<ThemeProvider>(context);
    final workouts = _getWorkoutsByCategory(category);
    return ListView.builder(
      itemCount: workouts.length,
      itemBuilder: (context, index) {
        return Card(
          elevation: 3,
          child: ListTile(
            title: Text(
              workouts[index].workoutName,
              style: TextStyle(
                  color: themeProvider.isDarkTheme
                      ? Colors.grey[300]
                      : const Color.fromARGB(255, 0, 0, 0)),
            ),
            subtitle: Text(workouts[index].workoutDescription),
            leading: workouts[index].workoutThumbnail,
            onTap: () {
              context.pushNamed(RouteConstants.workoutdetails,
                  extra: workouts[index]);
            },
          ),
        );
      },
    );
  }
}
