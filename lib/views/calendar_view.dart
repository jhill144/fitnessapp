import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:fitnessapp/views/navigation_menu.dart';
import 'package:fitnessapp/datetime/date_time.dart';
import 'package:flutter_heatmap_calendar/flutter_heatmap_calendar.dart';

class CalendarView extends StatefulWidget {
  const CalendarView({Key? key, required String title}) : super(key: key);

  @override
  _CalendarViewState createState() => _CalendarViewState();
}

class _CalendarViewState extends State<CalendarView> {
  Map<DateTime, int> _heatmapData = {}; // This map will hold the progress data
  DateTime? _selectedDate;

  @override
  void initState() {
    super.initState();
    _initializeHeatmapData();
  }

  void _initializeHeatmapData() {
    // For demonstration, randomly generating some data
    DateTime today = DateTime.now();
    for (int i = 0; i < 30; i++) {
      _heatmapData[today.subtract(Duration(days: i))] = i % 5;
    }
  }

  @override
  Widget build(BuildContext context) {
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
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 10),
                            Text(
                              "Details of the workouts completed on this day.",
                              style: TextStyle(fontSize: 16),
                            ),
                            // Add more details about the workouts here
                          ],
                        ),
                      )
                    : Center(
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
