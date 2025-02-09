import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:slack_ui_homepage/future/home/models/category.dart';
import 'package:slack_ui_homepage/future/home/presentation/manager/home_bloc/home_bloc.dart';
import 'package:slack_ui_homepage/future/home/presentation/widgets/category_item_widget.dart';
import 'package:slack_ui_homepage/future/home/presentation/widgets/dragable_listview/animated_reorderable_listview.dart';
import 'package:slack_ui_homepage/future/home/presentation/widgets/item_widget.dart';
import 'package:slack_ui_homepage/future/home/presentation/widgets/user_item_widget.dart';

class ListChannelsWidget extends StatelessWidget {
  // final List<Category> nonDraggableItems ;
  // final List<Category> lockedItems;

  final ScrollController controller;
  final AnimationController animationDragDrop;

  const ListChannelsWidget({
    super.key,
    required this.controller,
    required this.animationDragDrop,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.zero,
      physics: const BouncingScrollPhysics(),
      controller: controller,
      children: [
        Padding(
          padding:
              const EdgeInsets.only(top: 16, right: 16, left: 16, bottom: 14),
          child: SizedBox(
            height: 100,
            child: BlocBuilder<HomeBloc, HomeState>(
              buildWhen: (previous, current) => current is CategoryChangeState,
              builder: (context, state) {
                return AnimatedReorderableListView(
                  padding: EdgeInsets.zero,
                  onReorderStart: (p0) {
                    animationDragDrop.forward();
                  },
                  onReorderEnd: (int p0) {
                    animationDragDrop.reverse();
                  },
                  scrollDirection: Axis.horizontal,
                  items: context.read<HomeBloc>().allCategories,
                  itemBuilder: (BuildContext context, int index) {
                    final category =
                        context.read<HomeBloc>().allCategories[index];
                    return CategoryItemWidget(
                      key: ValueKey(category.id),
                      id: category.id,
                      category: category,
                      dragEnabled:
                          true, // !nonDraggableItems.contains(category),
                      isLocked: false, //lockedItems.contains(category),
                    );
                  },
                  nonDraggableItems: <Category>[], // nonDraggableItems,
                  lockedItems: <Category>[], //lockedItems,
                  dragStartDelay: const Duration(milliseconds: 200),
                  onReorder: (int oldIndex, int newIndex) {
                    context.read<HomeBloc>().add(CategoryChangeEvent(
                          oldIndex: oldIndex,
                          newIndex: newIndex,
                        ));
                  },
                  proxyDecorator: proxyDecorator,
                  isSameItem: (a, b) => a.id == b.id,
                );
              },
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
                      bool currentState =
                          context.read<HomeBloc>().expandMentions;
                      context
                          .read<HomeBloc>()
                          .add(ExpandMentionsEvent(!currentState));
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
                  BlocBuilder<HomeBloc, HomeState>(
                    buildWhen: (previous, current) =>
                        current is ExpandMentionsState,
                    builder: (context, state) {
                      bool state = context.read<HomeBloc>().expandMentions;
                      return AnimatedRotation(
                        turns: state ? .5 : .75,
                        duration: const Duration(milliseconds: 200),
                        child: GestureDetector(
                          onTap: () {
                            context
                                .read<HomeBloc>()
                                .add(ExpandMentionsEvent(!state));
                          },
                          child: const Icon(
                            Icons.arrow_back_ios_rounded,
                            color: Color(0xff868686),
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
              BlocBuilder<HomeBloc, HomeState>(
                buildWhen: (previous, current) =>
                    current is ExpandMentionsState,
                builder: (context, state) {
                  return AnimatedSize(
                    duration: const Duration(milliseconds: 300),
                    child: SizedBox(
                      height:
                          context.read<HomeBloc>().expandMentions ? 0 : null,
                      child: const Column(
                        children: [
                          SizedBox(height: 20),
                          ItemWidget(title: "general", count: 1),
                          SizedBox(height: 20),
                          ItemWidget(
                              title: "social-media-related-works", count: 6),
                          SizedBox(height: 20),
                          ItemWidget(title: "aid", count: 6),
                        ],
                      ),
                    ),
                  );
                },
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
                      bool currentState = context.read<HomeBloc>().expandUnread;
                      context
                          .read<HomeBloc>()
                          .add(ExpandUnreadEvent(!currentState));
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
                  BlocBuilder<HomeBloc, HomeState>(
                    buildWhen: (previous, current) =>
                        current is ExpandUnreadState,
                    builder: (context, state) {
                      bool state = context.read<HomeBloc>().expandUnread;

                      return AnimatedRotation(
                        turns: state ? .5 : .75,
                        duration: const Duration(milliseconds: 200),
                        child: GestureDetector(
                          onTap: () {
                            context
                                .read<HomeBloc>()
                                .add(ExpandUnreadEvent(!state));
                          },
                          child: const Icon(
                            Icons.arrow_back_ios_rounded,
                            color: Color(0xff868686),
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
              AnimatedSize(
                duration: const Duration(milliseconds: 300),
                child: BlocBuilder<HomeBloc, HomeState>(
                  buildWhen: (previous, current) =>
                      current is ExpandUnreadState,
                  builder: (context, state) {
                    return SizedBox(
                      height: context.read<HomeBloc>().expandUnread ? 0 : null,
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
                    );
                  },
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
                      bool currentState =
                          context.read<HomeBloc>().expandChannel;
                      context
                          .read<HomeBloc>()
                          .add(ExpandChannelEvent(!currentState));
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
                  BlocBuilder<HomeBloc, HomeState>(
                    buildWhen: (previous, current) =>
                        current is ExpandChannelState,
                    builder: (context, state) {
                      bool state = context.read<HomeBloc>().expandChannel;

                      return AnimatedRotation(
                        turns: state ? .5 : .75,
                        duration: const Duration(milliseconds: 200),
                        child: GestureDetector(
                          onTap: () {
                            context
                                .read<HomeBloc>()
                                .add(ExpandChannelEvent(!state));
                          },
                          child: const Icon(
                            Icons.arrow_back_ios_rounded,
                            color: Color(0xff868686),
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
              AnimatedSize(
                duration: const Duration(milliseconds: 200),
                child: BlocBuilder<HomeBloc, HomeState>(
                  buildWhen: (previous, current) =>
                      current is ExpandChannelState,
                  builder: (context, state) {
                    return SizedBox(
                      height: context.read<HomeBloc>().expandChannel ? 0 : null,
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
                    );
                  },
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
                      bool currentState =
                          context.read<HomeBloc>().expandMessage;
                      context
                          .read<HomeBloc>()
                          .add(ExpandMessageEvent(!currentState));
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
                  BlocBuilder<HomeBloc, HomeState>(
                    buildWhen: (previous, current) =>
                        current is ExpandMessageState,
                    builder: (context, state) {
                      bool state = context.read<HomeBloc>().expandMessage;
                      return AnimatedRotation(
                        turns: state ? .5 : .75,
                        duration: const Duration(milliseconds: 200),
                        child: GestureDetector(
                          onTap: () {
                            context
                                .read<HomeBloc>()
                                .add(ExpandMessageEvent(!state));
                          },
                          child: const Icon(
                            Icons.arrow_back_ios_rounded,
                            color: Color(0xff868686),
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
              AnimatedSize(
                duration: const Duration(milliseconds: 200),
                child: BlocBuilder<HomeBloc, HomeState>(
                  buildWhen: (previous, current) =>
                      current is ExpandMessageState,
                  builder: (context, state) {
                    return SizedBox(
                      height: context.read<HomeBloc>().expandMessage ? 0 : null,
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
                    );
                  },
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
          scale: Tween<double>(begin: 1, end: 1.08).animate(animationDragDrop),
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
}
