import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:slack_ui_homepage/app_config.dart';
import 'package:slack_ui_homepage/future/main/presentation/pages/main_screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: AppConfig.blocs,
      child: ScreenUtilInit(
        designSize: const Size(390, 844),
        minTextAdapt: true,
        useInheritedMediaQuery: true,
        splitScreenMode: true,
        builder: (context, child) {
          return MaterialApp(
            title: 'Slack',
            theme: AppConfig.themeData(),
            debugShowCheckedModeBanner: false,
            localizationsDelegates: AppConfig.localization(),
            supportedLocales: AppConfig.supportedLocales(),
            locale: const Locale('en'),
            home: const MainScreen(),
          );
        },
      ),
    );
  }
}
