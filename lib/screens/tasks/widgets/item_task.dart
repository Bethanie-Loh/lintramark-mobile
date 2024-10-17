import 'package:flutter/material.dart';
import 'package:hackathon/utils/app_colors.dart';
import 'package:hackathon/utils/app_text_styles.dart';

class ItemTask extends StatefulWidget {
  final String title;
  final bool initialChecked;
  final bool overDue;

  const ItemTask(
      {super.key,
      required this.title,
      this.initialChecked = false,
      required this.overDue});

  @override
  ItemTaskState createState() => ItemTaskState();
}

class ItemTaskState extends State<ItemTask> {
  bool isChecked = false;

  @override
  void initState() {
    super.initState();
    isChecked = widget.initialChecked;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 4),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Container(
        color: widget.overDue ? Colors.red[200] : Colors.transparent,
        child: Row(
          children: [
            Checkbox(
              value: isChecked,
              onChanged: (bool? value) {
                setState(() {
                  isChecked = value ?? false;
                });
              },
              fillColor: WidgetStateProperty.resolveWith<Color?>(
                (Set<WidgetState> states) {
                  if (states.contains(WidgetState.selected)) {
                    return AppColors.orange;
                  }
                  return null;
                },
              ),
            ),
            const SizedBox(width: 4),
            Expanded(
              child: Text(
                widget.title,
                style: AppTextStyles.regular_16.copyWith(
                  color: Colors.black,
                  decoration: isChecked
                      ? TextDecoration.lineThrough
                      : TextDecoration.none,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
