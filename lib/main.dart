import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:fitnessapp/views/authentication/login.dart';
import 'package:fitnessapp/views/workout.dart';

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
      routerConfig: _router,
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
        ],
      )),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[],
        ),
      ),
    );
  }
}

final GoRouter _router = GoRouter(
  initialLocation: "/login",
  routes: <RouteBase>[
    GoRoute(
      name: "/login",
      path: "/login",
      builder: (context, state) {
        return const LoginPage(
          title: '',
        );
      },
    ),
    GoRoute(
      name: "/home",
      path: "/home",
      builder: (context, state) {
        return const MyHomePage(
          title: 'My Fitness Workout App',
        );
      },
    ),
    GoRoute(
      name: "/workouts",
      path: "/workouts",
      builder: (context, state) {
        return const WorkoutPage(
          title: 'Workouts',
        );
      },
    )
  ],
);
