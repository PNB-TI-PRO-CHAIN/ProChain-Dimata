import 'package:get/get.dart';
import '../bindings/category_binding.dart.dart';
import '../views/category_view.dart';
import '../views/add_category_view.dart';
import 'app_routes.dart';

class AppPages {
  static final pages = [
    GetPage(
      name: AppRoutes.CATEGORY,
      page: () => CategoryView(),
      binding: CategoryBinding(),
    ),

    GetPage(
      name: AppRoutes.CATEGORY,
      page: () => AddCategoryView(),
      binding: CategoryBinding(),
    ),
  ];
}
