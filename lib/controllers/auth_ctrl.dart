import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:kamsya/app_pages.dart';
import 'package:kamsya/configs/all_configs.dart';
import 'package:kamsya/services/auth_srv.dart';
import 'package:kamsya/widgets/all_widgets.dart';

class AuthController extends GetxController {
  //--variables:
  final box = GetStorage();
  var isAuthorized = false.obs;
  var isLoading = false.obs;
  var loggedId = ''.obs;
  var isloggedIn = ''.obs;
  var isHidden = true.obs;
  var rememberMe = false.obs;
  var token = '';
  TextEditingController? txtUser, txtPass;
  //
  @override
  void onInit() {
    txtUser = TextEditingController();
    txtPass = TextEditingController();
    // authData();
    // isLoggedIn();
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
    txtUser?.dispose();
    txtPass?.dispose();
    super.dispose();
  }

  //
  authData() async {
    isloggedIn.value = await box.read('isLoggedIn');
    loggedId.value = await box.read('userId');
  }

  //
  // Future<bool> isLoggedIn() async {
  //   isAuthorized = await box.read('isLoggedIn');
  //   if (isAuthorized.value == true) {
  //     return isAuthorized.value = true;
  //   } else {
  //     return isAuthorized.value = false;
  //   }
  // }

  //
  void doLogin() async {
    Map data = {};
    data['userid'] = txtUser?.text;
    //txtUser?.text.trim();
    data['userpass'] = txtPass?.text;
    var jsonData = JsonEncoder().convert(data);
    //txtPass?.text.trim();
    try {
      print('dataLogin: $jsonData');
      isLoading(true);
      AuthService.doLogin(jsonData).then((result) {
        print('Result dataLogin: ${result['data']}');
        isLoading(false);
        if (result['isSuccess'] == true) {
          //--Klo RememberMe-nya aktif, mk disimpen di session:
          if (rememberMe.isTrue) {
            //--mk disimpen di session:
            //--simpen ke storage cara biasa:
            box.write('isLoggedIn', true);
            box.write('userId', result['data']['user_id']);
            box.write('userName', result['data']['name']);
            box.write('email', result['data']['email']);
            box.write('roleId', result['data']['role_id']);
            //--atau cara ini(map):
            // box.write('loggedInSession', {
            //   'isAuthorized': true,
            //   'rememberMe': true,
            //   'userId': result['data']['user_id'],
            //   'userName': result['data']['name'],
            //   'email': result['data']['email'],
            //   'roleId': result['data']['role_id'],
            // });
          } else {
            //--mk di-Hapus di session:
            // if (box.read('loggedInSession') != null) {
            //   box.erase();
            // }
            if (box.read('isLoggedIn') != null) {
              box.erase();
            }
          }
          isAuthorized.value = true;
          // _clearControllers();
          Get.offAllNamed(AppRoutes.BARANG);
        } else {
          isLoading(false);
          MySnackbar.danger(sFail, sAuthFail);
        }
      });
    } catch (exception) {
      isLoading(false);
      MySnackbar.danger(sFail, sAuthFail);
    }
  }

  //
  void doLogout() {
    print('Logout');
    if (box.read('isLoggedIn') != null) {
      box.erase();
    }
    isAuthorized.value = false;
    Get.toNamed(AppRoutes.LOGIN);
  }

  //
  void clearTextEditingControllers() {
    txtUser?.clear();
    txtPass?.clear();
    // if (txtUser != null) txtUser?.dispose();
    // if (txtPass != null) txtPass?.dispose();
  }
}
