// Import the controller, repository, and API provider.
import 'package:get/get.dart';
import 'package:review_dashboard_ui/data/review_accounts_data.dart';
import 'package:review_dashboard_ui/repository/reviews_repository.dart';

class ReviewsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ReviewAccountsData>(() => ReviewAccountsData());
    Get.lazyPut<ReviewsRepository>(
      () => ReviewsRepository(userData: Get.find()),
    );
    Get.lazyPut<ReviewAccountsData>(() => ReviewAccountsData());
    // Get.lazyPut<ReviewsController>(
    //   () => ReviewsController(reviewsRepository: Get.find()),
    // );
  }
}
