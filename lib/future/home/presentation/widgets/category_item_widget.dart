import 'package:flutter/material.dart';
import 'package:slack_ui_homepage/future/home/models/category.dart';

class CategoryItemWidget extends StatelessWidget {
  final int id;
  final Category category;
  final bool dragEnabled;
  final bool isLocked;

  const CategoryItemWidget({
    super.key,
    required this.id,
    required this.category,
    this.dragEnabled = true,
    this.isLocked = false,
  });

  @override
  Widget build(BuildContext context) {
    return Wrap(children: [
      Container(
        // width: 120,
        margin: const EdgeInsets.symmetric(horizontal: 4),
        padding:
            const EdgeInsets.only(right: 24, left: 12, top: 12, bottom: 12),
        decoration: BoxDecoration(
          color: id == 0 ? Color(0xfff4eff4) : Color(0xffFFFFFF),
          // color: isLocked ? Color(0xfff4eff4) : Color(0xffFFFFFF),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: Colors.grey.withOpacity(.3),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(
              category.icon,
              color: id == 0 ? Color(0xff380639) : Color(0xff454446),
            ),
            SizedBox(height: 5),
            Text(
              category.title,
              style: TextStyle(
                  color: id == 0 ? Color(0xff380539) : Color(0xff454446),
                  fontWeight: id == 0 ? FontWeight.w800 : FontWeight.w400),
            ),
            Row(
              children: [
                Text(
                  category.subtitle,
                  style: TextStyle(
                    color: id == 0 ? Color(0xff380539) : Color(0xff7b797e),
                  ),
                ),
                SizedBox(width: 3),
                Text(
                  category.count.toString(),
                  style: TextStyle(
                    color: id == 0 ? Color(0xff380539) : Color(0xff7b797e),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    ]);
  }
}
