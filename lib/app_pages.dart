import 'package:get/get.dart';
import 'views/all_pages.dart';
import 'bindings/all_bindings.dart';

class AppRoutes {
  static const INITIAL = '/';
  static const SPLASH = '/splash';
  static const LOGIN = '/login';
  static const HOME = '/home';
  //--Barang:
  static const BARANG = '/barang';
  static const BARANG_LIST = '/barang_list';
  static const BARANG_ADD = '/barang_add';
  static const BARANG_EDIT = '/barang_edit';
  static const BARANG_DETAIL = '/barang_detail';
  //--Category:
  static const CATEGORY = '/category';
  //--Other:
  static const UNDERCON = '/undercon';
}

abstract class AppPages {
  static final pages = [
    // GetPage(
    //   name: AppRoutes.SPLASH,
    //   page: () => SplashPage(),
    //   binding: AuthBinding(),
    // ),
    // GetPage(
    //   name: AppRoutes.INITIAL,
    //   page: () => LoginPage(),
    //   // binding: SplashBinding(),
    // ),
    // GetPage(
    //   name: AppRoutes.LOGIN,
    //   page: () => LoginPage(),
    //   binding: AuthBinding(),
    // ),
    GetPage(
      name: AppRoutes.HOME,
      page: () => HomeView(),
      // binding: HomeBinding(),
    ),
    // GetPage(
    //   name: AppRoutes.BARANG,
    //   page: () => BarangPage(),
    //   binding: BarangBinding(),
    // ),
    // GetPage(
    //   name: AppRoutes.BARANG_LIST,
    //   page: () => ListBarangPage(),
    //   binding: BarangBinding(),
    //   // transitionDuration: Duration(seconds: 1)
    //   // transition: Transition.fade,
    // ),
    // GetPage(
    //   name: AppRoutes.BARANG_ADD,
    //   page: () => AddBarangPage(),
    //   binding: BarangBinding(),
    // ),
    // GetPage(
    //   name: AppRoutes.BARANG_EDIT,
    //   page: () => EditBarangPage(),
    //   binding: BarangBinding(),
    // ),
    // GetPage(
    //   name: AppRoutes.CATEGORY,
    //   page: () => ListCategoryPage(),
    //   binding: CategoryBinding(),
    // ),
  ];
}
