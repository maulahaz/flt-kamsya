import 'package:get/get.dart';
import 'package:kamsya/controllers/all_controllers.dart';

class AuthBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AuthController());
  }
}
