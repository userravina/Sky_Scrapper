import 'package:flutter/foundation.dart';

import '../modal/crypto_modal.dart';

class Crypto_provider extends ChangeNotifier{

  int index=0;
  String CurrencyName = "JPY";
  String BTC1 = "28,65,615.03";
  String ETH1 = "2,02,262.67";
  String XRP1 = "50.50";
  String link = "https://randomuser.me/api/";
  List list = [
    "JPY",
    "EUR",
    "ZAR",
    "CAD",
    "CNY",
    "AUD",
  ];
  List XRP = [
    "50.50",
    "0.36",
    "6.83",
    "0.52",
    "2.61",
    "0.55",
  ];
  List BTC = [
    "28,72,646.64",
    "20,351.73",
    "3,88,687.30",
    "29,380.41",
    "1,48,496.01",
    "31,518.58",
  ];
  List ETH = [
    "2,02,848.14",
    "1,436.98",
    "27,438.75",
    "2,074.58",
    "10,485.05",
    "2,225.44",
  ];
  List countrydata = [];
  List worlddata = [];
  List JPY = [];

  void ChnageValue(value)
  {
    CurrencyName = value;
    notifyListeners();
  }
  void ChnageValue2(i)
  {
    BTC1 = BTC[i];
    XRP1 = XRP[i];
    ETH1 = ETH[i];
    notifyListeners();
  }
  void ChnageIndex(value)
  {
    index = value;
    notifyListeners();
  }
}