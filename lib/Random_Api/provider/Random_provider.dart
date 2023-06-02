import 'package:flutter/cupertino.dart';
import 'package:sky_scrapper/Api_Helper/api_helper.dart';
import 'package:sky_scrapper/Random_Api/modal/Random_modal.dart';

class Random_provider extends ChangeNotifier{
  // RandomUserModel? homeModeldata;
   RandomUserModel? data;
   void getData() async {
     data = await Api_Helper.api_helper.Randomgetdata();
     notifyListeners();
   }

  // void Refresh(index) {
  //   data = index;
  //   notifyListeners();
  // }
  // notifyListeners();
}