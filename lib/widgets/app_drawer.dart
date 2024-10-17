import 'package:flutter/material.dart';
import 'package:hackathon/screens/leaderboard/leaderboard_screen.dart';
import 'package:hackathon/screens/tasks/task_screen.dart';
import 'package:hackathon/utils/app_text_styles.dart';
import 'package:go_router/go_router.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          const DrawerHeader(
            child:
                Center(child: Text('LintraMark', style: AppTextStyles.bold_30)),
          ),
          ListTile(
            title: const Text("All Tasks", style: AppTextStyles.bold_20),
            onTap: () async {
              Navigator.pop(context);
              Navigator.popUntil(context, (route) => route.isFirst);
              context.pushNamed(TaskScreen.route);
            },
          ),
          ListTile(
            title: const Text("Leaderboard", style: AppTextStyles.bold_20),
            onTap: () async {
              Navigator.pop(context);
              Navigator.popUntil(context, (route) => route.isFirst);
              context.pushNamed(LeaderboardScreen.route);
            },
          ),
        ],
      ),
    );
  }
}
