// ignore_for_file: unused_local_variable

import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:provider/provider.dart';
// import 'package:shared_preferences/shared_preferences.dart';
import 'package:lawas_sumbawa/component/footer_bar.dart';
import 'package:lawas_sumbawa/controller/About_controller.dart';
import 'package:lawas_sumbawa/model/about_model.dart';
import 'package:lawas_sumbawa/pages/home_page.dart';
import 'package:lawas_sumbawa/pages/upload_screen.dart';
import 'package:lawas_sumbawa/pages/vidio_page.dart';


class About extends StatefulWidget {
  const About({super.key});

  @override
  State<About> createState() => _AboutState();
}

class _AboutState extends State<About> {
  bool isAddButtonClicked = false;
  int _selectedIndex = 3;
  final AboutController _AboutController = AboutController();
  late String description;

   @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    try {
      final AboutModel lawasData = await _AboutController.fetchAboutData();
      setState(() {
        description = lawasData.description;
      });
    } catch (e) {
      print('Error fetching data: $e');
    }
  }

  void _onTabTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    if (_selectedIndex == 1) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const Video()),
      );
    } else if (_selectedIndex == 2) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const Upload()),
      );
    } else if (_selectedIndex == 0) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => HomePage()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xffffffff),
          title: Text(
            'About Apps',
            style: GoogleFonts.plusJakartaSans(
              fontSize: 20,
              fontWeight: FontWeight.w500,
              color: const Color(0xff000000),
            ),
          ),
          iconTheme: const IconThemeData(
            color: Color(0xff000000), // Ubah warna icon menjadi hitam
          ),
          elevation: 0,
        ),
        body: Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height * 1.0,
          decoration: BoxDecoration(
            color: Color(0xffffffff),
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                        width: 495,
                        height: 324,
                        child: Image.asset('assets/2481145.jpg'),
                      ),
                      Container(
                        // homeindicatorEVR (35461:438)
                        margin: EdgeInsets.fromLTRB(163.5, 0, 180.5, 11),
                        width: double.infinity,
                        height: 5,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          color: Color(0xFF9CCC65),
                        ),
                      ),
                      Container(
                        // imheretoquellyo9cP (35461:394)
                        margin: EdgeInsets.fromLTRB(15, 0, 15, 0),
                        constraints: BoxConstraints(
                          maxWidth: 388,
                        ),
                        child: RichText(
                          textAlign: TextAlign.justify,
                          text: TextSpan(
                            style: GoogleFonts.plusJakartaSans(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              height: 1.875,
                              color: Color(0xff2e2f41),
                            ),
                            children: [
                              TextSpan(
                                text:
                                    description,
                                style: GoogleFonts.plusJakartaSans(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                  height: 1.875,
                                  color: Color(0xff2e2f41),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: MyBottomNavigationBar(
          currentIndex: _selectedIndex,
          onTabTapped: _onTabTapped,
        ),
      ),
    );
  }
}
