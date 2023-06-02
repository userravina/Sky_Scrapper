import 'package:flutter/cupertino.dart';
import 'package:sky_scrapper/Api_Helper/api_helper.dart';
import 'package:sky_scrapper/Covid_19_hederApi/modal/covid_modal.dart';
import 'package:sky_scrapper/Random_Api/modal/Random_modal.dart';

class Covid_provider extends ChangeNotifier {
  //
  // List searchList=[];
  //
  //  // CovidModel covidModel = CovidModel();
  //
  // List<CovidModel> li= [];
  List<CovidModel> list = [];
  List<CovidModel> list1 = [];
  List<CovidModel> SearchList = [];

  Future<List<CovidModel>> Getdata() {
    return Api_Helper.api_helper.covidApi();
  }

  void getdatalist(List<CovidModel> cList) {
    list = cList;
    list1 = List.from(list);
  }

  void searchfiled(String search) {
    SearchList.clear();
    if (search.isEmpty) {
      list1 = List.from(list);
    }
    else
    {
      for (var c1 in list)
      {
        if (c1.country!.toLowerCase().contains(search.toLowerCase()))
        {
          SearchList.add(c1);
        }
        list1 = List.from(SearchList);
      }
    }
    notifyListeners();
  }
}
