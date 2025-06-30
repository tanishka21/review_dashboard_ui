// ignore_for_file: constant_identifier_names

import 'package:get/get.dart';
import 'package:review_dashboard_ui/bindings/review_bindings.dart';
import 'package:review_dashboard_ui/view/Home/home.dart';

class AppPages {
  AppPages._();

  static var initial = _Paths.reviews_page;

  static final routes = [
    GetPage(
      name: _Paths.reviews_page,
      page: () => const Home(),
      binding: ReviewsBinding(),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 200),
    ),
  ];
}

abstract class _Paths {
  _Paths._();
  static const reviews_page = '/reviews-page';
}

abstract class Routes {
  Routes._();
  static const reviews_page = _Paths.reviews_page;
}
