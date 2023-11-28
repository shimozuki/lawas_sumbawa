// ignore_for_file: must_be_immutable
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:lawas_sumbawa/model/book_model.dart';
// import 'package:story_book/page/quiz/quiz_screen.dart';
// import 'package:story_book/page/quiz_screen.dart';

class DetailsPage extends StatefulWidget {
  const DetailsPage(BookModel model, {super.key});

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {

  final AssetsAudioPlayer audioPlayer = AssetsAudioPlayer();

  @override
  void initState() {
    super.initState();

    audioPlayer.open(
      Audio('assets/images/story.mp3'),
      autoStart: false,
      showNotification: true,
    );
    audioPlayer.play();
  }

  @override
  void dispose() {
    audioPlayer.dispose();
    super.dispose();
  }

  // Fungsi untuk memainkan atau menghentikan audio
  void toggleAudio() {
    if (audioPlayer.isPlaying.value) {
      audioPlayer.pause();
    } else {
      audioPlayer.play();
    }
  }

  // void _onTabTapped(int index) {
  //   setState(() {
  //     _selectedIndex = index;
  //   });
  //   if (_selectedIndex == 1) {
  //     Navigator.push(
  //       context,
  //       MaterialPageRoute(builder: (context) => const Home()),
  //     );
  //   } else if (_selectedIndex == 2) {
  //     Navigator.push(
  //       context,
  //       MaterialPageRoute(builder: (context) => const Home()),
  //     );
  //   } else if (_selectedIndex == 3) {
  //     // Navigator.push(
  //     //   context,
  //     //   MaterialPageRoute(builder: (context) => const Akun()),
  //     // );
  //   }
  // }

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
          actions: [
            IconButton(
              icon: Icon(audioPlayer.isPlaying.value
                  ? Icons.pause
                  : Icons.play_circle),
              onPressed: toggleAudio,
            ),

            // Tambahkan ikon lain di sini sesuai kebutuhan
          ],
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.fromLTRB(20, 10, 17, 31),
            width: double.infinity,
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
                    'Halaman 1',
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
                  padding: EdgeInsets.fromLTRB(17, 10, 17, 10),
                  width: double.infinity,
                  height: 236,
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
                          'The infection comes as fever at night. If you take ill, watch the veins— the tributary of blood travelling down the arms. If they remain as they ever did, you have nothing to fear. \n\nIf the blood darkens to an inky black, the infection has taken hold. \n\nThe infection comes as fever at night.',
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
                Container(
                  margin: EdgeInsets.fromLTRB(0, 0, 0, 46),
                  width: double.infinity,
                  child: RichText(
                    text: TextSpan(
                      style: GoogleFonts.playfairDisplay(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        height: 1.5,
                        color: Color(0xff000000),
                      ),
                      children: [
                        TextSpan(
                          text:
                              'Ajan aku dadi jangi \n ya ku ngawang mara pio \n  metokal adik kuleno \n \n durianku sengkaeh manis \n  kadu kutibar ke ate \n no antanku sayang adik \n \n kutembok nyir tua satungkap \n  kutembok angkang ano tawi \n  kutunt ku tuntet jangka ada jangi \n \n jangi apapo jangi ta \n  btarepa mara lalat \n  yaku mimpat po kakendung. \n \n pio ijo lete mega \n  satekusa sai nyawa \n  ling sopo sifat ku ke adik \n \n sai sate nyaman mate \n laga lalo rembet sembahyang \n lema nyaman nyawa lalo \n \n nyawalalo bilin tubuh \n renduk nangisling potoban \n masi po asi dunia \n \n dunia mara den maman \n kupajelek sajan nyaman \n loba bilo umir ku gamana',
                        ),
                        WidgetSpan(
                          child: SizedBox(height: 16),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: BottomAppBar(
          color: Colors.white,
          child: Container(
            // checkoutwrapperf6X (175:297)
            padding: EdgeInsets.fromLTRB(15, 10, 15, 10),
            width: double.infinity,
            height: 66,
            decoration: BoxDecoration(
              border: Border.all(color: Color.fromARGB(51, 207, 207, 207)),
              color: Color(0xffffffff),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () {
                    // final userProvider =
                    //     Provider.of<UserProvider>(context, listen: false);

                    // List<Map<String, dynamic>> selectedItems =
                    //     _template.map((item) {
                    //   return {
                    //     "kdBarang": item["kd_barang"],
                    //     "kdSatuan": item["kd_satuan"],
                    //     "qty": item["qty"],
                    //   };
                    // }).toList();

                    // Navigator.of(context).push(
                    //   MaterialPageRoute(
                    //     builder: (context) => SelectTemplateCart(
                    //       selectedItems: selectedItems,
                    //       token: userProvider.user!.mobToken,
                    //     ),
                    //   ),
                    // );
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                          40), // set border radius menjadi setengah dari width/height
                      border: Border.all(
                          color: Color(0xFF9CCC65), width: 2), // set border
                    ),
                    // frame59xbR (175:298)
                    width: 46,
                    height: 46,
                    child: Icon(
                      Icons.download,
                      color: Color(0xFF9CCC65),
                    ),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                InkWell(
                  onTap: () {
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //     builder: (context) => QuizScreen(),
                    //   ),
                    // );
                    // if (_jenis_user == 1) {
                    //   checkout();
                    // } else if (_jenis_user == 2) {
                    //   approver();
                    // } else if (_jenis_user == 3) {
                    //   drafter();
                    // }
                  },
                  child: Container(
                    // frame60zo1 (175:306)
                    width: MediaQuery.of(context).size.width * 0.7,
                    height: double.infinity,
                    decoration: BoxDecoration(
                      color: Color(0xFF9CCC65),
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: Center(
                      child: Text(
                        'Video',
                        style: GoogleFonts.playfairDisplay(
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                          height: 1.1725,
                          color: Color(0xffffffff),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
