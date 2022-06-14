//-- Get Current Date
// ========================================================================
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class MyUtils {
  String _currentDate = '1 Jan 2021';
  String _currentTime = '01:30:45';
  String _curDateTime = '2021-06-07 01:30:45';

  String get currentDate => this._currentDate;
  String get currentTime => this._currentTime;
  String get curDateTime => this._curDateTime;

  String getCurrentTime() {
    var now = new DateTime.now();
    var timeFormatter = new DateFormat.Hms();
    String formattedTime = timeFormatter.format(now);

    return formattedTime;
  }

  String getCurrentDate() {
    var now = new DateTime.now();
    var formatter = new DateFormat('dd MMM yyyy');
    String formattedDate = formatter.format(now);

    return formattedDate;
  }

  String getCurrentDateTime() {
    var now = new DateTime.now();
    String formattedDateTime = DateFormat('dd MMM yyyy HH:mm').format(now);

    return formattedDateTime;
  }

  void getCurrentDateTimeMulti() {
    var now = new DateTime.now();
    String formattedDateTime = DateFormat('dd MMM yyyy HH:mm').format(now);
    var formatter = new DateFormat('dd MMM yyyy');
    var timeFormatter = new DateFormat.Hms();
    String formattedDate = formatter.format(now);
    String formattedTime = timeFormatter.format(now);

    this._currentDate = formattedDate;
    this._currentTime = formattedTime;
    print('Date and Time: $formattedDateTime');
    print('Date: $formattedDate');
    print('Time: $formattedTime');
  }

//-- Get Current Date with EPOX/Unix TimeStamp input
// ========================================================================
  void getDateTimeEpoc() {
    final df = new DateFormat('dd-MM-yyyy hh:mm a');
    int myvalue = 1558432747;
    print(df.format(new DateTime.fromMillisecondsSinceEpoch(myvalue * 1000)));
  }

// Converting mySql Date to custom
// ========================================================================
  String convertMySqlDate(DateTime mySqlDate) {
    String formattedDateTime =
        // DateFormat('dd MMM yyyy HH:mm').format(mySqlDate);
        // DateFormat('dd MMM yyyy').format(mySqlDate);
        DateFormat('yyyy-MM-dd').format(mySqlDate);
    return formattedDateTime;
  }

// Converting Currency Format to IDR = Rupiah
// ========================================================================
  static String convertToIdr(dynamic number, int decimalDigit) {
    NumberFormat currencyFormatter = NumberFormat.currency(
      locale: 'id',
      symbol: 'Rp ',
      decimalDigits: decimalDigit,
    );
    return currencyFormatter.format(number);
  }

// Converting Currency Format to IDR = Rupiah
// ========================================================================
  static dynamic getDigitOnly(dynamic value) {
    String onlyDigits = value.replaceAll(RegExp('[^0-9]'), "");
    // double doubleValue = double.parse(onlyDigits) / 100;
    return onlyDigits;
  }

  String convertMySqlTime(String strTime) {
    DateTime parseDt = DateTime.parse(strTime);
    String formattedDateTime =
        // DateFormat('dd MMM yyyy HH:mm').format(mySqlDate);
        DateFormat('HH:mm').format(parseDt);
    return formattedDateTime;
  }

  getCustomFormattedDateTime(String givenDateTime, String dateFormat) {
    // dateFormat = 'MM/dd/yy'; or 'dd-MMM-yy HH:mm';
    final DateTime docDateTime = DateTime.parse(givenDateTime);
    return DateFormat(dateFormat).format(docDateTime);
  }

// Build Loading Indicator
// ========================================================================
  Widget buildLoading() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  //--Convert Mapping data ke Json format:
  dynamic convertJson(dynamic param) {
    const JsonEncoder encoder = JsonEncoder();
    final dynamic object = encoder.convert(param);
    return object;
  }
}
