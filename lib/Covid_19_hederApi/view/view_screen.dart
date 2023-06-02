import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';
import 'package:sky_scrapper/Covid_19_hederApi/modal/covid_modal.dart';

class ViewScreen extends StatefulWidget {
  const ViewScreen({Key? key}) : super(key: key);

  @override
  State<ViewScreen> createState() => _ViewScreenState();
}

class _ViewScreenState extends State<ViewScreen> {
  @override
  Widget build(BuildContext context) {
    CovidModel d = ModalRoute.of(context)!.settings.arguments as CovidModel;
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
          actions: [
            Icon(
              Icons.search,
              color: Colors.white,
              size: 27,
            ),
            SizedBox(
              width: 10,
            )
          ],
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
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: Row(
                        children: [
                          Text(
                            "Country :- ${d.country}",
                            style:
                                GoogleFonts.alice(color: Colors.white, fontSize: 20.sp),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: Row(
                        children: [
                          Text(
                            "Cases :- ${d.cases}",
                            style:
                            GoogleFonts.alice(color: Colors.white, fontSize: 20.sp),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: Row(
                        children: [
                          Text(
                            "TodayCases :- ${d.todayCases}",
                            style:
                            GoogleFonts.alice(color: Colors.white, fontSize: 20.sp),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: Row(
                        children: [
                          Text(
                            "Deaths :- ${d.deaths}",
                            style:
                            GoogleFonts.alice(color: Colors.white, fontSize: 20.sp),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: Row(
                        children: [
                          Text(
                            "TodayDeaths :- ${d.todayDeaths}",
                            style:
                            GoogleFonts.alice(color: Colors.white, fontSize: 20.sp),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: Row(
                        children: [
                          Text(
                            "Recovered :- ${d.recovered}",
                            style:
                            GoogleFonts.alice(color: Colors.white, fontSize: 20.sp),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: Row(
                        children: [
                          Text(
                            "TodayRecovered :- ${d.todayRecovered}",
                            style:
                            GoogleFonts.alice(color: Colors.white, fontSize: 20.sp),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20,left: 20,bottom: 20),
                      child: Row(
                        children: [
                          Text(
                            "OneTestPerPeople :- ${d.oneTestPerPeople}",
                            style:
                            GoogleFonts.alice(color: Colors.white, fontSize: 20.sp),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20,left: 20,bottom: 20),
                      child: Row(
                        children: [
                          Text(
                            "Population :- ${d.population}",
                            style:
                            GoogleFonts.alice(color: Colors.white, fontSize: 20.sp),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: Row(
                        children: [
                          Text(
                            "Critical :- ${d.critical}",
                            style:
                            GoogleFonts.alice(color: Colors.white, fontSize: 20.sp),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: Row(
                        children: [
                          Text(
                            "Active :- ${d.active}",
                            style:
                            GoogleFonts.alice(color: Colors.white, fontSize: 20.sp),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 15,left: 10,bottom: 15),
                      child: Row(
                        children: [
                          Text(
                            "DeathsPerOneMillion :- ${d.deathsPerOneMillion}",
                            style:
                            GoogleFonts.alice(color: Colors.white, fontSize: 20.sp),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
