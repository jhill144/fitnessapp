import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:provider/provider.dart';
import 'package:fitnessapp/providers/theme_provider.dart';

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
    setState(() {
      goalController.text = prefs.getString('goal') ?? '';
      ageController.text = prefs.getString('age') ?? '';
      weightController.text = prefs.getString('weight') ?? '';
      heightController.text = prefs.getString('height') ?? '';
      isDarkTheme = prefs.getBool('isDarkTheme') ?? false;
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

    // Show a snackbar to confirm settings are saved
    ScaffoldMessenger.of(context)
        .showSnackBar(const SnackBar(content: Text('Settings saved')));
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
