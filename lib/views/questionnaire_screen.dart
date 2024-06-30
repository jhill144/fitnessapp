import 'package:flutter/material.dart';
import 'package:fitnessapp/controller/calorie_calculator.dart';
import 'package:fitnessapp/models/user_info.dart';

class QuestionnaireScreen extends StatefulWidget {
  const QuestionnaireScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _QuestionnaireScreenState createState() => _QuestionnaireScreenState();
}

class _QuestionnaireScreenState extends State<QuestionnaireScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _ageController = TextEditingController();
  final TextEditingController _weightController = TextEditingController();
  final TextEditingController _heightController = TextEditingController();
  String _goal = 'Lose Weight';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Fitness Questionnaire'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _ageController,
                decoration: const InputDecoration(labelText: 'Age'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your age';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _weightController,
                decoration: const InputDecoration(labelText: 'Weight (kg)'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your weight';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _heightController,
                decoration: const InputDecoration(labelText: 'Height (cm)'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your height';
                  }
                  return null;
                },
              ),
              DropdownButtonFormField<String>(
                value: _goal,
                items: ['Lose Weight', 'Gain Muscle', 'Maintain Weight']
                    .map((label) => DropdownMenuItem(
                          value: label,
                          child: Text(label),
                        ))
                    .toList(),
                onChanged: (value) {
                  setState(() {
                    _goal = value!;
                  });
                },
                decoration: const InputDecoration(labelText: 'Goal'),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    calculateCalories();
                  }
                },
                child: const Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void calculateCalories() {
    int age = int.parse(_ageController.text);
    double weight = double.parse(_weightController.text);
    double height = double.parse(_heightController.text);

    UserInfo userInfo = UserInfo(
      age: age,
      weight: weight,
      height: height,
      goal: _goal,
    );

    CalorieCalculator calculator = CalorieCalculator();
    double bmr = calculator.calculateBMR(userInfo);
    double tdee = calculator.calculateTDEE(bmr, 'Sedentary'); // Placeholder activity level
    double caloriesToBurn = calculator.calculateCaloriesToBurn(userInfo, tdee);

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Caloric Needs'),
        content: Text(
            'You need to burn ${caloriesToBurn.toStringAsFixed(0)} calories per day to achieve your goal.'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }
}
