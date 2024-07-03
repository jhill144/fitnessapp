import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:fitnessapp/providers/theme_provider.dart';
import 'package:fitnessapp/datetime/date_time.dart';
import 'package:flutter_heatmap_calendar/flutter_heatmap_calendar.dart';
import 'package:fitnessapp/utilities/database_helper.dart';
import 'package:sqflite/sqflite.dart';

class CalendarView extends StatefulWidget {
  const CalendarView({super.key, required String title});

  @override
  _CalendarViewState createState() => _CalendarViewState();
}

class _CalendarViewState extends State<CalendarView> {
  final Map<DateTime, int> _heatmapData = {};
  DateTime? _selectedDate;
  List<Map<String, dynamic>> workouts = [];
  Set<int> completedWorkouts = Set<int>();

  @override
  void initState() {
    super.initState();
    _initializeHeatmapData();
  }

  void _initializeHeatmapData() async {
    DateTime today = DateTime.now();
    for (int i = 0; i < 30; i++) {
      DateTime date = today.subtract(Duration(days: i));
      await fetchWorkouts(date);
      int completionLevel = _calculateCompletionLevel();
      setState(() {
        _heatmapData[date] = completionLevel;
      });
    }
  }

  Future<void> fetchWorkouts(DateTime date) async {
    Database dbHelper = await DatabaseHelper.instance.database;
    String dateStr = convertDateTimeToYYYYMMDD(date);
    final result = await dbHelper.rawQuery(
      'SELECT * FROM ${DatabaseHelper.workoutTable} WHERE date = ?',
      [dateStr],
    );
    setState(() {
      workouts = result;
      completedWorkouts.clear();
      for (var workout in workouts) {
        if (workout[DatabaseHelper.columnWorkoutCompleted] == 1) {
          completedWorkouts.add(workout[DatabaseHelper.columnWorkoutID]);
        }
      }
    });
  }

  int _calculateCompletionLevel() {
    if (workouts.isEmpty) return 0;
    int totalWorkouts = workouts.length;
    int completedCount = completedWorkouts.length;

    double completionRatio = completedCount / totalWorkouts;
    if (completionRatio == 0) return 1;
    if (completionRatio <= 0.25) return 2;
    if (completionRatio <= 0.5) return 3;
    if (completionRatio <= 0.75) return 4;
    return 5;
  }

  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<ThemeProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Progress Calendar'),
      ),
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          return Column(
            children: [
              Expanded(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    width: constraints.maxWidth,
                    height: constraints.maxHeight,
                    child: HeatMapCalendar(
                      colorsets: {
                        1: Colors.green[100]!,
                        2: Colors.green[300]!,
                        3: Colors.green[500]!,
                        4: Colors.green[700]!,
                        5: Colors.green[900]!,
                      },
                      datasets: _heatmapData,
                      defaultColor: Colors.grey[200]!,
                      textColor: Colors.black,
                      showColorTip: true,
                      onClick: (DateTime date) {
                        setState(() {
                          _selectedDate = date;
                        });
                        fetchWorkouts(date).then((_) {
                          int completionLevel = _calculateCompletionLevel();
                          setState(() {
                            _heatmapData[date] = completionLevel;
                          });
                        });
                      },
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: _selectedDate != null
                    ? Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Text(
                              "Workouts on ${convertDateTimeToYYYYMMDD(_selectedDate!)}",
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 10),
                            Expanded(
                              child: ListView.builder(
                                itemCount: workouts.length,
                                itemBuilder: (context, index) {
                                  final workout = workouts[index];
                                  final workoutID =
                                      workout[DatabaseHelper.columnWorkoutID];
                                  final workoutDuration = workout[
                                      DatabaseHelper.columnWorkoutDuration];
                                  final workoutReps =
                                      workout[DatabaseHelper.columnWorkoutReps];
                                  final workoutSets =
                                      workout[DatabaseHelper.columnWorkoutSets];
                                  final workoutWeights = workout[
                                      DatabaseHelper.columnWorkoutWeights];
                                  final isCompleted =
                                      completedWorkouts.contains(workoutID);

                                  return Card(
                                    elevation: 3,
                                    child: ListTile(
                                      title: Text(
                                        'Workout ID: $workoutID',
                                        style: TextStyle(
                                          color: themeProvider.isDarkTheme
                                              ? Colors.grey[300]
                                              : Colors.grey[800],
                                        ),
                                      ),
                                      subtitle: Text(
                                        'Duration: $workoutDuration mins\n'
                                        'Reps: $workoutReps\n'
                                        'Sets: $workoutSets\n'
                                        'Weights: $workoutWeights lbs',
                                        style: TextStyle(
                                          color: themeProvider.isDarkTheme
                                              ? Colors.grey[300]
                                              : Colors.grey[800],
                                        ),
                                      ),
                                      trailing: Checkbox(
                                        value: isCompleted,
                                        onChanged: (bool? value) {
                                          setState(() {
                                            if (value == true) {
                                              completedWorkouts.add(workoutID);
                                            } else {
                                              completedWorkouts
                                                  .remove(workoutID);
                                            }
                                          });
                                        },
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      )
                    : const Center(
                        child: Text(
                          "Select a date to see completed workouts",
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
              ),
            ],
          );
        },
      ),
    );
  }
}
