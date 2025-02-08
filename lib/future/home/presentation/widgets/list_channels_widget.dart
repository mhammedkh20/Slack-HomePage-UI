import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:slack_ui_homepage/future/home/models/category.dart';
import 'package:slack_ui_homepage/future/home/presentation/widgets/category_item_widget.dart';
import 'package:slack_ui_homepage/future/home/presentation/widgets/dragable_listview/animated_reorderable_listview.dart';
import 'package:slack_ui_homepage/future/home/presentation/widgets/item_widget.dart';
import 'package:slack_ui_homepage/future/home/presentation/widgets/user_item_widget.dart';

class ListChannelsWidget extends StatefulWidget {
  final ScrollController controller;
  final AnimationController animationDragDrop;
  const ListChannelsWidget(
      {super.key, required this.controller, required this.animationDragDrop});

  @override
  State<ListChannelsWidget> createState() => _ListChannelsWidgetState();
}

class _ListChannelsWidgetState extends State<ListChannelsWidget> {
  bool expandMentions = false;
  bool expandUnread = false;
  bool expandChannel = false;
  bool expandMessage = false;

  List<Category> nonDraggableItems = [];
  List<Category> lockedItems = [];

  late List<Category> listCategory;

  @override
  void initState() {
    listCategory = getCategories();
    // nonDraggableItems = listCategory.where((user) => user.id == 1).toList();
    // lockedItems = listCategory.where((user) => user.id == 0).toList();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.zero,
      physics: const BouncingScrollPhysics(),
      controller: widget.controller,
      children: [
        Padding(
          padding:
              const EdgeInsets.only(top: 16, right: 16, left: 16, bottom: 14),
          child: SizedBox(
            height: 100,
            child: AnimatedReorderableListView(
              padding: EdgeInsets.zero,
              onReorderStart: (p0) {
                widget.animationDragDrop.forward();
              },
              onReorderEnd: (int p0) {
                widget.animationDragDrop.reverse();
              },
              scrollDirection: Axis.horizontal,
              items: listCategory,
              itemBuilder: (BuildContext context, int index) {
                final category = listCategory[index];
                return CategoryItemWidget(
                  key: ValueKey(category.id),
                  id: category.id,
                  category: category,
                  dragEnabled: !nonDraggableItems.contains(category),
                  isLocked: lockedItems.contains(category),
                );
              },
              nonDraggableItems: nonDraggableItems,
              lockedItems: lockedItems,
              dragStartDelay: const Duration(milliseconds: 200),
              onReorder: (int oldIndex, int newIndex) {
                setState(() {
                  final Category user = listCategory.removeAt(oldIndex);
                  listCategory.remove(user);
                  listCategory.insert(newIndex, user);
                });
              },
              proxyDecorator: proxyDecorator,
              isSameItem: (a, b) => a.id == b.id,
            ),
          ),
        ),
        const Divider(color: Color(0xffdddddd), height: 0),
        const SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CupertinoButton(
                    onPressed: () {
                      expandMentions = !expandMentions;
                      setState(() {});
                    },
                    minSize: 0,
                    padding: EdgeInsets.zero,
                    child: const Text(
                      "Mentions",
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Color(0xff1c1c1c)),
                    ),
                  ),
                  AnimatedRotation(
                    turns: expandMentions ? .5 : .75,
                    duration: const Duration(milliseconds: 200),
                    child: GestureDetector(
                      onTap: () {
                        expandMentions = !expandMentions;
                        setState(() {});
                      },
                      child: const Icon(
                        Icons.arrow_back_ios_rounded,
                        color: Color(0xff868686),
                      ),
                    ),
                  ),
                ],
              ),
              AnimatedSize(
                duration: const Duration(milliseconds: 300),
                child: SizedBox(
                  height: expandMentions ? 0 : null,
                  child: const Column(
                    children: [
                      SizedBox(height: 20),
                      ItemWidget(title: "general", count: 1),
                      SizedBox(height: 20),
                      ItemWidget(title: "social-media-related-works", count: 6),
                      SizedBox(height: 20),
                      ItemWidget(title: "aid", count: 6),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
        const SizedBox(height: 20),
        const Divider(color: Color(0xffdddddd), height: 0),
        const SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CupertinoButton(
                    padding: EdgeInsets.zero,
                    onPressed: () {
                      expandUnread = !expandUnread;
                      setState(() {});
                    },
                    minSize: 0,
                    child: const Text(
                      "Unreads",
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Color(0xff1c1c1c)),
                    ),
                  ),
                  AnimatedRotation(
                    turns: expandUnread ? .5 : .75,
                    duration: const Duration(milliseconds: 200),
                    child: GestureDetector(
                      onTap: () {
                        expandUnread = !expandUnread;
                        setState(() {});
                      },
                      child: const Icon(
                        Icons.arrow_back_ios_rounded,
                        color: Color(0xff868686),
                      ),
                    ),
                  ),
                ],
              ),
              AnimatedSize(
                duration: const Duration(milliseconds: 300),
                child: SizedBox(
                  height: expandUnread ? 0 : null,
                  child: const Column(
                    children: [
                      SizedBox(height: 20),
                      ItemWidget(title: "ways-to-evacuate", count: 0),
                      SizedBox(height: 20),
                      ItemWidget(
                          title: "Add channel",
                          count: 0,
                          isBold: false,
                          icon: Icons.add),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
        const SizedBox(height: 20),
        const Divider(color: Color(0xffdddddd), height: 0),
        const SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CupertinoButton(
                    padding: EdgeInsets.zero,
                    onPressed: () {
                      expandChannel = !expandChannel;
                      setState(() {});
                    },
                    minSize: 0,
                    child: const Text(
                      "Channels",
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Color(0xff1c1c1c)),
                    ),
                  ),
                  AnimatedRotation(
                    turns: expandChannel ? .5 : .75,
                    duration: const Duration(milliseconds: 200),
                    child: GestureDetector(
                      onTap: () {
                        expandChannel = !expandChannel;
                        setState(() {});
                      },
                      child: const Icon(
                        Icons.arrow_back_ios_rounded,
                        color: Color(0xff868686),
                      ),
                    ),
                  ),
                ],
              ),
              AnimatedSize(
                duration: const Duration(milliseconds: 200),
                child: SizedBox(
                  height: expandChannel ? 0 : null,
                  child: const Column(
                    children: [
                      SizedBox(height: 20),
                      ItemWidget(
                        title: "bombings",
                        count: 0,
                        isBold: false,
                      ),
                      SizedBox(height: 20),
                      ItemWidget(
                        title: "fundraising-tips-and-strategies",
                        count: 0,
                        isBold: false,
                      ),
                      SizedBox(height: 20),
                      ItemWidget(
                        title: "welcome",
                        count: 0,
                        isBold: false,
                      ),
                      SizedBox(height: 20),
                      ItemWidget(
                        title: "Add channel",
                        count: 0,
                        isBold: false,
                        icon: Icons.add,
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
        const SizedBox(height: 20),
        const Divider(color: Color(0xffdddddd), height: 0),
        const SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CupertinoButton(
                    padding: EdgeInsets.zero,
                    onPressed: () {
                      expandMessage = !expandMessage;
                      setState(() {});
                    },
                    minSize: 0,
                    child: const Text(
                      "Direct Messages",
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Color(0xff1c1c1c)),
                    ),
                  ),
                  AnimatedRotation(
                    turns: expandMessage ? .5 : .75,
                    duration: const Duration(milliseconds: 200),
                    child: GestureDetector(
                      onTap: () {
                        expandMessage = !expandMessage;
                        setState(() {});
                      },
                      child: const Icon(
                        Icons.arrow_back_ios_rounded,
                        color: Color(0xff868686),
                      ),
                    ),
                  ),
                ],
              ),
              AnimatedSize(
                duration: const Duration(milliseconds: 200),
                child: SizedBox(
                  height: expandMessage ? 0 : null,
                  child: const Column(
                    children: [
                      SizedBox(height: 20),
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
                  ),
                ),
              )
            ],
          ),
        ),
        const SizedBox(height: 100),
      ],
    );
  }

  Widget proxyDecorator(
    Widget child,
    int index,
    Animation<double> animation,
  ) {
    return AnimatedBuilder(
      animation: animation,
      builder: (BuildContext context, Widget? child) {
        return ScaleTransition(
          scale: Tween<double>(begin: 1, end: 1.08)
              .animate(widget.animationDragDrop),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(.16),
                  blurRadius: 10,
                  spreadRadius: 1,
                ),
              ],
            ),
            child: child,
          ),
        );
      },
      child: child,
    );
  }

  List<Category> getCategories() {
    return [
      Category(
        icon: Icons.style,
        title: "Catch Up",
        subtitle: "new",
        count: 4,
        id: 0,
      ),
      Category(
        icon: Icons.chat_outlined,
        title: "Threads",
        subtitle: "new",
        count: 0,
        id: 1,
      ),
      Category(
        icon: Icons.speaker_group_outlined,
        title: "Huddles",
        subtitle: "live",
        count: 0,
        id: 2,
      ),
      Category(
        icon: Icons.bookmark_border_outlined,
        title: "Later",
        subtitle: "items",
        count: 4,
        id: 3,
      ),
      Category(
        icon: Icons.send_outlined,
        title: "Drafts & Sent",
        subtitle: "item",
        count: 1,
        id: 4,
      ),
    ];
  }
}
