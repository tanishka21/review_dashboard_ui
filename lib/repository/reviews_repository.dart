import 'package:review_dashboard_ui/data/review_accounts_data.dart';
import 'package:review_dashboard_ui/model/review_accounts_model.dart';

class ReviewsRepository {
  final ReviewAccountsData userData;

  ReviewsRepository({required this.userData});

  // Retrieves review accounts
  List<ReviewAccountModel> getReviewAccounts() {
    return userData.getReviewAccounts();
  }
}
