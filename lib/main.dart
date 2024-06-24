import 'package:fitnessapp/utilities/route_constants.dart';
import 'package:flutter/material.dart';
import 'package:fitnessapp/controller/router.dart';
import 'package:fitnessapp/views/navigation_menu.dart';
import 'package:go_router/go_router.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

void main() {
  runApp(const FitnessWorkout());
}

class FitnessWorkout extends StatelessWidget {
  const FitnessWorkout({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Fitness Workout',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routerConfig: AppRouter().router,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      drawer: Drawer(
          child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(color: Colors.blue),
            child: Text("Settings"),
          ),
          ListTile(
            title: const Text('Menu Item 1'),
            onTap: () {},
          ),
          ListTile(
            title: const Text('Menu Item 2'),
            onTap: () {},
          ),
          ListTile(
            title: const Text('Progress Tracker'),
            onTap: () {
              context.pushNamed(RouteConstants.progresstracker);
            },
          ),
          ListTile(
            title: const Text('Questionnaire'),
            onTap: () {
              context.pushNamed(RouteConstants.questionnaire);
            }
          ),
        ],
      )),
      bottomNavigationBar: const NavigationBanner(
        title: 'navigation',
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[],
        ),
      ),
    );
  }
}
