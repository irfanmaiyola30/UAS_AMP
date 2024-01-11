import 'dart:math';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'insert.dart';
import 'update.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'realtime CRUD',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  DatabaseReference dbRef =
      FirebaseDatabase.instance.reference().child('Data_Santri');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.indigo[900],
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => ccreate(),
            ),
          );
        },
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      appBar: AppBar(
        title: Text(
          'Data Santri',
          style: TextStyle(
            color: Colors.white,
            fontSize: 30,
          ),
        ),
        backgroundColor: Colors.indigo[900],
      ),
      body: FirebaseAnimatedList(
        query: dbRef,
        itemBuilder: (context, snapshot, animation, index) {
          Map<dynamic, dynamic>? DataSantri = snapshot.value as Map?;
          if (DataSantri != null) {
            DataSantri['key'] = snapshot.key;
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => UpdateRecord(
                      Data_Santri_Key: DataSantri['key'],
                    ),
                  ),
                );
              },
              child: ListTile(
                shape: RoundedRectangleBorder(
                  side: BorderSide(
                    color: Colors.white,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                tileColor: _generateRandomColor(DataSantri['key']),
                trailing: IconButton(
                  icon: Icon(
                    Icons.delete,
                    color: Colors.red[900],
                  ),
                  onPressed: () {
                    dbRef.child(DataSantri['key']).remove();
                  },
                ),
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(
                    DataSantri['url'] ?? '', // Handling potential null
                  ),
                ),
                title: Text(
                  'Nama: ${DataSantri['nama'] ?? ''}',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Kelas: ${DataSantri['kelas'] ?? ''}',
                      style: TextStyle(
                        fontFamily: 'InterBold',
                        fontSize: 18,
                      ),
                    ),
                    Text(
                      'Tanggal Lahir: ${DataSantri['TanggalLahir'] ?? ''}',
                      style: TextStyle(
                        fontFamily: 'InterBold',
                        fontSize: 18,
                      ),
                    ),
                    Text(
                      'No HP: ${DataSantri['nohp'] ?? ''}',
                      style: TextStyle(
                        fontFamily: 'InterBold',
                        fontSize: 18,
                      ),
                    ),
                    Text(
                      'Alamat: ${DataSantri['alamat'] ?? ''}',
                      style: TextStyle(
                        fontFamily: 'InterBold',
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
              ),
            );
          } else {
            return Container();
          }
        },
      ),
    );
  }

  Color _generateRandomColor(String key) {
    final int seed = key.hashCode;
    final Random random = Random(seed);

    return Color.fromRGBO(
      random.nextInt(256),
      random.nextInt(256),
      random.nextInt(256),
      1.0,
    );
  }
}
