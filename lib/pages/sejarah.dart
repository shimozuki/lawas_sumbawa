import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lawas_sumbawa/component/footer_bar.dart';
import 'package:lawas_sumbawa/pages/about_screen.dart';
import 'package:lawas_sumbawa/pages/home_page.dart';
import 'package:lawas_sumbawa/pages/upload_screen.dart';

class Sejarah extends StatefulWidget {
  const Sejarah({super.key});

  @override
  State<Sejarah> createState() => _SejarahState();
}

class _SejarahState extends State<Sejarah> {
   int _selectedIndex = 1;

  void _onTabTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    if (_selectedIndex == 0) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => HomePage()),
      );
    } else if (_selectedIndex == 2) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const Upload()),
      );
    } else if (_selectedIndex == 3) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const About()),
      );
    }
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            '',
            style: GoogleFonts.playfairDisplay(
              fontSize: 20,
              fontWeight: FontWeight.w500,
              height: 1.3325,
              color: Color(0xff000000),
              decorationColor: Color(0xff000000),
            ),
          ),
          backgroundColor: Color(0xffffffff),
          elevation: 0,
          iconTheme: IconThemeData(color: Color(0xFF9CCC65)),
          centerTitle: true, // Membuat teks menjadi di tengah
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.fromLTRB(20, 10, 17, 31),
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 1.0,
            decoration: BoxDecoration(
              color: Color(0xffffffff),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  // chapteroneaEX (10:1169)
                  margin: EdgeInsets.fromLTRB(0, 0, 1, 29),
                  child: Text(
                    'Sejarah Lawas',
                    style: GoogleFonts.playfairDisplay(
                      fontSize: 28,
                      fontWeight: FontWeight.w500,
                      height: 1.3325,
                      color: Color(0xff000000),
                      decorationColor: Color(0xff000000),
                    ),
                  ),
                ),
                Container(
                  // frame25rxj (10:1170)
                  margin: EdgeInsets.fromLTRB(1, 0, 3, 30),
                  padding: EdgeInsets.fromLTRB(17, 0, 17, 10),
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height * 0.8,
                  decoration: BoxDecoration(
                    border: Border.all(color: Color(0xff000000)),
                  ),
                  child: Center(
                    // theinfectioncomesasfeveratnigh (10:1171)
                    child: SizedBox(
                      child: Container(
                        constraints: BoxConstraints(
                          maxWidth: 318,
                        ),
                        child: Text(
                          'Lawas yang kita kenal sejak dahulu hingga sekarang ini tidak dimiliki oleh perorangan tetapi merupakan milik bersama turun-temurun.\nAhli lawas menurunkan kepada anak cucunya secara lisan. Lawas itu tidak ditulis dalam buku khusus.\nKalaupun dulu kita kenal Bumung (lembaran daun lontar tertulis disimpan dalam tabung bambu) kebanyakan isinya, lawas tutir (cerita), silsilah dan sejarah pahlawan sakti yang ditulis dengan satera jontal (tulisan lontar) mirip dengan aksara suku Bugis/Makasar.\nAksara jontal ini merupakan huruf khas suku Sumbawa yang pada zaman mutakhir ini hampir sirna.\nLawas ialah ciptaan manusia yang dilahirkan  dan dinyatakan dengan bahasa, baik lisan maupun tulisan yang menimbulkan rasa keindahan dan keharuan dalam lubuk jiwa manusia.',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.playfairDisplay(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            height: 1.7142857143,
                            color: Color(0xff000000),
                          ),
                        ),
                      ),
                    ),
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