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
            style: GoogleFonts.plusJakartaSans(
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
                    'Chapter One',
                    style: GoogleFonts.plusJakartaSans(
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
                          style: GoogleFonts.plusJakartaSans(
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
                      style: GoogleFonts.plusJakartaSans(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        height: 1.5,
                        color: Color(0xff000000),
                      ),
                      children: [
                        TextSpan(
                          text:
                              'The Never Land adalah tempat yang indah. Ada peri yang hidup di puncak pohon dan putri duyung berenang di laguna. Ada orang Indian merah asli di sebuah desa di tebing dan hutan penuh binatang liar. Yang terbaik dari semuanya, ada kapal-kapal penuh perompak dengan pemimpin yang sangat jahat, Kapten Hook.\n \n Wendy, John, dan Michael tahu pada pandangan pertama bahwa mereka akan mencintai Never Land. Mereka menyukai rumah bawah tanah Peter, dengan banyak pintu tersembunyi di pohon berlubang besar. Di sana mereka bertemu the Lost Boys yang berbagi rumah dengan Peter.\n \n Semua anak lelaki senang bahwa Wendy datang untuk menceritakan kisah pengantar tidur kepada mereka, tetapi mereka tidak menghabiskan banyak waktu di rumah bawah tanah itu. Ada terlalu banyak hal menarik untuk dilakukan. \n \n Kadang-kadang mereka bermain perang dengan orang-orang Indian merah, yang adalah teman baik mereka. Kadang-kadang mereka memiliki masalah dengan para perompak yang jahat, yang adalah musuh mereka. \n \n Suatu hari para perompak mencuri Putri Tiger Lily dari suku Indian. Kepala India, ayahnya, sangat kesal tetapi Peter Pan menyelamatkan Tiger Lily dan membawanya pulang dengan selamat. \n \n Ini membuat Kapten Hook, pemimpin bajak laut marah pada Peter, lebih dari sebelumnya.\n \n Dia menculik Wendy, John, Michael dan the lost boys ketika Peter pergi. Dia membawa mereka ke kapalnya. \n \n Hook memutuskan untuk membuangnya dari kapal. Wendy yakin bahwa Peter akan menyelamatkan mereka. Pada menit terakhir, Peter muncul. \n \n Dia mengalahkan Kapten Hook dan membebaskan semua temannya. Mereka menakuti para perompak jahat itu untuk melompat ke laut dan mendayung pergi dengan perahu mereka.\n \n Sekarang, mereka mendapatkan kapal bajak laut. Wendy memutuskan untuk pulang. Dengan harapan dan sedikit debu peri, mereka membuat kapal bajak laut itu terbang! Mereka semua berlayar di kapal itu melalui langit ke jendela kamar anak lagi. \n \n Orang tua anak-anak hampir tidak percaya bahwa anak-anak mereka pernah ke Never Land. Wendy, John, dan Michael tidak pernah melupakan Peter Pan bahkan setelah mereka dewasa.  \n \n',
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
                        style: GoogleFonts.plusJakartaSans(
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
