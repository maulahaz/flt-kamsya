import 'package:get/get.dart';
import 'package:kamsya/controllers/all_controllers.dart';

class BarangBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(() => HomeController(),
        permanent: true); //--sementara, krn load page awal ke BarangPage
    Get.lazyPut(
        () => AuthController()); //--sementara, krn load page awal ke BarangPage
    Get.lazyPut(() => BarangController());
    Get.lazyPut(() => BarangEditController());
  }
}
