import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:provider/provider.dart';
import 'package:fitnessapp/providers/theme_provider.dart';
import 'package:fitnessapp/utilities/database_helper.dart';
import 'package:sqflite/sqflite.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  TextEditingController goalController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController weightController = TextEditingController();
  TextEditingController heightController = TextEditingController();
  bool isDarkTheme = false;

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

    mapQuery.forEach((dbitem) {
      setState(() {
        goalController.text = prefs.getString('goal') ??
            dbitem[DatabaseHelper.columnGoal].toString();
        ageController.text = prefs.getString('age') ??
            dbitem[DatabaseHelper.columnAge].toString();
        weightController.text = prefs.getString('weight') ??
            dbitem[DatabaseHelper.columnWeight].toString();
        heightController.text = prefs.getString('height') ??
            dbitem[DatabaseHelper.columnHeightFeet].toString();
        isDarkTheme = prefs.getBool('isDarkTheme') ?? false;
      });
    });
  }

  Future<void> saveSettings() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('goal', goalController.text);
    await prefs.setString('age', ageController.text);
    await prefs.setString('weight', weightController.text);
    await prefs.setString('height', heightController.text);
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

  void _update() async {
// row to insert
    Map<String, dynamic> row = {
      DatabaseHelper.columnName: 'Bob',
      DatabaseHelper.columnAge: int.parse(ageController.text),
      DatabaseHelper.columnWeight: double.parse(weightController.text),
      DatabaseHelper.columnHeightFeet: double.parse(heightController.text),
      DatabaseHelper.columnHeightInch: double.parse('0'),
      DatabaseHelper.columnGoal: goalController.text,
    };

    Database dbHelper = await DatabaseHelper.instance.database;

    final id = await dbHelper.update(DatabaseHelper.table, row,
        where: '${DatabaseHelper.columnId} = 1');

    /*final deleteRecord = await dbHelper.delete(DatabaseHelper.table,
        where: "${DatabaseHelper.columnId} = 1");*/
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: goalController,
              decoration: const InputDecoration(labelText: 'Goal'),
            ),
            TextField(
              controller: ageController,
              decoration: const InputDecoration(labelText: 'Age'),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: weightController,
              decoration: const InputDecoration(labelText: 'Weight'),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: heightController,
              decoration: const InputDecoration(labelText: 'Height'),
              keyboardType: TextInputType.number,
            ),
            SwitchListTile(
              title: const Text('Dark Theme'),
              value: isDarkTheme,
              onChanged: (bool value) {
                setState(() {
                  isDarkTheme = value;
                });
              },
            ),
            ElevatedButton(
              onPressed: () {
                saveSettings();
              },
              child: const Text('Save Settings'),
            ),
          ],
        ),
      ),
    );
  }
}
