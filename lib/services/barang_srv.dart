import 'dart:convert';

import 'package:kamsya/configs/all_configs.dart';
import 'package:http/http.dart' as http;
import 'package:kamsya/models/all_models.dart';

class BarangService {
  //--Variables:

  //--
  static Future<List<BarangModel>> fetchBarang() async {
    var url = Uri.parse(BASE_URL + 'barang/api_get_barang');
    var response = await http.get(url);

    if (response.statusCode == 200) {
      var responseBody = response.body;
      // print('Datanya: $responseBody');
      return barangModelFromJson(responseBody);
    } else {
      print('No connect');
      return [];
    }
  }

  //--Add new data:
  static Future<bool> addBarang(dynamic data) async {
    var url = Uri.parse(BASE_URL + 'barang/api_add_barang');
    print('---from addBarangSrv');
    print(data);

    var response = await http.post(
      url,
      headers: {"Accept": "application/json"},
      body: data,
    );
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      print('---from addBarang');
      print(data);
      return data['isSuccess'];
    } else {
      print('Failed addDataBarang');
      throw Exception('Failed addDataBarang');
    }
  }

  //--Update/Edit data:
  static Future<bool> editBarang(dynamic data) async {
    var url = Uri.parse(BASE_URL + 'barang/api_edit_barang');
    print('---from editBarangSrv');
    print(data);

    var response = await http.post(
      url,
      headers: {"Accept": "application/json"},
      body: data,
    );
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      print('---from editBarang');
      print(data);
      return data['isSuccess'];
    } else {
      print('Failed editBarang');
      throw Exception('Failed editBarang');
    }
  }
}

dynamic convertJson(dynamic param) {
  const JsonEncoder encoder = JsonEncoder();
  final dynamic object = encoder.convert(param);
  return object;
}
