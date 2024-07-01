import 'package:fitnessapp/utilities/database_helper.dart';
import 'package:flutter/material.dart';
import 'package:fitnessapp/controller/router.dart';
import 'package:fitnessapp/views/navigation_menu.dart';
import 'package:provider/provider.dart';
import 'package:fitnessapp/providers/theme_provider.dart';

final dbHelper = DatabaseHelper();
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
// initialize the database
  await dbHelper.init();
  //await dbHelper.deleteDB();
  runApp(const FitnessWorkout());
}

class FitnessWorkout extends StatelessWidget {
  const FitnessWorkout({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ThemeProvider(),
      child: Consumer<ThemeProvider>(
        builder: (context, themeProvider, child) {
          return MaterialApp.router(
            title: 'Fitness Workout',
            debugShowCheckedModeBanner: false,
            theme: themeProvider.lightTheme,
            darkTheme: themeProvider.darkTheme,
            themeMode:
                themeProvider.isDarkTheme ? ThemeMode.dark : ThemeMode.light,
            routerConfig: AppRouter().router,
          );
        },
      ),
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
      )),
      bottomNavigationBar: const NavigationMenu(
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
