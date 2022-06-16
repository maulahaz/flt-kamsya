import 'dart:convert';

// import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
// import 'package:qrscan/qrscan.dart' as scanner;
import 'package:get/get.dart';
import 'package:kamsya/configs/all_configs.dart';
import 'package:kamsya/helpers/utils_hlp.dart';
import 'package:kamsya/models/all_models.dart';
import 'package:kamsya/services/all_services.dart';
import 'package:kamsya/widgets/all_widgets.dart';

import '../app_routes.dart';

class BarangController extends GetxController {
  //--variables:
  var isLoading = false.obs;
  var barangList = <BarangModel>[].obs;
  var filteredBarangList = <BarangModel>[].obs;
  var barangId = '0';
  String scannedQRCode = '';
  // final CurrencyTextInputFormatter formatter = CurrencyTextInputFormatter();
  // late FocusNode searchFocusNode;
  var isSearching = false.obs;
  TextEditingController? txtCari,
      // txtBarangId,
      txtName,
      txtWeight,
      txtMarketPrice,
      txtBuyingPrice,
      txtSellingPrice,
      txtNotes = TextEditingController();

  //
  @override
  void onInit() {
    BarangModel editBarang = Get.arguments ?? BarangModel();
    print(editBarang.alias);
    fetchBarang();
    // txtBarangId = TextEditingController();
    txtName = TextEditingController(text: editBarang.alias);
    txtWeight = TextEditingController(text: editBarang.weight);
    txtMarketPrice = TextEditingController();
    txtBuyingPrice = TextEditingController();
    txtSellingPrice = TextEditingController();
    txtNotes = TextEditingController();
    txtCari = TextEditingController();
    //
    // searchFocusNode = new FocusNode();
    super.onInit();
  }

  //
  @override
  void onReady() {
    super.onReady();
  }

  //
  @override
  void onClose() {
    clearTextEditingControllers();
    //
    // searchFocusNode.dispose();
    super.onClose();
  }

  //
  void fetchBarang() async {
    
    try {
      isLoading(true);
      BarangService.fetchBarang().then((result) {
        // print(result);
        isLoading(false);
        barangList.value = filteredBarangList.value = result;
      });
    } catch (exception) {
      print(exception);
      isLoading(false);
    }
  }

  //
  void filterData(String where) {
    filteredBarangList.value = barangList
        .where((dt) => dt.alias!.toLowerCase().contains(where.toLowerCase()))
        .toList();
  }

  //
  void addBarang() async {
    //
    Map data = {};
    // data['user_id'] = $loggedID;
    data['alias'] = txtName?.text ?? '';
    // data['categ_id'] = txtCategId?.text;
    // data['status'] = txtStatus?.text;
    data['weight'] = txtWeight?.text ?? '0';
    // data['buying_dt'] = //txtBuyingDate?.text;
    // data['buying_from'] = /txtBuyerId?.text;
    data['buying_price'] = txtBuyingPrice?.text ?? '0';
    data['market_price'] = txtMarketPrice?.text ?? '0';
    // data['selling_price'] = txtSellingPrice!.text;
    // data['photo'] = 'test.jpg';
    data['notes'] = txtNotes?.text ?? '';
    //--Convert to JSON format:
    var jsonData = JsonEncoder().convert(data);
    //
    try {
      isLoading(true);
      // print(data);
      bool isSaved = await BarangService.addBarang(jsonData);
      print('---from addBarang Ctrl');
      if (isSaved) {
        //--if Saved, update data listView
        isLoading(false);
        fetchBarang();
        clearTextEditingControllers();
        Get.back();
        MySnackbar.success(sSuccess, sMsgSuccessAddData);
      } else {
        MySnackbar.danger(sFail, sMsgFailAddData);
      }
    } catch (e) {
      isLoading(false);
      print('Error addBarang: ' + e.toString());
      MySnackbar.danger(sError, e.toString());
    }
  }

  //
  void goAndEditBarang(BarangModel barang) {
    // barangId = barang.id ?? '';
    txtName?.text = barang.alias ?? '';
    txtWeight?.text = barang.weight ?? '0';
    // txtMarketPrice?.text = barang.marketPrice ?? '0';
    txtMarketPrice?.text =
        MyUtils.convertToIdr(barang.marketPrice, 0);
    txtBuyingPrice?.text =
        MyUtils.convertToIdr(barang.buyingPrice, 0);
    txtNotes?.text = barang.notes ?? '';
    Get.toNamed(AppRoutes.BARANG_EDIT);
  }

  //
  void editBarang() async {
    //
    Map data = {};
    data['barangId'] = barangId;
    data['alias'] = txtName?.text;
    // data['categ_id'] = txtCategId?.text;
    // data['status'] = txtStatus?.text;
    data['weight'] = txtWeight?.text;
    // data['buying_dt'] = //txtBuyingDate?.text;
    // data['buying_from'] = /txtBuyerId?.text;
    data['buying_price'] = txtBuyingPrice?.text;
    data['market_price'] = MyUtils.getDigitOnly(txtMarketPrice?.text);
    // data['selling_price'] = txtSellingPrice!.text;
    // data['photo'] = 'test.jpg';
    data['notes'] = txtNotes?.text;
    //--Convert to JSON format:
    var jsonData = JsonEncoder().convert(data);
    print(jsonData);
    //
    try {
      isLoading(true);
      // print(data);
      bool isSaved = await BarangService.editBarang(jsonData);
      print('---from editBarang Ctrl');
      if (isSaved) {
        //--if Saved, update data listView
        isLoading(false);
        fetchBarang();
        clearTextEditingControllers();
        Get.back();
        MySnackbar.success(sSuccess, sMsgSuccessUpdateData);
      } else {
        MySnackbar.danger(sFail, sMsgFailUpdateData);
      }
    } catch (e) {
      isLoading(false);
      print('Error editBarang: ' + e.toString());
      MySnackbar.danger(sError, e.toString());
    }
  }

  //
  // Future<void> scanQR() async {
  //   print('scanning');
  //   try {
  //     scannedQRCode = await scanner.scanPhoto();
  //     // scannedQRCode = await FlutterBarcodeScanner.scanBarcode(
  //     //     '#ff6666', 'Batal', true, ScanMode.BARCODE);
  //     if (scannedQRCode != '') {
  //       //--If Cancel during Scanning:
  //       txtCari?.text = scannedQRCode;
  //       MySnackbar.success(sSuccess, scannedQRCode);
  //       print('ok');
  //     } else {
  //       txtCari?.text = '000';
  //       MySnackbar.success(sFail, 'Blank Data');
  //     }
  //   } catch (e) {
  //     MySnackbar.danger('Error', 'Unknown error: $e');
  //     print('not ok:' + e.toString());
  //   }
  // }

  // bool setSearchingMode() {
  //   return searchFocusNode.hasFocus ? isSearching(true) : isSearching(false);
  // }

  //
  // Future scanProcess() async {
  //   try {
  //     txtCari?.clear();
  //     String barcode = await BarcodeScanner.scan(); //'1236rr4344';
  //     barcodeID.value = txtBarcode.text = barcode;
  //     //--biar pointer nya ada di akhir String di TextController:
  //     txtBarcode.selection = TextSelection(
  //         baseOffset: barcode.length, extentOffset: barcode.length);
  //   } on PlatformException catch (e) {
  //     if (e.code == BarcodeScanner.CameraAccessDenied) {
  //       // barcodeID.value = 'The user did not grant the camera permission!';
  //       MySnackbar.danger(
  //           'Error', 'The user did not grant the camera permission!');
  //     } else {
  //       // barcodeID.value = 'Unknown error: $e';
  //       MySnackbar.danger('Error', 'Unknown error: $e');
  //     }
  //   } on FormatException {
  //     // barcodeID.value =
  //     //     'null (User returned using the "back"-button before scanning anything. Result)';
  //     MySnackbar.danger('Error',
  //         'null (User returned using the "back"-button before scanning anything. Result)');
  //   } catch (e) {
  //     // barcodeID.value = 'Unknown error: $e';
  //     MySnackbar.danger('Error', 'Unknown error: $e');
  //   }
  // }

  //
  void clearTextEditingControllers() {
    txtName?.clear();
    txtWeight?.clear();
    txtBuyingPrice?.clear();
    txtMarketPrice?.clear();
    txtSellingPrice?.clear();
    txtNotes?.clear();
    txtCari?.clear();
    // if (txtName != null) txtName?.dispose();
    // if (txtWeight != null) txtWeight?.dispose();
    // if (txtBuyingPrice != null) txtBuyingPrice?.dispose();
    // if (txtNotes != null) txtNotes?.dispose();
  }
}
