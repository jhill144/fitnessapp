import 'package:flutter/material.dart';
import 'package:fitnessapp/views/navigation_menu.dart';

class ProgressTrackerPage extends StatefulWidget {
  const ProgressTrackerPage({super.key, required this.title});

  final String title;
  @override
  State<ProgressTrackerPage> createState() => _ProgressTrackerPageState();
}

class _ProgressTrackerPageState extends State<ProgressTrackerPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      bottomNavigationBar: const NavigationBanner(
        title: 'navigation',
      ),
      body: const Center(),
    );
  }
}
