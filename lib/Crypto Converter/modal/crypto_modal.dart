// To parse this JSON data, do
//
//     final httpsRandomuserMeApi = httpsRandomuserMeApiFromJson(jsonString);

import 'dart:convert';

Map<String, HttpsRandomuserMeApi> httpsRandomuserMeApiFromJson(String str) => Map.from(json.decode(str)).map((k, v) => MapEntry<String, HttpsRandomuserMeApi>(k, HttpsRandomuserMeApi.fromJson(v)));

String httpsRandomuserMeApiToJson(Map<String, HttpsRandomuserMeApi> data) => json.encode(Map.from(data).map((k, v) => MapEntry<String, dynamic>(k, v.toJson())));

class HttpsRandomuserMeApi {
  double? marketCap;
  double? volume;
  int? circulatingSupply;

  HttpsRandomuserMeApi({
    this.marketCap,
    this.volume,
    this.circulatingSupply,
  });

  factory HttpsRandomuserMeApi.fromJson(Map<String, dynamic> json) => HttpsRandomuserMeApi(
    marketCap: json["market_cap"]?.toDouble(),
    volume: json["volume"]?.toDouble(),
    circulatingSupply: json["circulating_supply"],
  );

  Map<String, dynamic> toJson() => {
    "market_cap": marketCap,
    "volume": volume,
    "circulating_supply": circulatingSupply,
  };
}
