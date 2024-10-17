import 'package:flutter/material.dart';
import 'package:hackathon/utils/app_colors.dart';
import 'package:hackathon/utils/app_text_styles.dart';
import 'package:hackathon/widgets/app_appbar.dart';

class SelfProfileScreen extends StatefulWidget {
  const SelfProfileScreen({super.key});
  static const route = 'self_profile';
  @override
  State<SelfProfileScreen> createState() => _SelfProfileScreenState();
}

class _SelfProfileScreenState extends State<SelfProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppAppbar(screenTitle: "Profile"),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              const SizedBox(height: 40),
              const CircleAvatar(
                radius: 60,
                backgroundImage: AssetImage('assets/images/foreign_worker.jpg'),
              ),
              const SizedBox(height: 20),
              const Text(
                'Chanchal Chowdhury',
                style: AppTextStyles.bold_24,
              ),
              const SizedBox(height: 10),
              const SizedBox(height: 40),
              _buildInfoCard('Age', '37'),
              _buildInfoCard('Ranking', '1'),
              _buildInfoCard('Likes', '24'),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInfoCard(String label, String value) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 60, vertical: 10),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      decoration: BoxDecoration(
        color: AppColors.lightOrange,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: AppTextStyles.bold_16,
          ),
          Container(
            width: 100,
            padding: const EdgeInsets.symmetric(vertical: 10),
            decoration: BoxDecoration(
              color: AppColors.yellow,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(
              child: Text(
                value,
                style: AppTextStyles.regular_18,
              ),
            ),
          )
        ],
      ),
    );
  }
}
