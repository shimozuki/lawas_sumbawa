// ignore_for_file: must_be_immutable, unnecessary_null_comparison
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:lawas_sumbawa/controller/detail_controller.dart';
import 'package:lawas_sumbawa/model/detail_model.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailsPage extends StatefulWidget {
  final int itemId;
  const DetailsPage(this.itemId, {Key? key}) : super(key: key);

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  final AssetsAudioPlayer audioPlayer = AssetsAudioPlayer();
  late DetaillawasModel detailData;
  late String link = '';
  late String modifiedTitle = '';
  late String indo = '';

  @override
  void initState() {
    super.initState();

    detailData = DetaillawasModel(
      id: 0,
      mainTitle: '',
      lirikIndo: '',
      linkYoutube: '',
      lirikSwq: '',
      image: '',
      audio: '',
      hitCount: 0,
    );

    fetchData();
  }

  @override
  void dispose() {
    audioPlayer.dispose();
    super.dispose();
  }

  Future<void> fetchData() async {
    final DetailController detailController = DetailController();
    final int itemId = widget.itemId;

    try {
      final DetaillawasModel data =
          await detailController.fetchDataById(itemId);
      setState(() {
        detailData = data;
        link = detailData.linkYoutube;
        modifiedTitle =
            detailData.lirikSwq.replaceAll('.', '\n').replaceAll('..', '\n\n');
        indo =
            detailData.lirikIndo.replaceAll('.', '\n').replaceAll('..', '\n\n');
      });

      if (detailData.audio.isNotEmpty) {
        audioPlayer.open(
          Audio.network(
              'https://lombokfuntransport.com/lawas_backoffice/${detailData.audio}'),
          autoStart: false,
          showNotification: true,
        );
        print('datanya : ${detailData.mainTitle}');
        audioPlayer.play();
      }
    } catch (error) {
      print('Error fetching data: $error');
    }
  }

  // Fungsi untuk memainkan atau menghentikan audio
  void toggleAudio() {
    if (audioPlayer.isPlaying.value) {
      audioPlayer.pause();
    } else {
      audioPlayer.play();
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
        length: 2,
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
                    ? Icons.pause_circle
                    : Icons.play_circle),
                onPressed: () {
                  setState(() {
                    toggleAudio();
                  });
                },
              ),
            ],
            bottom: TabBar(
              indicator: UnderlineTabIndicator(
                borderSide: BorderSide(color: Color(0xFF9CCC65), width: 2.5),
                insets: EdgeInsets.fromLTRB(0.0, 00.0, 30.0, 0.0),
              ),
              unselectedLabelStyle: TextStyle(color: Colors.grey[500]),
              unselectedLabelColor: Colors.grey[500],
              labelColor: Color(0xFF9CCC65),
              labelStyle: TextStyle(
                  fontWeight: FontWeight.bold, color: Color(0xFF9CCC65)),
              labelPadding: EdgeInsets.only(
                  left: 0, right: MediaQuery.of(context).size.width * 0.1),
              tabs: [
                Tab(
                  text: 'Bahas Sumbawa',
                ),
                Tab(
                  text: 'Bahas Indonesia',
                ),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              SingleChildScrollView(
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
                          '${detailData.mainTitle}',
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
                              child: YoutubePlayer(
                                controller: YoutubePlayerController(
                                  initialVideoId: link,
                                  flags: YoutubePlayerFlags(
                                    autoPlay: false,
                                    mute: false,
                                  ),
                                ),
                                showVideoProgressIndicator: true,
                                progressIndicatorColor: Color(0xFF9CCC65),
                                progressColors: ProgressBarColors(
                                  playedColor: Color(0xFF9CCC65),
                                  handleColor: Color(0xFF9CCC65),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(0, 0, 0, 46),
                        width: double.infinity,
                        height: MediaQuery.of(context).size.height * 1.0,
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
                                text: '${modifiedTitle}',
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
              SingleChildScrollView(
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
                          '${detailData.mainTitle}',
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
                              child: YoutubePlayer(
                                controller: YoutubePlayerController(
                                  initialVideoId: link,
                                  flags: YoutubePlayerFlags(
                                    autoPlay: false,
                                    mute: false,
                                  ),
                                ),
                                showVideoProgressIndicator: true,
                                progressIndicatorColor: Color(0xFF9CCC65),
                                progressColors: ProgressBarColors(
                                  playedColor: Color(0xFF9CCC65),
                                  handleColor: Color(0xFF9CCC65),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(0, 0, 0, 46),
                        width: double.infinity,
                        height: MediaQuery.of(context).size.height * 1.0,
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
                                text: '${indo}',
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
            ],
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
                      Clipboard.setData(ClipboardData(
                          text:
                              'lirik sumbawa : ${modifiedTitle}, \n\n lirik indo : ${indo}'));
                      // ScaffoldMessenger.of(context).showSnackBar(
                      //   SnackBar(
                      //     content: Text('Data disalin ke clipboard'),
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
                        Icons.copy,
                        color: Color(0xFF9CCC65),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  InkWell(
                    onTap: () {
                      // URL video YouTube yang ingin dibuka
                      String youtubeVideoUrl =
                          "https://www.youtube.com/watch?v=${link}";

                      // Mengecek apakah URL bisa dibuka
                      canLaunch(youtubeVideoUrl).then((canOpen) {
                        if (canOpen) {
                          // Membuka URL di aplikasi YouTube
                          launch(youtubeVideoUrl);
                        } else {
                          // Menampilkan pesan jika tidak dapat membuka URL
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content:
                                  Text('Tidak dapat membuka video YouTube.'),
                            ),
                          );
                        }
                      });
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
      ),
    );
  }
}
