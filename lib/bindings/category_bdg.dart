import 'package:get/get.dart';
import 'package:kamsya/controllers/all_controllers.dart';

class CategoryBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CategoryController());
  }
}
