import 'package:get/get.dart';
import 'package:kamsya/controllers/all_controllers.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(() => HomeController(),
        permanent: true); //<-- Spesial krn berkenaan dg Drawer
    // artikel: https://github.com/jonataslaw/getx/discussions/958
  }
}
