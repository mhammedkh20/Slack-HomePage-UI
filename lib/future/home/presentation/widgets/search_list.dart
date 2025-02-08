import 'package:flutter/cupertino.dart';
import 'package:slack_ui_homepage/future/home/presentation/widgets/user_item_widget.dart';

class SearchList extends StatelessWidget {
  const SearchList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.only(top: 16, right: 16, left: 16, bottom: 14),
      children: const [
        UserItemWidget(
          name: "Mohammed Khaled (you)",
          image: "assets/images/image.JPEG",
          count: "0",
        ),
        SizedBox(height: 20),
        UserItemWidget(
          name: "Ahmed",
          image: "assets/images/vice4.png",
          count: "2",
          isActive: true,
          isBold: true,
        ),
        SizedBox(height: 20),
        UserItemWidget(
            image: "assets/images/vice3.png",
            name: "Sahar",
            count: "+99",
            isBold: true),
        SizedBox(height: 20),
        UserItemWidget(
            image: "assets/images/vice10.png",
            name: "Jack",
            count: "+10",
            isActive: true,
            isBold: true),
      ],
    );
  }
}
