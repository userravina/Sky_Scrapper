import 'package:flutter/cupertino.dart';
import 'package:sky_scrapper/Api_Helper/api_helper.dart';
import 'package:sky_scrapper/Random_Api/modal/Random_modal.dart';

class Random_provider extends ChangeNotifier{
  // RandomUserModel? homeModeldata;
   RandomUserModel? data;
  Future<RandomUserModel> Randomdata()
  async {
    print("========== START");
    Api_Helper api_helper = Api_Helper();
    RandomUserModel? newsModal = await api_helper.Randomgetdata();
    print("==============  $newsModal");
    // homeModeldata = newsModal;
    return newsModal;
  }

  void Refresh(index) {
    data = index;
    notifyListeners();
  }
  notifyListeners();
}