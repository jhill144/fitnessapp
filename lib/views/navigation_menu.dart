import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:fitnessapp/providers/theme_provider.dart';
import 'package:fitnessapp/utilities/route_constants.dart';

class NavigationMenu extends StatelessWidget {
  final String title;

  const NavigationMenu({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return BottomNavigationBar(
      backgroundColor: themeProvider.isDarkTheme ? Colors.black : Colors.white,
      selectedItemColor:
          themeProvider.isDarkTheme ? Colors.white : Colors.black,
      unselectedItemColor:
          themeProvider.isDarkTheme ? Colors.white70 : Colors.black54,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.fitness_center),
          label: 'Workouts',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.track_changes),
          label: 'Progress Tracker',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.settings),
          label: 'Settings',
        ),
      ],
      currentIndex: _getCurrentIndex(context),
      onTap: (index) {
        _onItemTapped(context, index);
      },
    );
  }

  int _getCurrentIndex(BuildContext context) {
    final location =
        GoRouter.of(context).routerDelegate.currentConfiguration.fullPath;
    if (location.startsWith(RouteConstants.workout)) {
      return 0;
    } else if (location.startsWith(RouteConstants.progresstracker)) {
      return 1;
    } else if (location.startsWith(RouteConstants.settings)) {
      return 2;
    }
    return 0;
  }

  void _onItemTapped(BuildContext context, int index) {
    switch (index) {
      case 0:
        context.goNamed(RouteConstants.workout);
        break;
      case 1:
        context.push(RouteConstants.progresstracker);
        break;
      case 2:
        context.push(RouteConstants.settings);
        break;
    }
  }
}
