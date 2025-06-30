// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:review_dashboard_ui/utils/app_color.dart';
import 'package:review_dashboard_ui/utils/app_dimensions.dart';
import 'package:review_dashboard_ui/utils/app_style.dart';
import 'package:review_dashboard_ui/utils/constants.dart';
import 'package:review_dashboard_ui/utils/image_constants.dart';

class SidebarMenuWidget extends StatelessWidget {
  const SidebarMenuWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: AppDimensions.sidebarWidth,
      color: AppColors.sidebarBackground,
      padding: const EdgeInsets.symmetric(vertical: 32),
      child: Column(
        children: [
          // Oriflame Banner
          Container(
            padding: const EdgeInsets.symmetric(
              vertical: AppDimensions.spacing32,
            ),
            child: Image.asset(
              ImageConstants.oriflameImg,
              height: 45,
              width: 146,
            ),
          ),
          AppDimensions.height20,
          Flexible(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                _buildMenuItem(
                  image: ImageConstants.dashboardImg,
                  title: AppStrings.dashboard,
                ),
                _buildMenuItem(
                  image: ImageConstants.membersImg,
                  title: AppStrings.members,
                ),
                _buildMenuItem(
                  image: ImageConstants.libraryAssetImg,
                  title: AppStrings.libraryAssets,
                ),
                _buildMenuItem(
                  image: ImageConstants.campaignsImg,
                  title: AppStrings.campaigns,
                ),
                _buildMenuItem(
                  image: ImageConstants.communitiesImg,
                  title: AppStrings.community,
                ),
                _buildMenuItem(
                  image: ImageConstants.aiConsoleImg,
                  title: AppStrings.aiConsole,
                ),
                // Divider.
                AppDimensions.height20,
                const Divider(
                  endIndent: 20,
                  color: Color.fromARGB(255, 146, 142, 142),
                  indent: 20,
                ),
                AppDimensions.height20,
                _buildMenuItem(
                  image: ImageConstants.reviewApplicationsImg,
                  title: AppStrings.reviewAccounts,
                  isSelected: true,
                ),

                _buildMenuItem(
                  image: ImageConstants.pushNotificationImg,
                  title: AppStrings.pushNotifications,
                ),
                _buildMenuItem(
                  image: ImageConstants.sharingControlsImg,
                  title: AppStrings.sharingControls,
                ),

                _buildMenuItem(
                  image: ImageConstants.appearanceImg,
                  title: AppStrings.appearance,
                ),
                _buildMenuItem(
                  image: ImageConstants.faqImg,
                  title: AppStrings.faqsTutorials,
                ),
              ],
            ),
          ),
          // Sign Out button at the bottom.
          Container(
            padding: const EdgeInsets.all(AppDimensions.spacing16),
            child: Row(
              children: [
                SvgPicture.asset(ImageConstants.signOutImg, color: Colors.red),
                AppDimensions.width8,
                Text(
                  AppStrings.signOut,
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

Widget _buildMenuItem({
  required String image,
  required String title,
  bool isSelected = false,
  VoidCallback? onTap,
}) {
  return Material(
    /// Menu bar items container
    color: isSelected ? AppColors.primaryColor : Colors.transparent,
    child: InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: AppDimensions.spacing16,
          vertical: AppDimensions.spacing12,
        ),
        child: Row(
          children: [
            SvgPicture.asset(
              image,
              height: 20,
              color:
                  isSelected
                      ? const Color.fromARGB(255, 41, 47, 222)
                      : const Color.fromARGB(255, 86, 86, 86),
            ),
            AppDimensions.width16,
            Text(
              title,
              style:
                  isSelected
                      ? AppStyles.sidebarMenuItemSelected
                      : AppStyles.sidebarMenuItem,
            ),
          ],
        ),
      ),
    ),
  );
}
