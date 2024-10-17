import 'package:flutter/material.dart';
import 'package:hackathon/utils/app_colors.dart';
import 'package:hackathon/utils/app_text_styles.dart';
import 'package:hackathon/widgets/app_appbar.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});
  static const route = 'Profile';
  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  int _likes = 30;
  bool _isLiked = false;
  bool _animationCompleted = false;

  void _toggleLike() async {
    setState(() {
      _isLiked = !_isLiked;
      if (_isLiked) {
        _likes++;
      } else {
        _likes--;
      }
      _animationCompleted = false;
    });

    await Future.delayed(const Duration(milliseconds: 200));
    setState(() {
      _animationCompleted = true;
    });
  }

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
                backgroundImage: AssetImage('assets/images/thai_guy.jpg'),
              ),
              const SizedBox(height: 20),
              const Text(
                'Jirayu Tangsrisuk',
                style: AppTextStyles.bold_24,
              ),
              const SizedBox(height: 10),
              GestureDetector(
                onTap: _toggleLike,
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  padding: const EdgeInsets.all(8),
                  transform: Matrix4.identity()
                    ..scale(_isLiked && !_animationCompleted ? 1.2 : 1.0),
                  child: Icon(
                    _isLiked ? Icons.thumb_up_alt : Icons.thumb_up_alt_outlined,
                    size: 50,
                    color: _isLiked ? AppColors.orange : Colors.black,
                  ),
                ),
              ),
              const Text(
                'Give him a like!',
                style: AppTextStyles.bold_italic_16,
              ),
              const SizedBox(height: 40),
              _buildInfoCard('Age', '37'),
              _buildInfoCard('Ranking', '1'),
              _buildInfoCard('Likes', _likes.toString()),
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
