import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:kamsya/models/all_models.dart';
// import 'package:kamsya/services/all_services.dart';

class BarangEditController extends GetxController {
  //--variables:
  var isLoading = false.obs;
  TextEditingController? txtName, txtWeight;

  //
  @override
  void onInit() {
    super.onInit();
  }

  //
  @override
  void onReady() {
    super.onReady();
  }

  //
  @override
  void dispose() {
    super.dispose();
  }

  //
  // void fetchBarang() async {
  //   try {
  //     isLoading(true);
  //     BarangService.fetchBarang().then((result) {
  //       isLoading(false);
  //       print(result);
  //       barangList.value = filteredBarangList.value = result;
  //       print(barangList.length);
  //     });
  //   } catch (exception) {
  //     print(exception);
  //     isLoading(false);
  //   }
  // }

  //
  // void filterData(String where) {
  //   filteredBarangList.value = barangList
  //       .where((dt) => dt.alias.toLowerCase().contains(where.toLowerCase()))
  //       .toList();
  // }
}
