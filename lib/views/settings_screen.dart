import 'package:fitnessapp/utilities/route_constants.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart' as Path;
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:provider/provider.dart';
import 'package:fitnessapp/providers/theme_provider.dart';
import 'package:fitnessapp/utilities/database_helper.dart';
import 'package:sqflite/sqflite.dart';
import 'package:go_router/go_router.dart';
import 'dart:io' as Directory;

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  TextEditingController ageController = TextEditingController();
  TextEditingController weightController = TextEditingController();
  TextEditingController heightFeetController = TextEditingController();
  TextEditingController heightInchesController = TextEditingController();
  String _goal = 'Lose Weight';
  bool isDarkTheme = false;

  final List<String> goals = ['Lose Weight', 'Gain Weight', 'Maintain Weight'];

  @override
  void initState() {
    super.initState();
    loadSettings();
  }

  Future<void> loadSettings() async {
    final prefs = await SharedPreferences.getInstance();
    Database dbHelper = await DatabaseHelper.instance.database;

    final mapQuery = await dbHelper.rawQuery(
        'SELECT * FROM ${DatabaseHelper.table} WHERE ${DatabaseHelper.columnId} = 1');

    if (mapQuery.isNotEmpty) {
      final dbitem = mapQuery.first;
      setState(() {
        _goal = (prefs.getString('goal').toString().isEmpty
            ? dbitem[DatabaseHelper.columnGoal].toString()
            : prefs.getString('goal'))!;
        if (!goals.contains(_goal)) {
          _goal = 'Lose Weight';
        }
        ageController.text = prefs.getString('age').toString().isEmpty
            ? dbitem[DatabaseHelper.columnAge].toString()
            : prefs.getString('age')!;
        weightController.text = (prefs.getString('weight').toString().isEmpty
            ? dbitem[DatabaseHelper.columnWeight].toString()
            : prefs.getString('weight'))!;
        heightFeetController.text =
            (prefs.getString('height (in ft)').toString().isEmpty
                ? dbitem[DatabaseHelper.columnHeightFeet].toString()
                : prefs.getString('height (in ft)').toString())!;
        heightInchesController.text =
            (prefs.getString('height (in inches)').toString().isEmpty
                ? dbitem[DatabaseHelper.columnHeightFeet].toString()
                : prefs.getString('height (in inches)').toString())!;
        isDarkTheme = prefs.getBool('isDarkTheme') ?? false;
      });
    } else {
      // If no data is found in the database, set default values
      setState(() {
        ageController.text = prefs.getString('age') ?? '';
        weightController.text = prefs.getString('weight') ?? '';
        heightFeetController.text = prefs.getString('height (in ft)') ?? '';
        heightInchesController.text =
            prefs.getString('height (in inches)') ?? '';
        isDarkTheme = prefs.getBool('isDarkTheme') ?? false;
      });
    }
  }

  Future<void> saveSettings() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('goal', _goal);
    await prefs.setString('age', ageController.text);
    await prefs.setString('weight', weightController.text);
    await prefs.setString('height (in ft)', heightFeetController.text);
    await prefs.setString('height (in inches)', heightInchesController.text);
    await prefs.setBool('isDarkTheme', isDarkTheme);

    // Update the ThemeProvider
    final themeProvider = Provider.of<ThemeProvider>(context, listen: false);
    if (themeProvider.isDarkTheme != isDarkTheme) {
      themeProvider.toggleTheme();
    }

    _update();

    // Show a snackbar to confirm settings are saved
    ScaffoldMessenger.of(context)
        .showSnackBar(const SnackBar(content: Text('Settings saved')));
  }

  Future<void> deleteSettings() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('goal', '');
    await prefs.setString('age', '');
    await prefs.setString('weight', '');
    await prefs.setString('height (in ft)', '');
    await prefs.setString('height (in inches)', '');
    await prefs.setBool('isDarkTheme', false);

    // Update the ThemeProvider
    final themeProvider = Provider.of<ThemeProvider>(context, listen: false);
    if (themeProvider.isDarkTheme != isDarkTheme) {
      themeProvider.toggleTheme();
    }

    _delete();

    // Show a snackbar to confirm settings are saved
    ScaffoldMessenger.of(context)
        .showSnackBar(const SnackBar(content: Text('Account Data Deleted')));
  }

  void _update() async {
// row to insert
    Map<String, dynamic> row = {
      DatabaseHelper.columnName: 'Bob',
      DatabaseHelper.columnAge: int.parse(ageController.text),
      DatabaseHelper.columnWeight: double.parse(weightController.text),
      DatabaseHelper.columnHeightFeet: double.parse(heightFeetController.text),
      DatabaseHelper.columnHeightInch:
          double.parse(heightInchesController.text),
      DatabaseHelper.columnGoal: _goal,
    };

    Database dbHelper = await DatabaseHelper.instance.database;

    final id = await dbHelper.update(DatabaseHelper.table, row,
        where: '${DatabaseHelper.columnId} = 1');

    /*final deleteRecord = await dbHelper.delete(DatabaseHelper.table,
        where: "${DatabaseHelper.columnId} = 1");*/
  }

  void _delete() async {
    /*Directory.Directory documentsDirectory =
        await getApplicationDocumentsDirectory();
    String path = Path.join(documentsDirectory.path, 'MyFitnessApp.db');
    databaseFactory.deleteDatabase(path);*/

    Database dbHelper = await DatabaseHelper.instance.database;

    final id = await dbHelper.delete(DatabaseHelper.table);
    final workoutid = await dbHelper.delete(DatabaseHelper.workoutTable);

    context.goNamed(RouteConstants.login);
  }

  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<ThemeProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          // Profile Section
          _buildSectionHeader('Profile Settings', context),
          TextFormField(
            controller: ageController,
            decoration: InputDecoration(labelText: 'Age'),
            keyboardType: TextInputType.number,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your age';
              }
              return null;
            },
          ),
          TextFormField(
            controller: weightController,
            decoration: InputDecoration(labelText: 'Weight (lb)'),
            keyboardType: TextInputType.number,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your weight';
              }
              return null;
            },
          ),
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  controller: heightFeetController,
                  decoration: InputDecoration(labelText: 'Height (ft)'),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter feet';
                    }
                    return null;
                  },
                ),
              ),
              SizedBox(width: 10),
              Expanded(
                child: TextFormField(
                  controller: heightInchesController,
                  decoration: InputDecoration(labelText: 'Height (in)'),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter inches';
                    }
                    return null;
                  },
                ),
              ),
            ],
          ),
          DropdownButtonFormField<String>(
            value: goals.contains(_goal) ? _goal : 'Lose Weight',
            items: goals
                .map((label) => DropdownMenuItem(
                      child: Text(label),
                      value: label,
                    ))
                .toList(),
            onChanged: (value) {
              setState(() {
                _goal = value!;
              });
            },
            decoration: InputDecoration(labelText: 'Goal'),
          ),
          const SizedBox(height: 20.0),

          // Theme Section
          _buildSectionHeader('Theme Settings', context),
          SwitchListTile(
            title: const Text('Dark Theme'),
            value: isDarkTheme,
            onChanged: (bool value) {
              setState(() {
                isDarkTheme = value;
              });
            },
          ),
          const SizedBox(height: 20.0),

          // Save Button
          ElevatedButton(
            onPressed: () {
              saveSettings();
            },
            child: const Text('Save Settings'),
          ),
          const SizedBox(height: 20.0),

          // Save Button
          ElevatedButton(
            onPressed: () {
              deleteSettings();
            },
            child: const Text('Delete Account'),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionHeader(String title, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Text(
        title,
        style: Theme.of(context)
            .textTheme
            .headlineMedium
            ?.copyWith(fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _buildProfileTextField(String label, TextEditingController controller,
      {bool isNumeric = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          labelText: label,
          border: const OutlineInputBorder(),
        ),
        keyboardType: isNumeric ? TextInputType.number : TextInputType.text,
      ),
    );
  }
}
