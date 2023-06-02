import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:sky_scrapper/Covid_19_hederApi/modal/covid_modal.dart';
import 'package:sky_scrapper/Random_Api/modal/Random_modal.dart';

class Api_Helper {
  static Api_Helper api_helper = Api_Helper();

  // Covid_19
  Future<List<CovidModel>> covidApi() async {
    String? like =
        "https://corona.lmao.ninja/v2/countries?yesterday=null&sort=null";
    var responce = await http.get(Uri.parse(like));

    List json = jsonDecode(responce.body);

    List<CovidModel> CovidList = json.map((e) => CovidModel.fromJson(e)).toList();

    return CovidList;

  }

  // random_Api
  Future<RandomUserModel> Randomgetdata() async {
    String? like = "https://randomuser.me/api/";
    var responce = await http.get(Uri.parse(like));
    print("============ ${responce.statusCode}");
    var json = jsonDecode(responce.body);
    print("=========== $json");
    RandomUserModel randomUserModel = RandomUserModel.fromJson(json);
    return randomUserModel;
  }
}
