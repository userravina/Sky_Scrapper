import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:sky_scrapper/Covid_19_hederApi/modal/covid_modal.dart';
import 'package:sky_scrapper/Covid_19_hederApi/provider/covid_provider.dart';

class CovidScreen extends StatefulWidget {
  const CovidScreen({Key? key}) : super(key: key);

  @override
  State<CovidScreen> createState() => _CovidScreenState();
}

class _CovidScreenState extends State<CovidScreen> {
  Covid_provider? pt;
  Covid_provider? pf;

  @override
  Widget build(BuildContext context) {
    pt = Provider.of<Covid_provider>(context, listen: true);
    pf = Provider.of<Covid_provider>(context, listen: false);
    return SafeArea(
        child: Scaffold(
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
        actions: [
          InkWell(onTap: () {
            Navigator.pushNamed(context, 'search');
          },
            child: Icon(
              Icons.search,
              color: Colors.white,size: 27,
            ),
          ),SizedBox(width: 10,)
        ],
      ),
      body: Stack(children: [
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
          child: FutureBuilder(
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return Text("Error :- ${snapshot.hasError}");
              } else if (snapshot.hasData) {
                // CovidModel c =snapshot.data!;
                pf!.getdatalist(snapshot.data!);
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Container(
                            height: 20.h,
                            width: 90.w,
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text(
                                        "All Country History Covid-19 data",
                                        style: GoogleFonts.alice(
                                            color: Colors.white,
                                            fontSize: 15.sp),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text(
                                        "All Country Covid-19 data",
                                        style: GoogleFonts.alice(
                                            color: Colors.white,
                                            fontSize: 15.sp),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text(
                                        "The Cases Covid-19",
                                        style: GoogleFonts.alice(
                                            color: Colors.white,
                                            fontSize: 15.sp),
                                      ),
                                    ],
                                  ),
                                ]),
                          )
                        ],
                      ),
                      Expanded(
                        child: GridView.builder(
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    mainAxisSpacing: 10,
                                    crossAxisSpacing: 10,
                                    mainAxisExtent: 5.h),
                            itemBuilder: (BuildContext context, int index) {
                              return InkWell(
                                onTap: () {
                                  Navigator.pushNamed(context, 'view',arguments: pf!.list[index]);
                                },
                                child: Container(
                                  height: 5.h,
                                  width: 30.w,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Colors.black54),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        width: 3,
                                      ),
                                      CircleAvatar(
                                        backgroundImage: NetworkImage(
                                            "${pt!.list[index].countryInfo!.flag}"),
                                        radius: 10,
                                      ),
                                      SizedBox(
                                        width: 3,
                                      ),
                                      Container(
                                        height: 5.h,
                                        width: 35.w,
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              top: 8, left: 10),
                                          child: Text(
                                            "${pf!.list[index].country}",
                                            style: GoogleFonts.alice(
                                                color: Colors.white,
                                                fontSize: 11.sp),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              );
                            },
                            itemCount: pf!.list.length),
                      ),
                    ],
                  ),
                );
              }
              return Center(
                child: CircularProgressIndicator(),
              );
            },
            future: pf!.Getdata(),
          ),
        ),
      ]),
    ));
  }
}
