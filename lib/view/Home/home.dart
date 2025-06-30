// ignore_for_file: library_prefixes

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:review_dashboard_ui/controller/review_controller.dart';
import 'package:review_dashboard_ui/data/review_accounts_data.dart';
import 'package:review_dashboard_ui/repository/reviews_repository.dart';
import 'package:review_dashboard_ui/utils/app_color.dart';
import 'package:review_dashboard_ui/utils/app_dimensions.dart';
import 'package:review_dashboard_ui/utils/app_style.dart';
import 'package:review_dashboard_ui/utils/constants.dart';
import 'package:review_dashboard_ui/utils/image_constants.dart';
import 'package:review_dashboard_ui/view/Home/widgets/filter_dropdown_widget.dart';
import 'package:review_dashboard_ui/view/Home/widgets/review_card.dart';
import 'package:review_dashboard_ui/view/Home/widgets/search_bar_widget.dart';
import 'package:review_dashboard_ui/view/Home/widgets/sidebar_menu_widget.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(
      ReviewsController(
        ReviewsRepository(userData: ReviewAccountsData()),
        userData: ReviewAccountsData(),
      ),
    );
    return Scaffold(
      /// Drawer for mobile view
      drawer:
          AppDimensions.isDesktop(context)
              ? null
              : Drawer(child: SidebarMenuWidget()),
      body: Row(
        children: [
          if (AppDimensions.isDesktop(context)) const SidebarMenuWidget(),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildAppBar(context, AppDimensions.isDesktop(context)),
                Expanded(
                  child: Padding(
                    padding: AppDimensions.pagePadding,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Review Accounts Title
                        // Text(
                        //   AppStrings.reviewsPageTitle,
                        //   style: AppStyles.headline1,
                        // ),
                        AppDimensions.height20,
                        _buildControls(context),
                        AppDimensions.height32,
                        Expanded(
                          child: Obx(
                            () =>
                                controller.filteredReviewAccounts.isEmpty
                                    ? Center(
                                      child: Text(
                                        AppStrings.noReviewsFound,
                                        style: AppStyles.bodyText1,
                                      ),
                                    )
                                    : GridView.builder(
                                      gridDelegate:
                                          SliverGridDelegateWithMaxCrossAxisExtent(
                                            maxCrossAxisExtent: 350.0,
                                            childAspectRatio: 0.9,
                                            crossAxisSpacing:
                                                AppDimensions.spacing20,
                                            mainAxisSpacing:
                                                AppDimensions.spacing20,
                                          ),
                                      itemCount:
                                          controller
                                              .filteredReviewAccounts
                                              .length,
                                      itemBuilder: (context, index) {
                                        final account =
                                            controller
                                                .filteredReviewAccounts[index];

                                        /// Review Accounts Card Accept or Reject
                                        return ReviewCard(
                                          account:
                                              controller.reviewAccounts[index],
                                          onAccept:
                                              () => controller.acceptAccount(
                                                account,
                                              ),
                                          onDecline:
                                              () => controller.declineAccount(
                                                account,
                                              ),
                                          index: index,
                                        );
                                      },
                                    ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  AppBar _buildAppBar(BuildContext context, bool isDesktop) {
    return AppBar(
      backgroundColor: AppColors.white,
      elevation: 0.5,
      leading:
          isDesktop
              ? null
              : IconButton(
                icon: const Icon(
                  Icons.menu,
                  color: AppColors.darkGrey,
                ), // Hamburger menu icon for mobile/tablet.
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
              ),
      title: Text(
        AppStrings.reviewsPageTaskTitle, // "Reviews Page Task" title.
        style: AppStyles.appBarTitle, // Styling for the app bar title.
      ),
      centerTitle: false, // Align title to the left.
      actions: [
        // Language dropdown with flag and text.
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: AppDimensions.spacing16,
          ),
          child: Container(
            // height: 50,
            padding: EdgeInsets.all(5.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: const Color.fromARGB(255, 188, 186, 186),
                width: 1.0,
              ),
            ),
            child: Row(
              children: [
                // UK Flag
                Image.asset(
                  ImageConstants.ukFlag,
                  width: 24,
                  height: 24,
                  // Fallback icon if the image fails to load.
                  errorBuilder:
                      (context, error, stackTrace) =>
                          const Icon(Icons.flag, color: AppColors.darkGrey),
                ),
                AppDimensions.width8,
                Text(
                  'UK', // Language text.
                  style: AppStyles.bodyText2.copyWith(
                    fontWeight: FontWeight.w700,
                    fontSize: 12,
                    fontFamily: "Satoshi",
                  ),
                ),
                AppDimensions.width4,
                const Icon(
                  size: 10,
                  Icons.arrow_drop_down_outlined,
                  color: Color.fromARGB(15, 25, 25, 25),
                ), // Dropdown arrow icon.
              ],
            ),
          ),
        ),
      ],
    );
  }

  // Builds the control section, including search, sorting, filtering, and action buttons.
  Widget _buildControls(BuildContext context) {
    final bool isLargeScreen = AppDimensions.isLargeScreen(context);
    var controller = Get.put(
      ReviewsController(
        ReviewsRepository(userData: ReviewAccountsData()),
        userData: ReviewAccountsData(),
      ),
    );
    List<Widget> commonControls = [
      SizedBox(
        width: isLargeScreen ? 500 : Get.width * 0.2,
        child: SearchBarWidget(
          hintText: AppStrings.searchHint,
          onChanged: controller.updateSearchQuery,
        ),
      ),
      AppDimensions.width20,
      Text(
        'Sort By',
        style: TextStyle(color: const Color.fromARGB(255, 120, 120, 120)),
      ),
      AppDimensions.width10,
      Obx(
        () => FilterDropdown(
          options: const ['Date Connected', 'Name', 'Followers'],
          selectedOption: controller.selectedSortOption.value,
          onChanged: controller.updateSortOption,
          hintText: 'Data Connected',
        ),
      ),
      AppDimensions.width16,
      // Obx(
      //   () => FilterDropdown(
      //     options: const ['Date Connected', 'Last 7 Days', 'Last 30 Days'],
      //     selectedOption: controller.selectedDateFilter.value,
      //     onChanged: controller.updateDateFilter,
      //     hintText: 'Date Connected',
      //   ),
      // ),
      // CustomButton(
      //   text: 'Filter',
      //   // backgroundColor: Colors.white,
      //   textColor: Colors.black,
      //   icon: Icons.filter_list,
      //   onPressed: () {
      //     Get.snackbar(
      //       'Filter',
      //       'Filter button pressed!',
      //       snackPosition: SnackPosition.BOTTOM,
      //     );
      //   },
      //   isOutlined: true,
      // ),

      /// Fliter Button
      SizedBox(
        height: 38,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          onPressed: () {
            Get.snackbar(
              'Filter',
              'Filter button pressed!',
              snackPosition: SnackPosition.BOTTOM,
            );
          },
          child: Row(
            // spacing: 5,
            children: [
              Icon(Icons.filter_alt_outlined, color: Colors.grey),
              AppDimensions.width4,
              Text(
                'Filter',
                style: TextStyle(
                  fontSize: 13,
                  color: const Color.fromARGB(255, 65, 64, 64),
                ),
              ),
            ],
          ),
        ),
      ),
    ];

    List<Widget> actionButtons = [
      SizedBox(
        height: 38,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              side: BorderSide(color: const Color.fromARGB(255, 32, 68, 228)),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          onPressed: () {
            Get.snackbar(
              'Archive',
              'Archive all button pressed!',
              snackPosition: SnackPosition.BOTTOM,
            );
          },
          child: Row(
            // spacing: 5,
            children: [
              Icon(Icons.list, color: const Color.fromARGB(255, 32, 68, 228)),
              AppDimensions.width4,
              Text(
                'Archive',
                style: TextStyle(
                  fontSize: 13,
                  color: const Color.fromARGB(255, 32, 68, 228),
                ),
              ),
            ],
          ),
        ),
      ),
      // CustomButton(
      //   text: 'Archive',
      //   textColor:
      //   icon: Icons.archive_outlined,
      //   onPressed: () {
      //     Get.snackbar(
      //       'Archive',
      //       'Archive all button pressed!',
      //       snackPosition: SnackPosition.BOTTOM,
      //     );
      //   },
      //   isOutlined: true,
      // ),
      AppDimensions.width16,
      SizedBox(
        height: 38,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              side: BorderSide(color: const Color.fromARGB(255, 32, 68, 228)),
              borderRadius: BorderRadius.circular(10),
            ),
            backgroundColor: const Color.fromARGB(255, 32, 68, 228),
          ),
          onPressed: () {
            Get.snackbar(
              'Validate',
              'Validate all button pressed!',
              snackPosition: SnackPosition.BOTTOM,
            );
          },
          child: Row(
            children: [
              Text('Validate', style: TextStyle(color: AppColors.white)),
              AppDimensions.width10,
              Icon(Icons.arrow_forward, color: Colors.white),
            ],
          ),
        ),
      ),
      // CustomButton(
      //   text: 'Validate',
      //   icon: Icons.arrow_left_sharp,

      //   onPressed: () {
      //     Get.snackbar(
      //       'Validate',
      //       'Validate all button pressed!',
      //       snackPosition: SnackPosition.BOTTOM,
      //     );
      //   },
      //   backgroundColor: AppColors.primaryColor,
      //   textColor: AppColors.white,
      // ),
    ];

    if (isLargeScreen) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Left group of controls
          Row(mainAxisSize: MainAxisSize.min, children: [...commonControls]),
          const Spacer(),
          // Right group of action buttons
          Row(mainAxisSize: MainAxisSize.min, children: [...actionButtons]),
        ],
      );
    } else {
      // On smaller screens, use Wrap for all controls and no Spacer
      return Wrap(
        spacing: AppDimensions.spacing10,
        runSpacing: AppDimensions.spacing10,
        crossAxisAlignment: WrapCrossAlignment.center,
        children: [...commonControls, ...actionButtons],
      );
    }
  }
}
