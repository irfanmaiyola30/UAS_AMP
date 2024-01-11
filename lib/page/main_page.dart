import 'package:project/page/ayat_kursi_page.dart';
import 'package:project/page/bacaan_sholat_page.dart';
import 'package:project/page/doa_harian_page.dart';
import 'package:project/page/hijaiyah.dart';
import 'package:project/page/niat_sholat_page.dart';
import 'package:project/page/surat_pendek_page.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard'),
        actions: <Widget>[],
      ),
      body: GridView.count(
        crossAxisCount: 2,
        children: <Widget>[
          _buildDashboardItem(
              'Niat Sholat', 'assets/images/ic_niat.png', const NiatSholat()),
          _buildDashboardItem('Bacaan Sholat', 'assets/images/ic_doa.png',
              const BacaanSholat()),
          _buildDashboardItem(
              'Ayat Kursi', 'assets/images/ic_bacaan.png', const AyatKursi()),
          _buildDashboardItem('Surat Pendek', 'assets/images/ic_bacaan.png',
              const SuratPendek()),
          _buildDashboardItem(
              'Doa Harian', 'assets/images/ic_bacaan.png', const DoaHarian()),
          _buildDashboardItem('Huruf Hijaiyah', 'assets/images/ic_bacaan.png',
              const Hijaiyah()),
        ],
      ),
    );
  }

  Widget _buildDashboardItem(
      String title, String imagePath, Widget destination) {
    return Card(
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => destination),
          );
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(imagePath, height: 50.0, width: 50.0),
            SizedBox(height: 10.0),
            Text(title, style: TextStyle(fontSize: 20.0)),
          ],
        ),
      ),
    );
  }
}
