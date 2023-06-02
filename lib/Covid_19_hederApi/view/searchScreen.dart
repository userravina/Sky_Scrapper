import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../provider/covid_provider.dart';

class Searchscreen extends StatefulWidget {
  const Searchscreen({Key? key}) : super(key: key);

  @override
  State<Searchscreen> createState() => _SearchscreenState();
}

class _SearchscreenState extends State<Searchscreen> {
  Covid_provider? pt;
  Covid_provider? pf;

  @override
  Widget build(BuildContext context) {
    pt = Provider.of<Covid_provider>(context, listen: true);
    pf = Provider.of<Covid_provider>(context, listen: false);
    return SafeArea(
      child: Scaffold(backgroundColor: Colors.black87,
        appBar: AppBar(
          toolbarHeight: 60,
          flexibleSpace: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [Colors.black38, Colors.red.shade300])),
          ),
          centerTitle: true,
          title: Text(
            "Covid-19 Data",
            style: GoogleFonts.alice(color: Colors.white, fontSize: 23.sp),
          ),
          backgroundColor: Color(0xff940101),
          elevation: 0,

        ),
        body: Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Image.asset(
                "assets/images/bg.jpg",
                fit: BoxFit.cover,
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              color: Colors.black54,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Container(
                      height: 7.h,
                      child: TextField(style: TextStyle(color: Colors.white,textBaseline: TextBaseline.ideographic),
                        onChanged: (value) {
                          pf!.searchfiled(value);
                        },
                        cursorColor: Colors.white,
                        cursorHeight: 3.h,
                        cursorWidth: 1,
                        decoration: InputDecoration(
                            focusColor: Colors.black12,
                            enabledBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(width: 1, color: Colors.white),
                                borderRadius: BorderRadius.circular(20)),
                            focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(width: 1, color: Colors.white),
                                borderRadius: BorderRadius.circular(20)),
                            hintText: "Search",
                            hintStyle: TextStyle(
                                color: Colors.white, letterSpacing: 1)),
                        textDirection: TextDirection.ltr,
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Expanded(
                    child:
                    Consumer<Covid_provider>(
                      builder: (context, provider, child) => ListView.builder(
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              Navigator.pushNamed(context, 'view',arguments: pt!.list1[index]);
                            },
                            child: ListTile(
                              leading: SizedBox(width:50,child: Image.network("${provider.list1[index].countryInfo!.flag}",)),
                              title: Text("${provider.list1[index].country!}",style: GoogleFonts.alice(color: Colors.white),),
                            ),
                          );
                        },
                        itemCount: provider.list1.length,
                      ),
                    ),
                  ),
                  // SizedBox(height: 40.h,width: 90.w,
                  //   child: ListView.builder(
                  //     itemBuilder: (context, index) {
                  //       return ListTile(
                  //         title: Text("${pt!.list[index].country}", style: GoogleFonts.alice(color: Colors.white, fontSize: 15.sp),),
                  //         leading: Image.network(
                  //           "${pt!.list[index].countryInfo!.flag}",
                  //           height: 15,
                  //           width: 15,
                  //           fit: BoxFit.fill,
                  //         ),
                  //       );
                  //     },
                  //     itemCount: pt!.list.length,
                  //   ),
                  // ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
