import 'dart:convert';

import 'package:kamsya/configs/all_configs.dart';
import 'package:http/http.dart' as http;

class AuthService {
  //--Variables:

  //--
  static Future<Map<String, dynamic>> doLogin(dynamic data) async {
    var url = Uri.parse(BASE_URL + 'users/api_login');
    print('---from doLoginSrv');
    print(data);

    var response = await http.post(
      url,
      headers: {"Accept": "application/json"},
      body: data,
    );
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      print('Datanya doLogin: $data');
      return data;
    } else {
      print('Error: doLogin');
      return {};
    }
  }
}
