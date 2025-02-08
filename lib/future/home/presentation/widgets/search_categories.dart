import 'package:flutter/cupertino.dart';
import 'package:slack_ui_homepage/future/home/presentation/widgets/item_search.dart';

class SearchCategories extends StatefulWidget {
  final bool isCheckForShowSearchBar;
  const SearchCategories({super.key, required this.isCheckForShowSearchBar});

  @override
  State<SearchCategories> createState() => _SearchCategoriesState();
}

class _SearchCategoriesState extends State<SearchCategories> {
  int indexSelected = 0;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      height: widget.isCheckForShowSearchBar ? 35 : 0,
      duration: const Duration(milliseconds: 200),
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: 6,
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.zero,
        itemBuilder: (context, index) {
          return ItemSearch(
            name: [
              "Recents",
              "Files",
              "Canvases",
              "Channels",
              "People",
              "Workflows"
            ][index],
            isSelected: indexSelected == index,
            onTap: () {
              setState(() {
                indexSelected = index;
              });
            },
          );
        },
      ),
    );
  }
}
