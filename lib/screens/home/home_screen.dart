import 'package:flutter/material.dart';
import 'package:hackathon/screens/tasks/location_task_screen.dart';
import 'package:hackathon/utils/app_colors.dart';
import 'package:hackathon/utils/app_text_styles.dart';
import 'package:hackathon/widgets/app_appbar.dart';
import 'package:hackathon/widgets/app_drawer.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  static const route = 'home';
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppAppbar(
        screenTitle: "LintraMark",
      ),
      drawer: const AppDrawer(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  margin: const EdgeInsets.all(10),
                  padding: const EdgeInsets.all(2),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.darkBlue,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: IconButton(
                    icon: const Icon(
                      Icons.location_on,
                      color: AppColors.white,
                      size: 30,
                    ),
                    onPressed: () {
                      context.pushNamed(LocationTaskScreen.route);
                    },
                  ),
                ),
              ],
            ),
            Center(
              child: Column(
                children: [
                  const Text(
                    'Group 3',
                    style: AppTextStyles.bold_24,
                  ),
                  const Text(
                    'Your Role Today',
                    style: AppTextStyles.bold_20,
                  ),
                  const SizedBox(height: 20),
                  Image.asset(
                    'assets/images/harvester.png',
                    height: 200,
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'Harvester',
                    style: AppTextStyles.bold_20,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 40),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  const SizedBox(width: 20),
                  _buildTaskCard('assets/images/weed.png', 'Remove weeds'),
                  const SizedBox(width: 20),
                  _buildTaskCard('assets/images/wheat.png', 'Harvest Wheat'),
                  const SizedBox(width: 20),
                  _buildTaskCard('assets/images/watering.png', 'Watering'),
                  const SizedBox(width: 20),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTaskCard(String imagePath, String taskName) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.yellow,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Image.asset(
            imagePath,
            height: 80,
          ),
          const SizedBox(height: 10),
          Text(
            taskName,
            style: AppTextStyles.bold_14,
          ),
        ],
      ),
    );
  }
}
