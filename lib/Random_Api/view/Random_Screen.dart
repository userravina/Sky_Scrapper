import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:sky_scrapper/Api_Helper/api_helper.dart';
import 'package:sky_scrapper/Random_Api/modal/Random_modal.dart';

import '../provider/Random_provider.dart';

class Random_Screen extends StatefulWidget {
  const Random_Screen({Key? key}) : super(key: key);

  @override
  State<Random_Screen> createState() => _Random_ScreenState();
}

class _Random_ScreenState extends State<Random_Screen> {
  Random_provider? pt;
  Random_provider? pf;
@override
  void initState() {
    Provider.of<Random_provider>(context,listen: false).getData();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    pt = Provider.of<Random_provider>(context, listen: true);
    pf = Provider.of<Random_provider>(context, listen: false);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: Text(
            "RANDOM DATA",
            style: TextStyle(color: Colors.white),
          ),
          actions: [
            Padding(
              padding: EdgeInsets.only(right: 1.5.w),
              child: IconButton(
                onPressed: () async {
                  Provider.of<Random_provider>(context,listen: false).getData();
                  // pf!.Refresh(await Api_Helper.api_helper.Randomgetdata());
                },
                icon: Icon(
                  Icons.refresh,
                  color: Colors.white,
                ),
              ),
            ),
          ],
          centerTitle: true,
          backgroundColor: Colors.black,
        ),
        backgroundColor: Colors.black,
        body:
            // FutureBuilder(
            //   future: Api_Helper().Randomgetdata(),
            //   builder: (context, snapshot) {
            //     if (snapshot.hasError) {
            //       return Text(
            //         "Error :- ${snapshot.error}",
            //         style: TextStyle(color: Colors.white),
            //       );
            //     } else if (snapshot.hasData) {
            //       pf!.Refresh(snapshot.data!);
            //       return
          pt!.data == null ? Center(child: CircularProgressIndicator()): SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 2.h,
              ),
              Align(
                alignment: Alignment.center,
                child: CircleAvatar(
                  radius: 80,
                  backgroundImage: NetworkImage(
                    "${pt!.data!.results![0].picture!.large}",
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Align(
                alignment: Alignment.center,
                child: Text(
                  "${pt!.data!.results![0].name!.title} ${pt!.data!.results![0].name!.first} ${pt!.data!.results![0].name!.last}",
                  style: TextStyle(color: Colors.white, fontSize: 25.sp),
                ),
              ),
              SizedBox(
                height: 1.h,
              ),
              Container(
                height: 3.h,
                alignment: Alignment.topLeft,
                // color: Colors.yellow,
                child: Row(
                  children: [
                    SizedBox(
                      width: 6.w,
                    ),
                    Text(
                      "Name :",
                      style: TextStyle(color: Colors.white, fontSize: 12.sp),
                    ),
                    SizedBox(
                      width: 7.w,
                    ),
                    Text(
                      "${pt!.data!.results![0].name!.title} ${pt!.data!.results![0].name!.first} ${pt!.data!.results![0].name!.last}",
                      style: TextStyle(color: Colors.white, fontSize: 12.sp),
                    ),
                  ],
                ),
              ),
              Container(
                height: 7.h,
                alignment: Alignment.topLeft,
                child: Row(
                  children: [
                    SizedBox(
                      width: 6.w,
                    ),
                    Text(
                      "Email :",
                      style: TextStyle(color: Colors.white, fontSize: 12.sp),
                    ),
                    SizedBox(
                      width: 7.w,
                    ),
                    Text(
                      "${pt!.data!.results![0].email}",
                      style: TextStyle(color: Colors.white, fontSize: 12.sp),
                    ),
                  ],
                ),
              ),
              Container(
                height: 7.h,
                // color: Colors.yellow,
                alignment: Alignment.topLeft,
                child: Row(
                  children: [
                    SizedBox(
                      width: 6.w,
                    ),
                    Text(
                      "Phone :",
                      style: TextStyle(color: Colors.white, fontSize: 12.sp),
                    ),
                    SizedBox(
                      width: 7.w,
                    ),
                    Text(
                      "${pt!.data!.results![0].phone}",
                      style: TextStyle(color: Colors.white, fontSize: 12.sp),
                    ),
                  ],
                ),
              ),
              Container(
                height: 7.h,
                // color: Colors.yellow,
                alignment: Alignment.topLeft,
                child: Row(
                  children: [
                    SizedBox(
                      width: 6.w,
                    ),
                    Text(
                      "Cell :",
                      style: TextStyle(color: Colors.white, fontSize: 12.sp),
                    ),
                    SizedBox(
                      width: 7.w,
                    ),
                    Text(
                      "${pt!.data!.results![0].cell}",
                      style: TextStyle(color: Colors.white, fontSize: 12.sp),
                    ),
                  ],
                ),
              ),
              Container(
                height: 7.h,
                alignment: Alignment.topLeft,
                child: Row(
                  children: [
                    SizedBox(
                      width: 6.w,
                    ),
                    Text(
                      "Address :",
                      style: TextStyle(color: Colors.white, fontSize: 12.sp),
                    ),
                    SizedBox(
                      width: 4.w,
                    ),
                    Text(
                      "${pt!.data!.results![0].location!.street!.number} ${pt!.data!.results![0].location!.street!.name}, ${pt!.data!.results![0].location!.city},\n${pt!.data!.results![0].location!.state}, ${pt!.data!.results![0].location!.country} -${pt!.data!.results![0].location!.postcode}",
                      style: TextStyle(color: Colors.white, fontSize: 12.sp),
                    ),
                  ],
                ),
              ),
              Container(
                height: 7.h,
                alignment: Alignment.topLeft,
                child: Row(
                  children: [
                    SizedBox(
                      width: 6.w,
                    ),
                    Text(
                      "Dob Date :",
                      style: TextStyle(color: Colors.white, fontSize: 12.sp),
                    ),
                    SizedBox(
                      width: 7.w,
                    ),
                    Text(
                      "${pt!.data!.results![0].dob!.date}",
                      style: TextStyle(color: Colors.white, fontSize: 12.sp),
                    ),
                  ],
                ),
              ),
              Container(
                height: 7.h,
                alignment: Alignment.topLeft,
                child: Row(
                  children: [
                    SizedBox(
                      width: 6.w,
                    ),
                    Text(
                      "Dob Age :",
                      style: TextStyle(color: Colors.white, fontSize: 12.sp),
                    ),
                    SizedBox(
                      width: 7.w,
                    ),
                    Text(
                      "${pt!.data!.results![0].dob!.age}",
                      style: TextStyle(color: Colors.white, fontSize: 12.sp),
                    ),
                  ],
                ),
              ),
              Container(
                height: 7.h,
                alignment: Alignment.topLeft,
                child: Row(
                  children: [
                    SizedBox(
                      width: 6.w,
                    ),
                    Text(
                      "NAT :",
                      style: TextStyle(color: Colors.white, fontSize: 12.sp),
                    ),
                    SizedBox(
                      width: 7.w,
                    ),
                    Text(
                      "${pt!.data!.results![0].nat}",
                      style: TextStyle(color: Colors.white, fontSize: 12.sp),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        //     }
        //     return Center(child: CircularProgressIndicator());
        //   },
        // ),
      ),
    );
  }
}
