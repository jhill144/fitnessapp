import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ProgressTrackerPage extends StatefulWidget {
  const ProgressTrackerPage({super.key, required this.title});

  final String title;
  @override
  State<ProgressTrackerPage> createState() => _ProgressTrackerPageState();
}

class _ProgressTrackerPageState extends State<ProgressTrackerPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(),
    );
  }
}
