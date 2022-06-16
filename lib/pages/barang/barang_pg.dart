import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kamsya/app_routes.dart';
import 'package:kamsya/configs/all_configs.dart';
import 'package:kamsya/controllers/all_controllers.dart';
import 'package:kamsya/widgets/all_widgets.dart';

// class BarangPage extends StatelessWidget {
class BarangPage extends GetView<HomeController> {
  BarangPage({Key? key}) : super(key: key);

  // final HomeController homeCtr = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      drawer: MyDrawer(),
      appBar: AppBar(
        title: Text(
          'Barang',
          style: myText.copyWith(color: kWhite, fontSize: 20),
        ),
        // centerTitle: true,
        // leading: IconButton(
        //   onPressed: () => Get.back(),
        //   icon: Icon(
        //     Icons.menu,
        //     // size: 16,
        //     color: kWhite,
        //   ),
        // ),
        elevation: 0,
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 10),
            ListMenu(Icons.list, 'List Barang',
                onTap: () => Get.toNamed(AppRoutes.BARANG_LIST)),
            ListMenu(Icons.category, 'Kategori Barang',
                onTap: () => Get.toNamed(AppRoutes.CATEGORY)),
            ListMenu(Icons.print, 'Print Barcode', onTap: () {
              print('Print Barcode');
            }),
          ],
        ),
      ),
    );
  }
}

class ListMenu extends StatelessWidget {
  ListMenu(this.icon, this.menuTitle, {required this.onTap, Key? key})
      : super(key: key);

  final String menuTitle;
  final IconData icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(10),
        child: Row(
          children: [
            Container(padding: EdgeInsets.only(right: 10), child: Icon(icon)),
            Expanded(
              child: Container(
                padding: EdgeInsets.only(bottom: 10),
                decoration: BoxDecoration(
                    border: Border(bottom: BorderSide(width: 1, color: kGrey))),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          MyText(menuTitle, 16),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
