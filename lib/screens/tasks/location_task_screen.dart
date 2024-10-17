import 'package:flutter/material.dart';
import 'package:hackathon/screens/tasks/widgets/google_map.dart';
import 'package:hackathon/screens/tasks/widgets/item_task.dart';
import 'package:hackathon/utils/app_text_styles.dart';
import 'package:hackathon/widgets/app_appbar.dart';

class LocationTaskScreen extends StatefulWidget {
  static const route = "tasks_location";

  const LocationTaskScreen({super.key});

  @override
  State<LocationTaskScreen> createState() => _LocationTaskScreenState();
}

class _LocationTaskScreenState extends State<LocationTaskScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppAppbar(
        screenTitle: "Current Area",
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Center(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 20),
                child: Text(
                  "Zone B",
                  style: AppTextStyles.bold_24,
                ),
              ),
            ),
            Expanded(
              child: ListView(
                children: [
                  buildTimeSection('8:00 AM - 10:00 AM', [
                    const ItemTask(
                      initialChecked: true,
                      title: 'Cut Fruit Bunches',
                      overDue: false,
                    ),
                  ]),
                ],
              ),
            ),
            const MapComponent(),
          ],
        ),
      ),
    );
  }

  // Build time sections for tasks
  Widget buildTimeSection(String time, List<Widget> tasks) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          time,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        Column(children: tasks),
        const SizedBox(height: 16),
      ],
    );
  }
}
