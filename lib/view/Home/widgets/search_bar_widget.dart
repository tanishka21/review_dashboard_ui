import 'package:flutter/material.dart';
import 'package:review_dashboard_ui/utils/app_color.dart';
import 'package:review_dashboard_ui/utils/app_dimensions.dart';

class SearchBarWidget extends StatelessWidget {
  final String hintText;
  final ValueChanged<String>? onChanged;
  final TextEditingController? controller;

  const SearchBarWidget({
    super.key,
    required this.hintText,
    this.onChanged,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: 400,
      decoration: BoxDecoration(
        boxShadow: [BoxShadow(color: Colors.grey, blurRadius: 5.0)],
        borderRadius: BorderRadius.circular(AppDimensions.borderRadiusLarge),
      ),
      child: TextField(
        showCursor: true,
        cursorHeight: 20,
        cursorColor: Colors.grey,
        controller: controller,
        onChanged: onChanged,
        decoration: InputDecoration(
          hintText: hintText,

          prefixIcon: const Icon(Icons.search, color: AppColors.iconColor),
          filled: true,
          fillColor: AppColors.searchBarBackground,

          // border: OutlineInputBorder(
          //   borderRadius: BorderRadius.circular(
          //     AppDimensions.borderRadiusLarge,
          //   ),
          //   borderSide: BorderSide.none,
          // ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(
              AppDimensions.borderRadiusLarge,
            ),
            borderSide: BorderSide.none,
          ),
          // focusedBorder: OutlineInputBorder(
          //   borderRadius: BorderRadius.circular(
          //     AppDimensions.borderRadiusLarge,
          //   ),
          //   borderSide: const BorderSide(
          //     color: AppColors.primaryColor,
          //     width: 1.5,
          //   ),
          // ),
          // contentPadding: const EdgeInsets.symmetric(
          //   horizontal: AppDimensions.spacing16,
          //   vertical: AppDimensions.spacing12,
          // ),
        ),
      ),
    );
  }
}
