import 'package:flutter/material.dart';
import 'package:review_dashboard_ui/utils/app_color.dart';

class AppStyles {
  AppStyles._();

  // Headline styles
  static TextStyle headline1 = const TextStyle(
    fontSize: 28,
    fontWeight: FontWeight.bold,
    color: AppColors.darkText,
  );

  static TextStyle headline2 = const TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: AppColors.darkText,
  );

  static TextStyle headline3 = const TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
    color: AppColors.darkText,
  );

  // Body text styles
  static TextStyle bodyText1 = const TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.normal,
    color: AppColors.darkText,
  );

  static TextStyle bodyText2 = const TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.normal,
    color: AppColors.greyText,
  );

  // Caption/Small text styles
  static TextStyle caption = const TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.normal,
    color: AppColors.lightGreyText,
  );

  // Button text styles
  static TextStyle buttonText = const TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.bold,
    color: AppColors.whiteText,
  );

  // App Bar title style
  static TextStyle appBarTitle = const TextStyle(
    fontSize: 17,
    fontFamily: "Satoshi",
    fontWeight: FontWeight.w600,
    color: AppColors.darkText,
  );

  // Sidebar text styles
  static TextStyle sidebarMenuItem = const TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.w500,
    color: Color.fromARGB(255, 105, 105, 105),
  );

  static TextStyle sidebarMenuItemSelected = const TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.w700,
    color: Color.fromARGB(255, 41, 47, 222),
  );

  // Card specific styles
  static TextStyle cardTitle = const TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.w600,
    color: AppColors.darkText,
  );

  static TextStyle cardSubtitle = const TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: AppColors.greyText,
  );

  static TextStyle cardSocialId = const TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.normal,
    color: AppColors.lightGreyText,
  );

  static TextStyle cardStatNumber = const TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.bold,
    color: AppColors.darkText,
  );

  static TextStyle cardStatLabel = const TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.normal,
    color: AppColors.greyText,
  );

  // Custom text style with primary color
  static TextStyle primaryColoredText = const TextStyle(
    color: AppColors.primaryColor,
    fontWeight: FontWeight.bold,
  );
}
