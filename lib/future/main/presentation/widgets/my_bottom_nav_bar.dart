import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:slack_ui_homepage/future/main/presentation/manager/main_bloc.dart';
import 'package:slack_ui_homepage/future/main/presentation/widgets/item_bottom_nav_widget.dart';

class MyBottomNavBar extends StatelessWidget {
  const MyBottomNavBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Wrap(
        children: [
          const Divider(color: Color(0xffdddddd), height: 0),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 32,
            ),
            child: BlocBuilder<MainBloc, MainState>(
              builder: (context, state) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ItemBottomNav(
                        title: "Home",
                        onPressed: () {
                          context.read<MainBloc>().add(const MainEvent(0));
                        },
                        icon: Icons.home,
                        isSelected: state.indexTap == 0,
                        isNotify: true),
                    ItemBottomNav(
                        title: "DMs",
                        onPressed: () {
                          context.read<MainBloc>().add(const MainEvent(1));
                        },
                        icon: Icons.message_rounded,
                        isSelected: state.indexTap == 1,
                        isNotify: false),
                    ItemBottomNav(
                        title: "Activity",
                        onPressed: () {
                          context.read<MainBloc>().add(const MainEvent(2));
                        },
                        icon: Icons.notifications_none,
                        isSelected: state.indexTap == 2,
                        isNotify: true),
                    ItemBottomNav(
                        title: "More",
                        onPressed: () {
                          context.read<MainBloc>().add(const MainEvent(3));
                        },
                        icon: Icons.more_horiz,
                        isSelected: state.indexTap == 3,
                        isNotify: false),
                  ],
                );
              },
            ),
          ),
          Container(
            height: MediaQuery.of(context).padding.bottom,
          ),
        ],
      ),
    );
  }
}
