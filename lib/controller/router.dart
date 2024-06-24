import 'package:fitnessapp/views/questionnaire_screen';
import 'package:go_router/go_router.dart';
import 'package:fitnessapp/utilities/route_constants.dart';
import 'package:fitnessapp/views/authentication/login.dart';
import 'package:fitnessapp/views/authentication/registration.dart';
import 'package:fitnessapp/views/workouts/workout.dart';
import 'package:fitnessapp/views/workouts/workoutdetail.dart';
import 'package:fitnessapp/models/fitnessworkout.dart';
import 'package:fitnessapp/main.dart';
import 'package:fitnessapp/views/progresstracker.dart';

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
        ),
        GoRoute(
          name: RouteConstants.workoutdetails,
          path: "/workoutdetails",
          builder: (context, state) {
            final Fitnessworkout workout = state.extra as Fitnessworkout;
            return WorkoutDetailPage(
              fitnessworkout: workout,
            );
          },
        ),
        GoRoute(
          name: RouteConstants.progresstracker,
          path: "/progresstracker",
          builder: (context, state) {
            return const ProgressTrackerPage(
              title: 'Progress Tracker Page',
            );
          },
        ),
        GoRoute(
          name: RouteConstants.questionnaire,
          path: "/questionnaire",
          builder: (context, state) {
            return QuestionnaireScreen();
          },
        ),
      ],
      redirect: (context, state) async {
        bool isAuthenticated = false;
        if (!isAuthenticated && state.matchedLocation == '/') {
          return state.namedLocation(RouteConstants.login);
        }
        return null;
      });
}
