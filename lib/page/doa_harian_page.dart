import 'dart:convert';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:project/model/model_doaharian.dart';
import 'package:flutter/services.dart' as rootBundle;

class DoaHarian extends StatefulWidget {
  const DoaHarian({Key? key}) : super(key: key);

  @override
  _DoaHarianState createState() => _DoaHarianState();
}

class _DoaHarianState extends State<DoaHarian> {
  final AudioPlayer player = AudioPlayer();
  bool isPlaying = false;

  Future<List<ModelDoaHarian>> ReadJsonData() async {
    final jsondata =
        await rootBundle.rootBundle.loadString('assets/data/doaharian.json');
    final list = json.decode(jsondata) as List<dynamic>;
    return list.map((e) => ModelDoaHarian.fromJson(e)).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFAF8312),
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
                        color: Color(0xFF5B2C2C)),
                    height: 100,
                    width: MediaQuery.of(context).size.width,
                    child: Container(
                        margin: EdgeInsets.only(top: 20, left: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Doa Harian",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "Daftar Doa-Doa Harian",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        )),
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
            SizedBox(height: 10),
            Expanded(
              child: Container(
                child: FutureBuilder(
                  future: ReadJsonData(),
                  builder: (context, data) {
                    if (data.hasError) {
                      return Center(child: Text("${data.error}"),);
                    } else if (data.hasData) {
                      var items = data.data as List<ModelDoaHarian>;
                      return ListView.builder(
                          itemCount: items.length,
                          itemBuilder: (
                            context,
                            index,
                          ) {
                            return Card(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              elevation: 6,
                              margin: EdgeInsets.all(15),
                              child: Theme(
                                data: Theme.of(context)
                                    .copyWith(dividerColor: Colors.transparent),
                                child: ExpansionTile(
                                  title: Text(
                                    items[index].name.toString(),
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  children: [
                                    Container(
                                      padding: EdgeInsets.all(8),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Expanded(
                                            child: Container(
                                              padding:
                                                  EdgeInsets.only(bottom: 8),
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Padding(
                                                    padding: EdgeInsets.only(
                                                        left: 8, right: 8),
                                                    child: Text(
                                                      items[index]
                                                          .bismillah
                                                          .toString(),
                                                      style: TextStyle(
                                                          fontSize: 16,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding: EdgeInsets.only(
                                                        left: 8, right: 8),
                                                    child: Text(
                                                      items[index]
                                                          .arabic
                                                          .toString(),
                                                      style: TextStyle(
                                                          fontSize: 16,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding: EdgeInsets.only(
                                                        left: 8, right: 8),
                                                    child: Text(
                                                      items[index]
                                                          .latin
                                                          .toString(),
                                                      style: TextStyle(
                                                          fontSize: 14,
                                                          fontStyle:
                                                              FontStyle.italic),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding: EdgeInsets.only(
                                                        left: 8,
                                                        right: 8,
                                                        top: 5),
                                                    child: Text(
                                                      items[index]
                                                          .terjemahan
                                                          .toString(),
                                                      style: TextStyle(
                                                        fontSize: 12,
                                                      ),
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
                            );
                          });
                    } else {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    // Pastikan untuk memanggil dispose pada AudioPlayer saat widget dihapus
    player.dispose();
    super.dispose();
  }
}
