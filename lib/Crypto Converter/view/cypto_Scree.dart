import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:sky_scrapper/Crypto%20Converter/provider/Crypto_provider.dart';

class cypto_Screen extends StatefulWidget {
  const cypto_Screen({Key? key}) : super(key: key);

  @override
  State<cypto_Screen> createState() => _cypto_ScreenState();
}

class _cypto_ScreenState extends State<cypto_Screen> {
  Crypto_provider? pf;
  Crypto_provider? pt;
  @override
  Widget build(BuildContext context) {
    pt = Provider.of<Crypto_provider>(context,listen: true);
    pf = Provider.of<Crypto_provider>(context,listen: false);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("CRYPTO CONVERT ANDROID"),
          centerTitle: true,
          backgroundColor: Colors.red,
        ),
        body: Stack(
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: Container(
                height: 60.h,
                //color: Colors.blue,
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 1.5.h,horizontal: 4.w),
                      child: container("BTC", "${pt!.BTC1}", "${pt!.CurrencyName}", context),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 1.5.h,horizontal: 4.w),
                      child: container("ETH", "${pt!.ETH1}", "${pt!.CurrencyName}", context),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 1.5.h,horizontal: 4.w),
                      child: container("XRP", "${pt!.XRP1}", "${pt!.CurrencyName}", context),
                    ),
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: 8.h,
                color: Colors.red,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      "Current Currency",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 15.sp
                      ),
                    ),
                    DropdownButtonHideUnderline(
                      child: DropdownButton(
                        dropdownColor: Colors.red,
                        icon: Icon(Icons.arrow_drop_down,color: Colors.white,size: 30,),
                        items: pt!.list.asMap().entries.map((e) => DropdownMenuItem(
                          child: Text(
                            "${pt!.list[e.key]}",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 15.sp
                            ),
                          ),
                          value: "${pt!.list[e.key]}",
                          onTap: () {
                            pf!.ChnageValue2(e.key);
                          },
                        ),).toList(),
                        value: pt!.CurrencyName,
                        onChanged: (value) {
                          pf!.ChnageValue(value);
                        },
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
  Widget container(name,price,currency,context)
  {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 1.5.h,horizontal: 4.w),
      child: Container(
        height: 6.h,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            color: Colors.red,
            boxShadow: [
              BoxShadow(
                  color: Colors.black38,
                  blurRadius: 15,
                  offset: Offset(0,0)
              )
            ],
            borderRadius: BorderRadius.circular(15)
        ),
        alignment: Alignment.center,
        child: Text(
          "1 $name  =  $price $currency",
          style: TextStyle(
              color: Colors.white,
              fontSize: 15.sp,
              fontWeight: FontWeight.bold
          ),
        ),
      ),
    );
  }
}

