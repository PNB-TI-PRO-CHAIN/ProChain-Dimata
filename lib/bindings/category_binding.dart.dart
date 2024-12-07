import 'package:get/get.dart';
import '../controllers/category_controller.dart.dart';

class CategoryBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CategoryController>(() => CategoryController());
  }
}
