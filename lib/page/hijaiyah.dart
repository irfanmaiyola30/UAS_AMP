import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

class Hijaiyah extends StatefulWidget {
  const Hijaiyah({Key? key}) : super(key: key);

  @override
  _HijaiyahPageState createState() => _HijaiyahPageState();
}

class _HijaiyahPageState extends State<Hijaiyah> {
  final List<DashboardItem> items = [
    DashboardItem(
      title: 'Tsa',
      imagePath: 'assets/images/tsa.png',
      audioAsset: 'assets/audio/fatah_tsaa.mp3',
    ),
    DashboardItem(
      title: 'Ta',
      imagePath: 'assets/images/ta.png',
      audioAsset: 'assets/audio/fatah_taa.mp3',
    ),
    DashboardItem(
      title: 'Ba',
      imagePath: 'assets/images/b.png',
      audioAsset: 'assets/audio/fatah_baa.mp3',
    ),
    DashboardItem(
      title: 'Aaa',
      imagePath: 'assets/images/a.png',
      audioAsset: 'assets/audio/fatah_alif.mp3',
    ),
    DashboardItem(
      title: 'Da',
      imagePath: 'assets/images/da.png',
      audioAsset: 'assets/audio/fatah_daa.mp3',
    ),
    DashboardItem(
      title: 'Kho',
      imagePath: 'assets/images/kho.png',
      audioAsset: 'assets/audio/fatah_khoa.mp3',
    ),
    DashboardItem(
      title: 'Ha',
      imagePath: 'assets/images/kha.png',
      audioAsset: 'assets/audio/fatah_haa.mp3',
    ),
    DashboardItem(
      title: 'Ja',
      imagePath: 'assets/images/jim.png',
      audioAsset: 'assets/audio/fatah_jaa.mp3',
    ),
    // Add more items as needed
    DashboardItem(
      title: 'Saa',
      imagePath: 'assets/images/saa.png',
      audioAsset: 'assets/audio/fatah_saa.mp3',
    ),
    DashboardItem(
      title: 'Za',
      imagePath: 'assets/images/za.png',
      audioAsset: 'assets/audio/fatah_zaa.mp3',
    ),
    DashboardItem(
      title: 'Ro',
      imagePath: 'assets/images/ro.png',
      audioAsset: 'assets/audio/fatah_roa.mp3',
    ),
    DashboardItem(
      title: 'Dza',
      imagePath: 'assets/images/dza.png',
      audioAsset: 'assets/audio/fatah_dzaa.mp3',
    ),
    DashboardItem(
      title: 'Tho',
      imagePath: 'assets/images/to.png',
      audioAsset: 'assets/audio/fatah_thoa.mp3',
    ),
    DashboardItem(
      title: 'Dho',
      imagePath: 'assets/images/dho.png',
      audioAsset: 'assets/audio/fatah_dhoa.mp3',
    ),
    DashboardItem(
      title: 'Sho',
      imagePath: 'assets/images/sho.png',
      audioAsset: 'assets/audio/fatah_shoa.mp3',
    ),
    DashboardItem(
      title: 'Sya',
      imagePath: 'assets/images/sya.png',
      audioAsset: 'assets/audio/fatah_syaa.mp3',
    ),
    // Add more items as needed
    DashboardItem(
      title: 'Faa',
      imagePath: 'assets/images/fa.png',
      audioAsset: 'assets/audio/fatah_faa.mp3',
    ),
    DashboardItem(
      title: 'Ghoo',
      imagePath: 'assets/images/gho.png',
      audioAsset: 'assets/audio/fatah_ghoa.mp3',
    ),
    DashboardItem(
      title: '`Äaa',
      imagePath: 'assets/images/Aaa.png',
      audioAsset: 'assets/audio/fatah_ainaa.mp3',
    ),
    DashboardItem(
      title: 'Dzo',
      imagePath: 'assets/images/dzo.png',
      audioAsset: 'assets/audio/fatah_dzoa.mp3',
    ),
    // Add more items as needed
    DashboardItem(
      title: 'Maa',
      imagePath: 'assets/images/ma.png',
      audioAsset: 'assets/audio/fatah_maa.mp3',
    ),
    DashboardItem(
      title: 'Laa',
      imagePath: 'assets/images/la.png',
      audioAsset: 'assets/audio/fatah_laa.mp3',
    ),
    DashboardItem(
      title: 'Kaa',
      imagePath: 'assets/images/ka.png',
      audioAsset: 'assets/audio/fatah_kaa.mp3',
    ),
    DashboardItem(
      title: 'Qoo',
      imagePath: 'assets/images/qo.png',
      audioAsset: 'assets/audio/fatah_qoa.mp3',
    ),
    DashboardItem(
      title: 'Yaa',
      imagePath: 'assets/images/ya.png',
      audioAsset: 'assets/audio/fatah_yaa.mp3',
    ),

    DashboardItem(
      title: 'Haa',
      imagePath: 'assets/images/ha.png',
      audioAsset: 'assets/audio/fatah_ahaa.mp3',
    ),
    DashboardItem(
      title: 'Waa',
      imagePath: 'assets/images/wa.png',
      audioAsset: 'assets/audio/fatah_waa.mp3',
    ),
    DashboardItem(
      title: 'Naa',
      imagePath: 'assets/images/na.png',
      audioAsset: 'assets/audio/fatah_naa.mp3',
    ),
    // Add more items as needed

    // Add more items as needed
    // Add more items as needed
    // Add more items as needed
    // Add more items as needed
  ];

  final player = AudioPlayer();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 15, 145, 143),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: IconButton(
                    onPressed: () => Navigator.of(context).pop(),
                    icon: Icon(Icons.arrow_back, color: Colors.white),
                  ),
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Container(
                    margin: EdgeInsets.only(top: 80),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Color(0xFF1C1838),
                    ),
                    height: 100,
                    width: MediaQuery.of(context).size.width,
                    child: Container(
                      margin: EdgeInsets.only(top: 20, left: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Huruf Hijaiyah",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            "",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: ClipRRect(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30),
                    ),
                    child: Image.asset(
                      "assets/images/bg_dua.png",
                      width: 200,
                      height: 100,
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                ),
              ],
            ),
            Expanded(
              child: GridView.count(
                crossAxisCount: 4, // Adjust as needed
                children: items.map((item) {
                  return _buildDashboardItem(item);
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDashboardItem(DashboardItem item) {
    return Card(
      child: InkWell(
        onTap: () async {
          // Play audio when tapped
          await playAudio(item);
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(item.imagePath, height: 50.0, width: 90.0),
            SizedBox(height: 10.0),
            Text(item.title, style: TextStyle(fontSize: 10.0)),
          ],
        ),
      ),
    );
  }

  // Function to play audio
  Future<void> playAudio(DashboardItem item) async {
    try {
      if (item.audioAsset != null) {
        await player.setAsset(item.audioAsset!);
      } else if (item.audioUrl != null) {
        await player.setUrl(item.audioUrl!);
      }
      player.play();
    } catch (e) {
      // catch load errors: 404, invalid url ...
      print("An error occurred $e");
    }
  }

  @override
  void dispose() {
    player.dispose();
    super.dispose();
  }
}

class DashboardItem {
  final String title;
  final String imagePath;
  final String? audioAsset;
  final String? audioUrl;

  DashboardItem({
    required this.title,
    required this.imagePath,
    this.audioAsset,
    this.audioUrl,
  });
}
