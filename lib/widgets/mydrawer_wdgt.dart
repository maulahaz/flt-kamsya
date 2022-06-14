import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kamsya/app_pages.dart';
import 'package:kamsya/configs/all_configs.dart';
import 'package:kamsya/controllers/all_controllers.dart';

class MyDrawer extends StatelessWidget {
  final AuthController authCtr = Get.find();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.8,
      child: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      APP_NAME,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 35,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      APP_DESC,
                      style: TextStyle(
                        fontSize: 14,
                        color: kYellow,
                      ),
                    ),
                    Text(
                      TAG_LINE,
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              ),
              decoration: BoxDecoration(
                color: Colors.cyan,
              ),
            ),
            ListTile(
                leading: Icon(Icons.mark_as_unread),
                title: Text('Barang'),
                tileColor:
                    Get.currentRoute == '/barang' ? Colors.grey[300] : null,
                subtitle: Text('Atur Barang'),
                onTap: () {
                  // Get.toNamed(AppRoutes.BARANG);
                  print(Get.currentRoute);
                  Get.back();
                  Get.offNamed(AppRoutes.BARANG);
                }),
            ListTile(
                leading: Icon(Icons.attach_money),
                title: Text('Penjualan'),
                tileColor:
                    Get.currentRoute == '/penjualan' ? Colors.grey[300] : null,
                subtitle: Text('Atur Penjualan Barang'),
                onTap: () {
                  // Get.toNamed(AppRoutes.PENJUALAN);
                  // print(Get.currentRoute);
                  // Get.back();
                  // Get.offNamed(AppRoutes.PENJUALAN);
                }),
            ListTile(
                leading: Icon(Icons.receipt),
                title: Text('Kwitansi'),
                subtitle: Text('Atur Kwitansi'),
                onTap: () {
                  // Get.toNamed(AppRoutes.KWITANSI);
                  // print(Get.currentRoute);
                  // Get.back();
                  // Get.offNamed(AppRoutes.KWITANSI);
                }),
            ListTile(
                leading: Icon(Icons.exit_to_app),
                title: Text('Log Out'),
                onTap: () {
                  print('sign out');
                  // Get.offAllNamed(AppRoutes.LOGIN);
                  authCtr.doLogout();
                }),
          ],
        ),
      ),
    );
  }
}
