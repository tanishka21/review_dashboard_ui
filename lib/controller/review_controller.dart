import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:review_dashboard_ui/data/review_accounts_data.dart';
import 'package:review_dashboard_ui/model/review_accounts_model.dart';
import 'package:review_dashboard_ui/repository/reviews_repository.dart';

class ReviewsController extends GetxController {
  final ReviewsRepository reviewsRepository;

  final RxList<ReviewAccountModel> reviewAccounts = <ReviewAccountModel>[].obs;
  final RxString searchQuery = ''.obs;
  final RxnInt activeCardIndex = RxnInt(null);
  final RxString selectedSortOption = 'Date Connected'.obs;
  final RxString selectedDateFilter = 'Date Connected'.obs;
  final RxBool showHoverButtons = false.obs;

  ReviewsController(
    this.reviewsRepository, {
    required ReviewAccountsData userData,
  });

  @override
  void onInit() {
    super.onInit();
    fetchReviewAccounts();
  }

  void fetchReviewAccounts() {
    Future.delayed(const Duration(seconds: 2), () {
      final accounts = reviewsRepository.getReviewAccounts();
      reviewAccounts.assignAll(accounts);
    });
  }

  // Getter that returns a filtered list of review accounts based on the current search query.
  List<ReviewAccountModel> get filteredReviewAccounts {
    if (searchQuery.isEmpty) {
      return reviewAccounts;
    } else {
      // Filter accounts where name or ID contains the search query (case-insensitive).
      return reviewAccounts.where((account) {
        final query = searchQuery.toLowerCase();
        return account.name.toLowerCase().contains(query) ||
            account.id.toLowerCase().contains(query);
      }).toList();
    }
  }

  // Updates the search query and triggers UI re-render through GetX's reactivity.
  void updateSearchQuery(String query) {
    searchQuery.value = query;
  }

  void updateSortOption(String? option) {
    if (option != null) {
      selectedSortOption.value = option;
      _sortAccounts(option);
    }
  }

  // Updates the selected date filter option.
  void updateDateFilter(String? option) {
    if (option != null) {
      selectedDateFilter.value = option;
    }
  }

  // Internal method to sort the `reviewAccounts` list.
  void _sortAccounts(String option) {
    switch (option) {
      case 'Date Connected':
        reviewAccounts.sort((a, b) => a.id.compareTo(b.id));
        break;
      case 'Name':
        reviewAccounts.sort((a, b) => a.name.compareTo(b.name));
        break;
      case 'Followers':
        reviewAccounts.sort((a, b) => b.followers.compareTo(a.followers));
        break;
      default:
        break;
    }
  }

  // Handles the archiving of a review account, displaying a snackbar notification.
  void archiveAccount(ReviewAccountModel account) {
    Get.snackbar(
      'Archived',
      '${account.name} has been archived.',
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Get.theme.primaryColor,
      colorText: Get.theme.colorScheme.onPrimary,
    );
    reviewAccounts.remove(account);
  }

  // Handles the validation of a review account, displaying a success snackbar.
  void validateAccount(ReviewAccountModel account) {
    Get.snackbar(
      'Validated',
      '${account.name} has been validated.',
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.green,
      colorText: Colors.white,
    );
    reviewAccounts.remove(account);
  }

  // Handles the acceptance of a review account, showing a success message.
  void acceptAccount(ReviewAccountModel account) {
    Get.snackbar(
      'Accepted',
      '${account.name} has been accepted.',
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.green,
      colorText: Colors.white,
    );
    reviewAccounts.remove(account);
  }

  // Handles the declining of a review account, showing an error message.
  void declineAccount(ReviewAccountModel account) {
    Get.snackbar(
      'Declined',
      '${account.name} has been declined.',
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.red,
      colorText: Colors.white,
    );
    reviewAccounts.remove(account);
  }

  // Toggles the `showHoverButtons` state, used to animate button visibility on cards.
  void toggleHoverButtons(bool value, int cardIndex) {
    if (value) {
      activeCardIndex.value = cardIndex;
    } else {
      // Only clear if the current active index is the one that is no longer hovered
      if (activeCardIndex.value == cardIndex) {
        activeCardIndex.value = null;
      }
    }
  }
}
