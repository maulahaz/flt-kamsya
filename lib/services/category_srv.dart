import 'package:kamsya/configs/all_configs.dart';
import 'package:http/http.dart' as http;
import 'package:kamsya/models/all_models.dart';

class CategoryService {
  //--Variables:

  //--
  static Future<List<CategoryModel>> fetchBarang() async {
    var url = Uri.parse(BASE_URL + 'category/fetch_categories/88');
    var response = await http.get(url);

    if (response.statusCode == 200) {
      var responseBody = response.body;
      // print('Datanya: $responseBody');
      return categoryModelFromJson(responseBody);
    } else {
      print('No connect');
      return [];
    }
  }
}
