import 'package:go_router/go_router.dart';
import 'package:fitnessapp/utilities/route_constants.dart';
import 'package:fitnessapp/views/authentication/login.dart';
import 'package:fitnessapp/views/authentication/registration.dart';
import 'package:fitnessapp/views/workout.dart';
import 'package:fitnessapp/main.dart';

class AppRouter {
  final GoRouter router = GoRouter(
      initialLocation: "/login",
      routes: <RouteBase>[
        GoRoute(
          name: RouteConstants.login,
          path: "/login",
          builder: (context, state) {
            return const LoginPage(
              title: '',
            );
          },
        ),
        GoRoute(
          name: RouteConstants.register,
          path: "/register",
          builder: (context, state) {
            return const RegistrationPage(
              title: '',
            );
          },
        ),
        GoRoute(
          name: RouteConstants.home,
          path: "/home",
          builder: (context, state) {
            return const MyHomePage(
              title: 'My Fitness Workout App',
            );
          },
        ),
        GoRoute(
          name: RouteConstants.workout,
          path: "/workouts",
          builder: (context, state) {
            return const WorkoutPage(
              title: 'Workouts',
            );
          },
        )
      ],
      redirect: (context, state) async {
        bool isAuthenticated = false;
        if (!isAuthenticated && state.matchedLocation == '/') {
          return state.namedLocation(RouteConstants.login);
        }
        return null;
      });
}
