import 'package:flutter/material.dart';
import 'package:hackathon/screens/profile/profile_screen.dart';
import 'package:go_router/go_router.dart';
import 'package:hackathon/screens/profile/self_profile_screen.dart';

import '../utils/app_colors.dart';
import '../utils/app_text_styles.dart';

// ignore: must_be_immutable
class AppAppbar extends StatefulWidget implements PreferredSizeWidget {
  String? screenTitle;

  AppAppbar({super.key, this.screenTitle});

  @override
  State<AppAppbar> createState() => _AppAppbarState();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _AppAppbarState extends State<AppAppbar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () {
              Navigator.popUntil(context, (route) => route.isFirst);
            },
            child: Text(
              widget.screenTitle!,
              style: AppTextStyles.bold_24.copyWith(color: AppColors.white),
              textAlign: TextAlign.center,
            ),
          )
        ],
      ),
      backgroundColor: AppColors.orange,
      iconTheme: const IconThemeData(color: Colors.white),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 16.0),
          child: PopupMenuButton<String>(
            color: AppColors.orange,
            onSelected: (value) {
              if (value == 'Profile') {
                context.pushNamed(SelfProfileScreen.route);
              } else if (value == 'Logout') {
                // Add your logout functionality here
              }
            },
            itemBuilder: (BuildContext context) {
              return [
                const PopupMenuItem<String>(
                  value: 'Profile',
                  child: Text('Profile', style: AppTextStyles.bold_14),
                ),
                const PopupMenuItem<String>(
                  value: 'Logout',
                  child: Text('Logout', style: AppTextStyles.bold_14),
                ),
              ];
            },
            child: SizedBox(
              width: 26,
              height: 26,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: Image.asset(
                  "assets/images/foreign_worker.jpg",
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: double.infinity,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
