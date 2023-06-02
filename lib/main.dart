import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:sky_scrapper/Covid_19_hederApi/provider/covid_provider.dart';
import 'package:sky_scrapper/Covid_19_hederApi/view/Covid_19_Screen.dart';
import 'package:sky_scrapper/Covid_19_hederApi/view/searchScreen.dart';
import 'package:sky_scrapper/Covid_19_hederApi/view/view_screen.dart';
import 'package:sky_scrapper/Crypto%20Converter/provider/Crypto_provider.dart';
import 'package:sky_scrapper/Random_Api/provider/Random_provider.dart';
import 'package:sky_scrapper/Random_Api/view/Random_Screen.dart';
import 'Crypto Converter/view/cypto_Scree.dart';

void main() {
  runApp(Sizer(builder: (context, orientation, deviceType) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => Random_provider(),
        ),
        ChangeNotifierProvider(
          create: (context) => Crypto_provider(),
        ),
        ChangeNotifierProvider(create: (context) => Covid_provider(),)
      ],
      child: MaterialApp(
        initialRoute: '/',
        debugShowCheckedModeBanner: false,
        routes: {
          '/': (context) => Random_Screen(),
          'crypto': (context) => cypto_Screen(),
          'covid': (context) => CovidScreen(),
          'view': (context) => ViewScreen(),
          'search': (context) => Searchscreen(),
        },
      ),
    );
  },
  ));
}
