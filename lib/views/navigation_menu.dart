import 'package:fitnessapp/utilities/route_constants.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class NavigationBanner extends StatefulWidget {
  const NavigationBanner({super.key, required this.title});

  final String title;
  @override
  State<NavigationBanner> createState() => _NavigationBannerState();
}

class _NavigationBannerState extends State<NavigationBanner> {
  @override
  Widget build(BuildContext context) {
    return GNav(
        onTabChange: (index) {
          switch (index) {
            case 1:
              context.push(RouteConstants.workout);
            case 2:
              context.push(RouteConstants.profile);
            case 3:
              context.push(RouteConstants.user);
            default:
              context.push(RouteConstants.home);
          }
        },
        tabs: const [
          GButton(icon: Icons.home),
          GButton(icon: Icons.hdr_strong),
          GButton(icon: Icons.person),
          GButton(icon: Icons.settings),
        ]);
  }
}
