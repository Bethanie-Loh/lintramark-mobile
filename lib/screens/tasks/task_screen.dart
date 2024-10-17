import 'package:flutter/material.dart';
import 'package:hackathon/screens/tasks/location_task_screen.dart';
import 'package:hackathon/screens/tasks/widgets/item_task.dart';
import 'package:hackathon/utils/app_colors.dart';
import 'package:hackathon/utils/app_text_styles.dart';
import 'package:hackathon/widgets/app_appbar.dart';
import 'package:go_router/go_router.dart';

class TaskScreen extends StatefulWidget {
  static const route = "tasks";

  const TaskScreen({super.key});

  @override
  State<TaskScreen> createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppAppbar(
        screenTitle: "Today's Task",
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Center(
              child: Padding(
                padding: EdgeInsets.all(8),
                child: Text(
                  '18/10/2024',
                  style: AppTextStyles.bold_24,
                ),
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ListView(
                children: [
                  buildTimeSection(
                    '6:00 AM - 8:00 AM',
                    [
                      const ItemTask(
                        initialChecked: true,
                        title: 'Identify and Mark Ripe Bunches',
                        overDue: false,
                      ),
                    ],
                  ),
                  buildTimeSection(
                    '8:00 AM - 10:00 AM',
                    [
                      const ItemTask(
                        initialChecked: false,
                        title: 'Cut Fruit Bunches',
                        overDue: true,
                      ),
                    ],
                  ),
                  buildTimeSection(
                    '10:00 AM - 12:00 PM',
                    [
                      const ItemTask(
                        initialChecked: true,
                        title: 'Transport Bunches to Collection Point',
                        overDue: false,
                      ),
                    ],
                  ),
                  buildTimeSection(
                    '12:00 PM - 2:00 PM',
                    [
                      const ItemTask(
                        initialChecked: true,
                        title: 'Loose Fruit Collection',
                        overDue: false,
                      ),
                    ],
                  ),
                  buildTimeSection(
                    '2:00 PM - 4:00 PM',
                    [
                      const ItemTask(
                        initialChecked: false,
                        title: 'Prune Fronds',
                        overDue: false,
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.pushNamed(LocationTaskScreen.route);
        },
        backgroundColor: AppColors.orange,
        child: const Icon(
          Icons.location_on,
          color: AppColors.white,
        ),
      ),
    );
  }

  Widget buildTimeSection(String time, List<Widget> tasks) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
      ),
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Text(
              time,
              style: AppTextStyles.bold_16,
            ),
          ),
          Column(children: tasks),
          const SizedBox(height: 8),
        ],
      ),
    );
  }
}
