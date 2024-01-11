import 'dart:io';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'main.dart';

class ccreate extends StatefulWidget {
  @override
  State<ccreate> createState() => ccreateState();
}

class ccreateState extends State<ccreate> {
  TextEditingController nama = TextEditingController();
  TextEditingController kelas = TextEditingController();
  TextEditingController TanggalLahir = TextEditingController();
  TextEditingController nohp = TextEditingController();
  TextEditingController alamat = TextEditingController();
  File? file;
  ImagePicker image = ImagePicker();
  var url;
  DatabaseReference? dbRef;
  @override
  void initState() {
    super.initState();
    dbRef = FirebaseDatabase.instance.ref().child('Data_Santri');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Tabah Data',
          style: TextStyle(
            color: Colors.white,
            fontSize: 30,
          ),
        ),
        backgroundColor: Colors.indigo[900],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Container(
                  height: 200,
                  width: 200,
                  child: file == null
                      ? IconButton(
                          icon: Icon(
                            Icons.add_a_photo,
                            size: 90,
                            color: Color.fromARGB(255, 0, 0, 0),
                          ),
                          onPressed: () {
                            getImage();
                          },
                        )
                      : MaterialButton(
                          height: 100,
                          child: Image.file(
                            file!,
                            fit: BoxFit.fill,
                          ),
                          onPressed: () {
                            getImage();
                          },
                        )),
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: nama,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                hintText: 'Nama',
              ),
            ),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: kelas,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                hintText: 'Kelas',
              ),
              maxLength: 10,
            ),
            TextFormField(
              controller: TanggalLahir,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                hintText: 'Tanggal Lahir',
              ),
              maxLength: 20,
            ),TextFormField(
              controller: nohp,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                hintText: 'Nomor Hp',
              ),
              maxLength: 20,
            ),TextFormField(
              controller: alamat,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                hintText: 'Alamat',
              ),
              maxLength:200,
            ),
            SizedBox(
              height: 20,
            ),
            MaterialButton(
              height: 40,
              onPressed: () {
                // getImage();

                if (file != null) {
                  uploadFile();
                }
              },
              child: Text(
                "Tambah",
                style: TextStyle(
                  color: Color.fromARGB(255, 255, 255, 255),
                  fontSize: 20,
                ),
              ),
              color: Colors.indigo[900],
            ),
          ],
        ),
      ),
    );
  }

  getImage() async {
    var img = await image.pickImage(source: ImageSource.gallery);
    setState(() {
      file = File(img!.path);
    });

    // print(file);
  }

  uploadFile() async {
    try {
      var imagefile = FirebaseStorage.instance
          .ref()
          .child("contact_photo")
          .child("/${nama.text}.jpg");
      UploadTask task = imagefile.putFile(file!);
      TaskSnapshot snapshot = await task;
      url = await snapshot.ref.getDownloadURL();
      setState(() {
        url = url;
      });
      if (url != null) {
        Map<String, String> Data_Santri = {
          'nama': nama.text,
          'kelas': kelas.text,
          'TanggalLahir': TanggalLahir.text,
          'nohp': nohp.text,
          'alamat':alamat.text,
          'url': url,
        };

        dbRef!.push().set(Data_Santri).whenComplete(() {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (_) => Home(),
            ),
          );
        });
      }
    } on Exception catch (e) {
      print(e);
    }
  }
}
