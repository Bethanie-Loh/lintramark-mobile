import 'package:go_router/go_router.dart';
import 'package:hackathon/screens/home/home_screen.dart';
import 'package:hackathon/screens/leaderboard/leaderboard_screen.dart';
import 'package:hackathon/screens/profile/profile_screen.dart';
import 'package:hackathon/screens/profile/self_profile_screen.dart';
import 'package:hackathon/screens/tasks/location_task_screen.dart';
import 'package:hackathon/screens/tasks/task_screen.dart';

class Navigation {
  static const initial = "/home";

  static final routes = [
    GoRoute(
        path: "/home",
        name: HomeScreen.route,
        builder: (context, state) => const HomeScreen()),
    GoRoute(
        path: "/tasks_location",
        name: LocationTaskScreen.route,
        builder: (context, state) => const LocationTaskScreen()),
    GoRoute(
        path: "/tasks",
        name: TaskScreen.route,
        builder: (context, state) => const TaskScreen()),
    GoRoute(
        path: "/leaderboard",
        name: LeaderboardScreen.route,
        builder: (context, state) => const LeaderboardScreen()),
    GoRoute(
        path: "/profile",
        name: ProfileScreen.route,
        builder: (context, state) => const ProfileScreen()),
    GoRoute(
        path: "/self_profile",
        name: SelfProfileScreen.route,
        builder: (context, state) => const SelfProfileScreen()),
  ];
}
