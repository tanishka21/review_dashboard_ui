import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:review_dashboard_ui/routes/app_routes.dart';
import 'package:review_dashboard_ui/utils/app_theme.dart';
import 'package:review_dashboard_ui/utils/constants.dart';
import 'package:review_dashboard_ui/view/Home/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: AppStrings.appName,
      theme: AppTheme.lightTheme.copyWith(
        visualDensity: VisualDensity.adaptivePlatformDensity,
        textTheme: Theme.of(context).textTheme.apply(fontFamily: 'Satoshi'),
      ),
      debugShowCheckedModeBanner: false,

      home: const Home(),
      initialRoute: AppPages.initial,
      getPages: AppPages.routes,
    );
  }
}
