import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:sky_scrapper/Random_Api/modal/Random_modal.dart';
class Api_Helper {

  // cyp
  static Api_Helper api_helper=Api_Helper();
  // random_Api
  Future<RandomUserModel> Randomgetdata()
  async {
    print("========== ******");
    String? like = "https://randomuser.me/api/";
    print("========== $like");
    var responce = await http.get(Uri.parse(like));
    print("============ ${responce.statusCode}");
    var json = jsonDecode(responce.body);
    print("=========== $json");
    RandomUserModel randomUserModel = RandomUserModel.fromJson(json);
    return randomUserModel;
  }

}