import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kamsya/app_routes.dart';
import 'package:kamsya/configs/all_configs.dart';
import 'package:kamsya/controllers/all_controllers.dart';
import 'package:kamsya/helpers/utils_hlp.dart';
import 'package:kamsya/widgets/all_widgets.dart';

class ListBarangPage extends StatelessWidget {
  ListBarangPage({Key? key}) : super(key: key);

  final BarangController barangCtrl = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.toNamed(AppRoutes.BARANG_ADD),
        mini: true,
        backgroundColor: kAppPrimary,
        child: const Icon(Icons.add),
      ),
      appBar: AppBar(
        title: Text('Semua Barang',
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
                  // focusNode: barangCtrl.searchFocusNode,
                  onChanged: (val) {
                    barangCtrl.filterData(val);
                  },
                  style: myText,
                  decoration: InputDecoration(
                    hintText: "Cari Barang",
                    contentPadding: EdgeInsets.all(10),
                    suffixIcon: barangCtrl.isSearching.value
                        ? InkWell(
                            onTap: () {
                              // barangCtrl.scanQR();
                            },
                            child: Icon(Icons.clear, size: 10))
                        : SizedBox.shrink(),
                  ),
                )),
                MyButton.iconBtn(() {
                  print('scanning');
                  // barangCtrl.scanQR();
                }, Icons.qr_code_scanner, kBlack, kYellow),
                SizedBox(width: 10),
                // InkWell(onTap: () {}, child: Icon(Icons.search)),
                MyButton.iconBtn(() => null, Icons.search, kWhite, kBgSuccess),
              ],
            ),
          ),
          // FormInputSearch(true, barangCtrl.searchFocusNode, 'test'),
          Expanded(
            child: Obx(
              () => (barangCtrl.isLoading.value)
                  ? Center(child: CircularProgressIndicator())
                  : (barangCtrl.barangList.isEmpty)
                      ? Center(child: Text('Tidak ada data!'))
                      : ListView.builder(
                          padding: EdgeInsets.all(10),
                          itemCount: barangCtrl.filteredBarangList.length,
                          itemBuilder: (context, index) {
                            var dt = barangCtrl.filteredBarangList[index];
                            
                            return Column(
                              children: [
                                InkWell(
                                  
                                  // onTap: () => Get.toNamed(AppRoutes.BARANG_EDIT),
                                  // onTap: () => barangCtrl.goAndEditBarang(dt),
                                  onTap: () {
                                    Get.toNamed(
                                      AppRoutes.BARANG_EDIT,
                                      arguments: dt);
                                      },
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
                                                    MyText('${dt.alias}', 16),
                                                    Text(
                                                      '${dt.weight} Kg',
                                                      style: myText.copyWith(
                                                          fontWeight:
                                                              FontWeight.w300),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              // Text(
                                              //   'Rp. ${dt.buyingPrice}',
                                              //   style: myText.copyWith(
                                              //       fontWeight: FontWeight.w600),
                                              // ),
                                              Text(
                                                MyUtils.convertToIdr(
                                                    dt.buyingPrice!,
                                                    0),
                                                style: myText.copyWith(
                                                    fontWeight:
                                                        FontWeight.w500),
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
