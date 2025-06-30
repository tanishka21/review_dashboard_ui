import 'package:flutter/material.dart';

class AppDimensions {
  AppDimensions._();

  // Padding and Margin values
  static const EdgeInsets pagePadding = EdgeInsets.all(
    spacing24,
  ); // Standard page padding.
  static const EdgeInsets defaultPadding = EdgeInsets.all(
    spacing16,
  ); // Default padding for containers.
  static const EdgeInsets symmetricPaddingHorizontal = EdgeInsets.symmetric(
    horizontal: spacing16,
  ); // Horizontal padding.
  static const EdgeInsets symmetricPaddingVertical = EdgeInsets.symmetric(
    vertical: spacing16,
  ); // Vertical padding.
  static const EdgeInsets cardPadding = EdgeInsets.only(
    top: spacing16,
  ); // Padding for cards.

  // Spacing values (for SizedBox and gap properties)
  static const double spacing4 = 4.0;
  static const double spacing8 = 8.0;
  static const double spacing10 = 10.0;
  static const double spacing12 = 12.0;
  static const double spacing16 = 16.0;
  static const double spacing20 = 20.0;
  static const double spacing24 = 24.0;
  static const double spacing32 = 32.0;
  static const double spacing40 = 40.0;
  static const double spacing50 = 50.0;
  static const double spacing60 = 60.0;

  // SizedBox for vertical spacing
  static const Widget height4 = SizedBox(height: spacing4);
  static const Widget height8 = SizedBox(height: spacing8);
  static const Widget height10 = SizedBox(height: spacing10);
  static const Widget height12 = SizedBox(height: spacing12);
  static const Widget height16 = SizedBox(height: spacing16);
  static const Widget height20 = SizedBox(height: spacing20);
  static const Widget height24 = SizedBox(height: spacing24);
  static const Widget height32 = SizedBox(height: spacing32);
  static const Widget height40 = SizedBox(height: spacing40);
  static const Widget height50 = SizedBox(height: spacing50);
  static const Widget height60 = SizedBox(height: spacing60);

  // SizedBox for horizontal spacing
  static const Widget width4 = SizedBox(width: spacing4);
  static const Widget width8 = SizedBox(width: spacing8);
  static const Widget width10 = SizedBox(width: spacing10);
  static const Widget width12 = SizedBox(width: spacing12);
  static const Widget width16 = SizedBox(width: spacing16);
  static const Widget width20 = SizedBox(width: spacing20);
  static const Widget width24 = SizedBox(width: spacing24);
  static const Widget width32 = SizedBox(width: spacing32);
  static const Widget width40 = SizedBox(width: spacing40);
  static const Widget width50 = SizedBox(width: spacing50);
  static const Widget width60 = SizedBox(width: spacing60);

  // Border radius values
  static const double borderRadiusSmall = 4.0;
  static const double borderRadiusDefault = 2.0;
  static const double borderRadiusLarge = 10.0;
  static const double borderRadiusCircular = 100.0;

  // Icon sizes
  static const double iconSizeSmall = 16.0;
  static const double iconSizeDefault = 24.0;
  static const double iconSizeLarge = 32.0;

  // Button dimensions
  static const double buttonHeight = 48.0;
  static const double buttonWidth = 120.0;

  // Sidebar dimensions
  static const double sidebarWidth = 250.0;

  // Responsive breakpoints
  static const double mobileBreakpoint = 600.0;
  static const double tabletBreakpoint = 900.0;

  // Helper methods for responsiveness
  static bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < mobileBreakpoint;

  static bool isTablet(BuildContext context) =>
      MediaQuery.of(context).size.width >= mobileBreakpoint &&
      MediaQuery.of(context).size.width < tabletBreakpoint;

  static bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width >= tabletBreakpoint;

  static bool isLargeScreen(BuildContext context) =>
      MediaQuery.of(context).size.width >= 1200.0;
}
