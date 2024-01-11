import 'package:flutter/material.dart';
import 'package:project/database/main.dart';
import 'package:project/page/ayat_kursi_page.dart';
import 'package:project/page/bacaan_sholat_page.dart';
import 'package:project/page/doa_harian_page.dart';
import 'package:project/page/niat_sholat_page.dart';
import 'package:project/page/surat_pendek_page.dart';
import 'package:project/page/hijaiyah.dart';

class DashboardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/dashboard/bg.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              title: const Text(
                'SinauNgaji',
                style: TextStyle(color: Colors.white, fontFamily: 'ConcertOne', fontWeight: FontWeight.bold, fontSize: 25,),
              ),
              backgroundColor: Color.fromARGB(255, 174, 57, 25),
              floating: true,
              pinned: false,
              titleSpacing: 20,
              expandedHeight: 0,
            ),
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  // Main Menu
                  GridView.count(
                    crossAxisCount: 2,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    children: [
                      buildDashboardItem(
                        imagePath: "assets/dashboard/NiatSholat.png",
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => NiatSholat()),
                          );
                        },
                        borderRadius: 20,
                      ),
                      buildDashboardItem(
                        imagePath: "assets/dashboard/3.png",
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => BacaanSholat()),
                          );
                        },
                        borderRadius: 20,
                      ),
                      buildDashboardItem(
                        imagePath: "assets/dashboard/4.png",
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => SuratPendek()),
                          );
                        },
                        borderRadius: 20,
                      ),
                      buildDashboardItem(
                        imagePath: "assets/dashboard/1.png",
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => AyatKursi()),
                          );
                        },
                        borderRadius: 20,
                      ),
                      buildDashboardItem(
                        imagePath: "assets/dashboard/2.png",
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => DoaHarian()),
                          );
                        },
                        borderRadius: 20,
                      ),
                      buildDashboardItem(
                        imagePath: "assets/dashboard/6.png",
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => MyApp()),
                          );
                        },
                        borderRadius: 20,
                      ),
                      buildDashboardItem(
                        imagePath: "assets/dashboard/5.png",
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Hijaiyah()),
                          );
                        },
                      ),
                      // Add more menu items as needed
                    ],
                  ),
                  // Divider or Padding for separation
                  Padding(
                    padding: EdgeInsets.zero,
                    child: Divider(
                      height: 0,
                      color: Colors.transparent,
                    ),
                  ),
                  // "Populer" Section
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    child: Text(
                      'Populer',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Container(
                    height: 170,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        buildDashboardItem(
                          imagePath: "assets/dashboard/besar_niat_sholat.png",
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => NiatSholat()),
                            );
                          },
                        ),
                        buildDashboardItem(
                          imagePath: "assets/dashboard/besar_bacaan_sholat.png",
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => BacaanSholat()),
                            );
                          },
                        ),
                        buildDashboardItem(
                          imagePath: "assets/dashboard/besar_surat_pendek.png",
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => SuratPendek()),
                            );
                          },
                        ),
                        buildDashboardItem(
                          imagePath: "assets/dashboard/besar_ayat_kursi.png",
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => AyatKursi()),
                            );
                          },
                        ),
                        buildDashboardItem(
                          imagePath: "assets/dashboard/besar_doa_harian.png",
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => DoaHarian()),
                            );
                          },
                        ),
                        buildDashboardItem(
                          imagePath: "assets/dashboard/Data_Santri1.png",
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => MyApp()),
                            );
                          },
                        ),
                        buildDashboardItem(
                          imagePath: "assets/dashboard/besar_huruf_hijaiyah.png",
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => Hijaiyah()),
                            );
                          },
                        ),
                        // Add more menu items as needed
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildDashboardItem({
    required String imagePath,
    required VoidCallback onTap,
    double width = 220,
    double height = 200,
    double borderRadius = 15,
  }) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 200,
        height: 120,
        margin: EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(borderRadius),
          boxShadow: [
            BoxShadow(
              color: Color(0x3F000000),
              blurRadius: 50,
              offset: Offset(0, 4),
              spreadRadius: 0,
            )
          ],
        ),
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: Center(
          child: Stack(
            fit: StackFit.expand,
            children: [
              Image.asset(
                imagePath,
                fit: BoxFit.cover,
              ),
              Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.black.withOpacity(0.3), Colors.transparent],
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
