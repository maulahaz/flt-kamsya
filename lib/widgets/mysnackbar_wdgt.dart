import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MySnackbar {
  static showSnackbar(String title, String subtitle, Color txColor,
      Color bgColor, Color iconColor) {
    Get.snackbar(
      "$title",
      "$subtitle",
      snackPosition: SnackPosition.BOTTOM,
      colorText: txColor,
      backgroundColor: bgColor,
      icon: Icon(
        Icons.notification_important,
        color: iconColor,
      ),
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
    );
  }

  static primary(String title, String subtitle) {
    showSnackbar(
        title, subtitle, Colors.white, Color(0xFF007BFF), Colors.white);
  }

  static secondary(String title, String subtitle) {
    showSnackbar(
        title, subtitle, Colors.white, Color(0xFF6C757D), Colors.white);
  }

  static success(String title, String subtitle) {
    showSnackbar(
        title, subtitle, Colors.white, Color(0xFF28A745), Colors.white);
  }

  static danger(String title, String subtitle) {
    showSnackbar(title, subtitle, Colors.white, Colors.red, Colors.white);
  }

  static warning(String title, String subtitle) {
    showSnackbar(
      title,
      subtitle,
      Colors.black,
      Color(0xFFFFC107),
      Colors.black,
    );
  }

  static info(String title, String subtitle) {
    showSnackbar(
      title,
      subtitle,
      Colors.white,
      Color(0xFF17A2B8),
      Colors.white,
    );
  }

  static light(String title, String subtitle) {
    showSnackbar(
      title,
      subtitle,
      Colors.black,
      Color(0xFFF8F9FA),
      Colors.black,
    );
  }

  static dark(String title, String subtitle) {
    showSnackbar(
      title,
      subtitle,
      Colors.white,
      Color(0xFF343A40),
      Colors.white,
    );
  }
}
