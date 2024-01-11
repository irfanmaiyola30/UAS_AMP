import 'dart:io';

import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'main.dart';

class UpdateRecord extends StatefulWidget {
  String Data_Santri_Key;
  UpdateRecord({required this.Data_Santri_Key});

  @override
  State<UpdateRecord> createState() => _UpdateRecordState();
}

class _UpdateRecordState extends State<UpdateRecord> {
  TextEditingController contactNama = TextEditingController();
  TextEditingController contactKelas = TextEditingController();
  TextEditingController contactTanggalLahir = TextEditingController();
  TextEditingController contactNohp = TextEditingController();
  TextEditingController contactAlamat = TextEditingController();

  var url;
  File? file;
  ImagePicker image = ImagePicker();
  DatabaseReference? db_Ref;

  @override
  void initState() {
    super.initState();
    db_Ref = FirebaseDatabase.instance.ref().child('Data_Santri');
    Contactt_data();
  }

  void Contactt_data() async {
    DataSnapshot snapshot = await db_Ref!.child(widget.Data_Santri_Key).get();

    Map? Data_Santri = snapshot.value as Map?;

    if (Data_Santri != null) {
      setState(() {
        contactNama.text = Data_Santri['nama'] ?? '';
        contactKelas.text = Data_Santri['kelas'] ?? '';
        contactTanggalLahir.text = Data_Santri['TanggalLahir'] ?? '';
        contactNohp.text = Data_Santri['NoHp'] ?? '';
        contactAlamat.text = Data_Santri['Alamat'] ?? '';
        url = Data_Santri['url'];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ubah Data'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Container(
                height: 200,
                width: 200,
                child: url == null
                    ? MaterialButton(
                        height: 100,
                        child: Image.file(
                          file!,
                          fit: BoxFit.fill,
                        ),
                        onPressed: () {
                          getImage();
                        },
                      )
                    : MaterialButton(
                        height: 100,
                        child: CircleAvatar(
                          maxRadius: 100,
                          backgroundImage: NetworkImage(
                            url,
                          ),
                        ),
                        onPressed: () {
                          getImage();
                        },
                      ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: contactNama,
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
              controller: contactKelas,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                hintText: 'Kelas',
              ),
              maxLength: 20,
            ),
            TextFormField(
              controller: contactTanggalLahir,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                hintText: 'Tanggal Lahir',
              ),
              maxLength: 20,
            ),
            TextFormField(
              controller: contactNohp,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                hintText: 'No Hp',
              ),
              maxLength: 20,
            ),
            TextFormField(
              controller: contactAlamat,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                hintText: 'Alamat',
              ),
              maxLength: 50,
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
                } else {
                  directupdate();
                }
              },
              child: Text(
                "Update",
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
      url = null;
      file = File(img!.path);
    });

    // print(file);
  }

  uploadFile() async {
    try {
      var imagefile = FirebaseStorage.instance
          .ref()
          .child("contact_photo")
          .child("/${contactNama.text}.jpg");
      UploadTask task = imagefile.putFile(file!);
      TaskSnapshot snapshot = await task;
      var url1 = await snapshot.ref.getDownloadURL();
      setState(() {
        url1 = url1;
      });
      if (url1 != null) {
        Map<String, String> Data_Santri = {
          'nama': contactNama.text,
          'kelas': contactKelas.text,
          'TanggalLahir': contactTanggalLahir.text,
          'NoHp': contactNohp.text,
          'Alamat': contactAlamat.text,
          'url': url1,
        };

        db_Ref!
            .child(widget.Data_Santri_Key)
            .update(Data_Santri)
            .whenComplete(() {
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

  directupdate() {
    if (url != null) {
      Map<String, String> Data_Santri = {
        'nama': contactNama.text,
        'kelas': contactKelas.text,
        'TanggalLahir': contactTanggalLahir.text,
        'NoHp': contactNohp.text,
        'Alamat': contactAlamat.text,
        'url': url,
      };

      db_Ref!
          .child(widget.Data_Santri_Key)
          .update(Data_Santri)
          .whenComplete(() {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (_) => Home(),
          ),
        );
      });
    }
  }
}
