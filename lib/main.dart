import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:kamsya/app_routes.dart';
import 'package:kamsya/configs/all_configs.dart';
// import 'package:kamsya/pages/home/home_pg.dart';

void main() async{
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'KAMSYA',
      debugShowCheckedModeBanner: false,
      defaultTransition: Transition.fade,
      theme: Themes.light,
      themeMode: ThemeMode.light,
      darkTheme: Themes.dark,
      getPages: AppPages.pages,
      initialRoute: AppRoutes.BARANG,
      // home: const HomePage(),
    );
  }
}
