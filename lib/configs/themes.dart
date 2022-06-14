import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kamsya/configs/all_configs.dart';

class Themes {
  static final light = ThemeData(
    primaryColor: Colors.cyan,
    // primarySwatch: Colors.cyan,
    brightness: Brightness.light,
    primaryIconTheme: IconThemeData(color: kWhite), //<- Ngrubah Warna Drawer
    fontFamily: 'Poppins', //'DancingScript', //'Nova', //
  );

  static final dark = ThemeData(
    primaryColor: Colors.blue,
    brightness: Brightness.dark,
    // fontFamily: 'Poppins',
  );
}

TextStyle get myHeadingStyle {
  return TextStyle(
    fontSize: 30,
    fontWeight: FontWeight.bold,
    color: Get.isDarkMode ? kWhite : kBlack,
  );
}

TextStyle get myTextInputStyle {
  return TextStyle(
    fontFamily: "Poppins",
    fontSize: 14,
    color: Get.isDarkMode ? kWhite : kBlack,
    // color: Get.isDarkMode ? kBlack : kWhite,
  );
}

TextStyle get myText {
  return TextStyle(
    fontSize: 14,
    color: Get.isDarkMode ? kWhite : kBlack,
  );
}

TextStyle get myTextH3 {
  return TextStyle(
    fontSize: 14,
    color: Get.isDarkMode ? kWhite : kBlack,
  );
}

TextStyle get myLinkText {
  return TextStyle(
    fontFamily: "Poppins",
    fontSize: 14,
    color: kYellow,
    // decoration: TextDecoration.underline,
    // decorationColor: Colors.blue,
    // decorationThickness: 2,
  );
}

TextStyle get myLinkText2 {
  return TextStyle(
    fontFamily: "Poppins",
    fontSize: 14,
    color: kBlue,
    decoration: TextDecoration.underline,
    decorationStyle: TextDecorationStyle.double,
    // decorationColor: Colors.blue,
    // decorationThickness: 2,
  );
}

TextStyle get myTextButton {
  return TextStyle(
    fontFamily: "Poppins",
    fontWeight: FontWeight.bold,
    letterSpacing: 3.0,
    fontSize: 14,
    // color: Get.isDarkMode ? kWhite : kBlack,
    color: Get.isDarkMode ? kBlack : kWhite,
  );
}

TextStyle get myTinyText {
  return TextStyle(
    fontSize: 11,
    color: Get.isDarkMode ? kYellow : kBlack,
  );
}

TextStyle get mySmallText {
  return TextStyle(
    fontFamily: "Poppins",
    fontSize: 12,
    color: Get.isDarkMode ? kWhite : kBlack,
  );
}
