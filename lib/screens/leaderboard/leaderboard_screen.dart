import 'package:flutter/material.dart';
import 'package:hackathon/screens/profile/profile_screen.dart';
import 'package:hackathon/utils/app_colors.dart';
import 'package:hackathon/utils/app_text_styles.dart';
import 'package:hackathon/widgets/app_appbar.dart';
import 'package:go_router/go_router.dart';

class LeaderboardScreen extends StatefulWidget {
  static const route = "leaderboard";

  const LeaderboardScreen({super.key});

  @override
  State<LeaderboardScreen> createState() => _LeaderboardScreenState();
}

class _LeaderboardScreenState extends State<LeaderboardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppAppbar(
        screenTitle: "Leaderboard",
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const Text(
              'January',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                buildTopUser(
                  name: 'Ali',
                  points: 49000,
                  imageUrl: 'assets/images/user.webp',
                  isCrowned: false,
                ),
                const SizedBox(width: 16),
                buildTopUser(
                  name: 'Chanchal',
                  points: 50000,
                  imageUrl: 'assets/images/foreign_worker.jpg',
                  isCrowned: true,
                ),
                const SizedBox(width: 16),
                buildTopUser(
                  name: 'Jack',
                  points: 39000,
                  imageUrl: 'assets/images/user.webp',
                  isCrowned: false,
                ),
              ],
            ),
            const SizedBox(height: 32),
            Expanded(
              child: ListView(
                children: [
                  buildUserTile(
                    name: 'Jirayu Tangsrisuk',
                    points: 20000,
                    rank: '04',
                    imageUrl: 'assets/images/thai_guy.jpg',
                  ),
                  buildUserTile(
                    name: 'Eunise',
                    points: 19000,
                    rank: '05',
                    imageUrl: 'assets/images/user.webp',
                  ),
                  buildUserTile(
                    name: 'B',
                    points: 18000,
                    rank: '06',
                    imageUrl: 'assets/images/user.webp',
                  ),
                  buildUserTile(
                    name: 'C',
                    points: 17000,
                    rank: '07',
                    imageUrl: 'assets/images/user.webp',
                  ),
                  buildUserTile(
                    name: 'D',
                    points: 15000,
                    rank: '08',
                    imageUrl: 'assets/images/user.webp',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Widget for the top 3 users
  Widget buildTopUser({
    required String name,
    required int points,
    required String imageUrl,
    required bool isCrowned,
  }) {
    return Column(
      children: [
        if (isCrowned)
          const Icon(
            Icons.emoji_events,
            color: AppColors.lightOrange,
            size: 32,
          ),
        CircleAvatar(
          backgroundImage: AssetImage(imageUrl),
          radius: 40,
        ),
        const SizedBox(height: 8),
        Text(
          name,
          style: AppTextStyles.bold_16,
        ),
        Text('$points points'),
      ],
    );
  }

  Widget buildUserTile({
    required String name,
    required int points,
    required String rank,
    required String imageUrl,
  }) {
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: AssetImage(imageUrl),
        radius: 24,
      ),
      title: GestureDetector(
        onTap: () => context.pushNamed(ProfileScreen.route),
        child: Text(name, style: AppTextStyles.bold_14),
      ),
      subtitle: Text('$points points'),
      trailing: Text(
        rank,
        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
      ),
    );
  }
}
