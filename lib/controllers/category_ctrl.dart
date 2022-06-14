import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kamsya/models/all_models.dart';
import 'package:kamsya/services/all_services.dart';

class CategoryController extends GetxController {
  //--variables:
  var isLoading = false.obs;
  var categList = <CategoryModel>[].obs;
  var filteredCategList = <CategoryModel>[].obs;
  TextEditingController? txtName, txtParentId;

  //
  @override
  void onInit() {
    fetchCategory();
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
  void fetchCategory() async {
    try {
      isLoading(true);
      CategoryService.fetchBarang().then((result) {
        isLoading(false);
        categList.value = filteredCategList.value = result;
      });
    } catch (exception) {
      print(exception);
      isLoading(false);
    }
  }

  //
  void filterData(String where) {
    filteredCategList.value = categList
        .where((dt) => dt.name!.toLowerCase().contains(where.toLowerCase()))
        .toList();
  }
}
