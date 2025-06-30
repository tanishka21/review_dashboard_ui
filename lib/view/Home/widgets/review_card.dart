import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:review_dashboard_ui/controller/review_controller.dart';
import 'package:review_dashboard_ui/model/review_accounts_model.dart';
import 'package:review_dashboard_ui/utils/app_color.dart';
import 'package:review_dashboard_ui/utils/app_dimensions.dart';
import 'package:review_dashboard_ui/utils/app_style.dart';
import 'package:review_dashboard_ui/utils/image_constants.dart';

class ReviewCard extends GetView<ReviewsController> {
  final ReviewAccountModel account;
  final VoidCallback onAccept;
  final VoidCallback onDecline;
  final int index;
  const ReviewCard({
    super.key,
    required this.account,
    required this.onAccept,
    required this.onDecline,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      // Detects mouse entry and exit events to control the visibility of action buttons.
      onEnter: (_) => controller.toggleHoverButtons(true, index),
      onExit: (_) => controller.toggleHoverButtons(false, index),
      child: Card(
        elevation: 2,
        margin: const EdgeInsets.only(bottom: 110),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppDimensions.borderRadiusLarge),
        ),
        child: Padding(
          padding: AppDimensions.cardPadding,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// Profile Image, user name, id
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    /// Profile Image
                    CircleAvatar(
                      backgroundImage:
                          account.imageUrl.isNotEmpty
                              ? AssetImage(account.imageUrl)
                              : null,
                      onBackgroundImageError: (exception, stackTrace) {
                        debugPrint(
                          'Error loading image for ${account.name}: $exception',
                        );
                      },
                      child: Builder(
                        builder: (context) {
                          if (account.imageUrl.isEmpty) {
                            return const Icon(
                              Icons.person,
                              size: 30,
                              color: Colors.grey,
                            );
                          }
                          return const SizedBox.shrink();
                        },
                      ),
                    ),
                    AppDimensions.width16,
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          account.name,
                          style: AppStyles.cardTitle,
                          overflow: TextOverflow.ellipsis,
                        ),
                        AppDimensions.height4,
                        //ID with image
                        Row(
                          children: [
                            Container(
                              height: 18,
                              width: 20,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                              child: Image.asset(ImageConstants.idImage),
                            ),
                            AppDimensions.width4,
                            Text(account.id, style: AppStyles.cardSocialId),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              AppDimensions.height12,

              /// Divider
              const Divider(
                color: Color.fromARGB(255, 213, 212, 212),
                endIndent: 0,
                indent: 0,
              ),
              AppDimensions.height12,

              /// Social Media Tag and Action Buttons
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _getSocialMediaTag(
                      account.socialMediaType,
                      account.socialMediaHandle,
                    ),
                    Obx(
                      () => AnimatedOpacity(
                        opacity:
                            controller.activeCardIndex.value == index
                                ? 1.0
                                : 0.0,
                        duration: const Duration(milliseconds: 200),
                        child: Row(
                          children: [
                            _buildActionButton(
                              icon: Icons.close,
                              color: AppColors.red,
                              onPressed: onDecline,
                            ),
                            AppDimensions.width12,
                            _buildActionButton(
                              icon: Icons.check,
                              color: const Color.fromARGB(255, 44, 54, 240),
                              onPressed: onAccept,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              AppDimensions.height20,

              // Section displaying follower, following, and post statistics.
              Container(
                margin: EdgeInsets.all(5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: const Color.fromARGB(255, 246, 245, 245),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _buildStatColumn('Followers', account.followers.toString()),
                    VerticalDivider(color: Colors.grey, thickness: 2),
                    _buildStatColumn('Following', account.following.toString()),
                    VerticalDivider(color: Colors.grey, thickness: 2),
                    _buildStatColumn('Posts', account.posts.toString()),
                  ],
                ),
              ),
              AppDimensions.height20,
            ],
          ),
        ),
      ),
    );
  }

  Widget _getSocialMediaTag(String type, String handle) {
    String assetPath;
    // To store the specific color for each icon if needed
    switch (type) {
      case 'Instagram':
        assetPath = ImageConstants.instagram;
        break;
      case 'Facebook':
        assetPath = ImageConstants.facebook;
        break;
      case 'Tik Tok':
        assetPath = ImageConstants.tiktok;
        break;
      case 'WhatsApp':
        assetPath = ImageConstants.whatsapp;
        break;
      default:
        assetPath = "";
    }
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: AppColors.lightBackground,
        borderRadius: BorderRadius.circular(AppDimensions.borderRadiusLarge),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (assetPath.isNotEmpty)
            SvgPicture.asset(
              assetPath,
              // height: 20,
              // width: 20,
              errorBuilder: (context, error, stackTrace) {
                debugPrint('Error loading SVG for $type: $error');
                return Icon(Icons.error); // Show an error icon instead
              },
            ),
          AppDimensions.width8,
          Text(
            handle.isNotEmpty ? handle : type,
            style: AppStyles.cardSocialId,
          ),
        ],
      ),
    );
  }

  Widget _buildStatColumn(String label, String value) {
    return Column(
      children: [
        Text(value, style: AppStyles.cardStatNumber),
        Text(label, style: AppStyles.cardStatLabel),
      ],
    );
  }

  // Helper method to build a square action button with an icon and color.
  Widget _buildActionButton({
    required IconData icon,
    required Color color,
    required VoidCallback onPressed,
  }) {
    return Material(
      color: color,
      borderRadius: BorderRadius.circular(
        AppDimensions.borderRadiusLarge,
      ), // Rounded corners.
      child: InkWell(
        onTap: onPressed, // Callback when the button is tapped.
        borderRadius: BorderRadius.circular(
          AppDimensions.borderRadiusDefault,
        ), // Ensure inkwell ripple matches button shape.
        child: Padding(
          padding: const EdgeInsets.all(
            AppDimensions.spacing10,
          ), // Padding inside the button.
          child: Icon(
            icon,
            color: AppColors.white,
            size: AppDimensions.iconSizeSmall,
          ),
        ),
      ),
    );
  }
}
