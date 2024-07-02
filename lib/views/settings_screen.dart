import 'package:fitnessapp/utilities/route_constants.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:provider/provider.dart';
import 'package:fitnessapp/providers/theme_provider.dart';
import 'package:fitnessapp/utilities/database_helper.dart';
import 'package:sqflite/sqflite.dart';
import 'package:go_router/go_router.dart';

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

    final mapQuery =
        await dbHelper.rawQuery('SELECT * FROM ${DatabaseHelper.table}');
    print(mapQuery);

    mapQuery.forEach((dbitem) {
      setState(() {
        goalController.text = (prefs.getString('goal')!.isEmpty
            ? dbitem[DatabaseHelper.columnGoal].toString()
            : prefs.getString('goal'))!;
        ageController.text = prefs.getString('age')!.isEmpty
            ? dbitem[DatabaseHelper.columnAge].toString()
            : prefs.getString('age')!;
        weightController.text = prefs.getString('weight')!.isEmpty
            ? dbitem[DatabaseHelper.columnWeight].toString()
            : prefs.getString('weight')!;
        heightController.text = prefs.getString('height')!.isEmpty
            ? dbitem[DatabaseHelper.columnHeightFeet].toString()
            : prefs.getString('height')!;
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

  Future<void> deleteSettings() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('goal', '');
    await prefs.setString('age', '');
    await prefs.setString('weight', '');
    await prefs.setString('height', '');
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
      DatabaseHelper.columnAge:
          ageController.text.isEmpty ? 0 : int.parse(ageController.text),
      DatabaseHelper.columnWeight: weightController.text.isEmpty
          ? 0
          : double.parse(weightController.text),
      DatabaseHelper.columnHeightFeet: heightController.text.isEmpty
          ? 0
          : double.parse(heightController.text),
      DatabaseHelper.columnHeightInch:
          heightController.text.isEmpty ? 0 : double.parse('0'),
      DatabaseHelper.columnGoal: goalController.text,
    };

    Database dbHelper = await DatabaseHelper.instance.database;

    final id = await dbHelper.update(DatabaseHelper.table, row,
        where: '${DatabaseHelper.columnId} = 1');

    /*final deleteRecord = await dbHelper.delete(DatabaseHelper.table,
        where: "${DatabaseHelper.columnId} = 1");*/
  }

  void _delete() async {
    Database dbHelper = await DatabaseHelper.instance.database;

    final id = await dbHelper.delete(DatabaseHelper.table);

    context.goNamed(RouteConstants.login);
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
            SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: () {
                deleteSettings();
              },
              child: const Text('Delete Account'),
            ),
          ],
        ),
      ),
    );
  }
}
