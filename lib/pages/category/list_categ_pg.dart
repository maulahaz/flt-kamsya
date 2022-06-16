import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kamsya/configs/all_configs.dart';
import 'package:kamsya/controllers/all_controllers.dart';
import 'package:kamsya/widgets/all_widgets.dart';

import '../../app_routes.dart';

class ListCategoryPage extends StatelessWidget {
  ListCategoryPage({Key? key}) : super(key: key);

  final CategoryController categCtrl = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        mini: true,
        backgroundColor: kAppPrimary,
        child: const Icon(Icons.add),
      ),
      appBar: AppBar(
        title: Text('Semua Kategori',
            style: myText.copyWith(color: kWhite, fontSize: 20)),
        // centerTitle: true,
        // backgroundColor: kTransparent,
        elevation: 0,
        leading: IconButton(
            onPressed: () => Get.back(),
            icon: Icon(
              Icons.arrow_back_ios,
              size: 16,
            )),
        // actions: [Icon(Icons.search)],
      ),
      body: SafeArea(
          child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    onChanged: (val) {
                      categCtrl.filterData(val);
                    },
                    style: myText,
                    decoration: InputDecoration(
                        hintText: "Cari Kategori",
                        contentPadding: EdgeInsets.all(10)),
                  ),
                ),
                // InkWell(onTap: () {}, child: Icon(Icons.qr_code_scanner)),
                // MyButton.iconBtn(
                //     () => null, Icons.qr_code_scanner, kBlack, kYellow),
                // SizedBox(width: 10),
                MyButton.iconBtn(() => null, Icons.search, kWhite, kBgSuccess),
                // InkWell(onTap: () {}, child: Icon(Icons.search)),
              ],
            ),
          ),
          Expanded(
            child: Obx(
              () => (categCtrl.isLoading.value)
                  ? Center(child: CircularProgressIndicator())
                  : (categCtrl.categList.isEmpty)
                      ? Center(child: Text('Tidak ada data!'))
                      : ListView.builder(
                          padding: EdgeInsets.all(10),
                          itemCount: categCtrl.categList.length,
                          itemBuilder: (context, index) {
                            var dt = categCtrl.filteredCategList[index];
                            return Column(
                              children: [
                                InkWell(
                                  // onTap: () => Get.toNamed(AppRoutes.BARANG_EDIT),
                                  onTap: () => Get.toNamed(
                                      AppRoutes.BARANG_EDIT,
                                      arguments: dt),
                                  child: Row(
                                    children: [
                                      Container(
                                          padding: EdgeInsets.only(right: 10),
                                          child: Text('Gbr')),
                                      Expanded(
                                        child: Container(
                                          padding: EdgeInsets.only(bottom: 3),
                                          decoration: BoxDecoration(
                                              border: Border(
                                                  bottom: BorderSide(
                                                      width: 1, color: kGrey))),
                                          child: Row(
                                            children: [
                                              Expanded(
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    MyText('${dt.name}', 16),
                                                    Text(
                                                      'Ada ${dt.parentId} ',
                                                      style: myText.copyWith(
                                                          fontWeight:
                                                              FontWeight.w300),
                                                    ),
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
                                SizedBox(height: 15)
                              ],
                            );
                          }),
            ),
          ),
        ],
      )),
    );
  }
}
