import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class IlanEkle extends StatefulWidget {
  @override
  _IlanEkleState createState() => _IlanEkleState();
}

class _IlanEkleState extends State<IlanEkle> {
  final _formKey = GlobalKey<FormState>();
  final picker = ImagePicker();
  String? _uploadedImageUrl1;
  String? _uploadedImageUrl2;

  String adSoyad = '';
  String kampanyaTuru = 'SMA';
  String tamamlanmaOrani = '';
  String bankaAdi = '';
  String iban = '';
  String alici = '';
  String aciklama = '';
  String ekDetaylar = '';

  Future<void> _uploadImage(int imageNumber) async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      File file = File(pickedFile.path);
      try {
        UploadTask uploadTask = FirebaseStorage.instance
            .ref('uploads/${DateTime.now().toIso8601String()}.png')
            .putFile(file);
        TaskSnapshot taskSnapshot = await uploadTask.whenComplete(() => {});
        String downloadUrl = await taskSnapshot.ref.getDownloadURL();

        setState(() {
          if (imageNumber == 1) {
            _uploadedImageUrl1 = downloadUrl;
          } else if (imageNumber == 2) {
            _uploadedImageUrl2 = downloadUrl;
          }
        });
      } catch (e) {
        print(e);
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("Görsel yüklenirken bir hata oluştu.")));
      }
    }
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      CollectionReference bekleyenler =
          FirebaseFirestore.instance.collection('bekleyenler');

      bekleyenler.add({
        'aciklama1': adSoyad,
        'kampanyaTuru': kampanyaTuru,
        'bagis': tamamlanmaOrani,
        'banka2': bankaAdi,
        'iban': iban,
        'alici': alici,
        'aciklamasi': aciklama,
        'detayaciklama': ekDetaylar,
        'image': _uploadedImageUrl1,
        'ylink': _uploadedImageUrl2,
      }).then((_) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text("İlan başarıyla eklendi.")));
      }).catchError((error) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text("Bir hata oluştu: $error")));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Yeni İlan ekle",
            style:
                GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.w800)),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 25, left: 16, right: 16),
        child: Form(
          key: _formKey, 
          child: ListView( 
            children: [ Row(children: <Widget>[
                  Expanded(
                    child: Divider(
                      color: Colors.blue.shade100,
                      thickness: 0.5,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Text("Kişisel Bilgiler",
                        style: TextStyle(
                            fontSize: 12, color: Colors.blue.shade100)),
                  ),
                  Expanded(
                    child: Divider(
                      color: Colors.blue.shade100,
                      thickness: 0.5,
                    ),
                  ),
                ]), 
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: TextFormField(
                  decoration: InputDecoration(labelText: 'Ad Soyad', labelStyle: TextStyle(color: Colors.blue.shade800, fontSize: 12,fontWeight: FontWeight.w400) ,filled: true, fillColor: Colors.white,  
                   ),
                  onChanged: (value) {
                    adSoyad = value;
                  },
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Ad soyad alanı boş olamaz';
                    }
                    return null;
                  },
                ),
              ),
              DropdownButtonFormField(
                value: kampanyaTuru,
                items: ['SMA'].map((String category) {
                  return DropdownMenuItem(
                      value: category, child: Text(category));
                }).toList(),
                onChanged: (newValue) {
                  setState(() {
                    kampanyaTuru = newValue as String;
                  });
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Tamamlanma Oranı (%)'),
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  tamamlanmaOrani = value;
                },
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Lütfen bir oran girin';
                  }
                  if (int.tryParse(value) == null ||
                      int.parse(value) < 0 ||
                      int.parse(value) > 100) {
                    return 'Lütfen 0 ile 100 arasında bir değer girin';
                  }
                  return null;
                },
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: IconButton(
                    onPressed: () => _uploadImage(1),
                    icon: Icon(
                      Icons.add_a_photo,
                      color: Colors.white,
                      size: 30,
                    )),
              ),
              Text("Kampanya Görseli Yükle",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold)),
              Padding(
                padding: const EdgeInsets.only(bottom: 20, top: 5),
                child: Text(
                  "Kampanya kimin için yapılıyorsa o kişinin görselini yükleyiniz. Kendi resminizi ya da reklam afişinizi yüklemeyiniz.",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white70),
                ),
              ),                      Divider(thickness: 1,),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: IconButton(
                    onPressed: () => _uploadImage(2),
                    icon: Icon(
                      Icons.add_a_photo,
                      color: Colors.white,
                      size: 30,
                    )),
              ), 
              Text("İzin Belgesi Yükle",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold)),

              Padding(
                padding: const EdgeInsets.only(bottom: 20, top: 5),
                child: Text(
                  "Valilik onay belgesini yanlızca görsel olarak yükleyiniz. PDF ya da diğer formatlar kabul edilememektedir.",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white70),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 22, bottom: 15),
                child: ElevatedButton(
                  onPressed: _submitForm,
                  child: Text("İlanı Gönder", style: TextStyle(fontWeight: FontWeight.w700,
                              color: Colors.blue.shade600,),), style: ButtonStyle(backgroundColor: MaterialStatePropertyAll(
                                  Color.fromARGB(255, 255, 255, 255))),),
              ), 
              
            ],
          ),
        ),
      ),
    );
  }
}
