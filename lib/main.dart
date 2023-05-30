import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:sky_scrapper/Random_Api/provider/Random_provider.dart';
import 'package:sky_scrapper/Random_Api/view/Random_Screen.dart';

void main() {
  runApp(Sizer(builder: (context, orientation, deviceType) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => Random_provider(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/': (context) => Random_Screen(),
        },
      ),
    );
  },
  ));
}
