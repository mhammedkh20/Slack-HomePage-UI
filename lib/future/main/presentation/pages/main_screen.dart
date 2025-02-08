import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:slack_ui_homepage/future/activity/presentation/pages/activity_widget.dart';
import 'package:slack_ui_homepage/future/dms/presentation/pages/dms_widget.dart';
import 'package:slack_ui_homepage/future/home/presentation/pages/home_page.dart';
import 'package:slack_ui_homepage/future/main/presentation/manager/main_bloc.dart';
import 'package:slack_ui_homepage/future/main/presentation/widgets/my_bottom_nav_bar.dart';
import 'package:slack_ui_homepage/future/main/presentation/widgets/my_floating_action_button.dart';
import 'package:slack_ui_homepage/future/more/presentation/pages/more_widget.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  List<Widget> listScreens = [
    const HomePage(),
    const DmsWidget(),
    const ActivityWidget(),
    const MoreWidget(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff2b032d),
      body: BlocBuilder<MainBloc, MainState>(
        builder: (context, state) {
          return listScreens[state.indexTap];
        },
      ),
      bottomNavigationBar: const MyBottomNavBar(),
      floatingActionButton: const MyFloatingActionButton(),
    );
  }
}
