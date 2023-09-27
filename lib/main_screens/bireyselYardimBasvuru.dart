import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:flutter/gestures.dart';
import 'package:saranel_application/main_screens/anasayfa.dart';
import 'package:saranel_application/settings_screens/acikriza.dart';
import 'package:saranel_application/settings_screens/gizlilik.dart';
import 'package:saranel_application/settings_screens/kosullar.dart';

class bireyselbasvuruekle extends StatefulWidget {
  @override
  _bireyselbasvuruekleState createState() => _bireyselbasvuruekleState();
}

class _bireyselbasvuruekleState extends State<bireyselbasvuruekle> {
  final _formKey = GlobalKey<FormState>();
  final picker = ImagePicker();
  String? _uploadedImageUrl1;
  bool isImage1Uploaded = false;
  bool isAgreed = false;
  String adsoyad = '';
  String aciklama = ''; /* 
  String il = ''; */
  String iletisimadres = '';
  String banka = '';
  String iban = '';
  String alici = '';
  String ibanaciklama = '';
  String tamamlanmaorani = '';
  String yetkiliadsoyad = '';

  Future<void> _uploadImage(int imageNumber) async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      File file = File(pickedFile.path);
      String fileName = DateTime.now().toIso8601String();

      try {
        UploadTask uploadTask =
            FirebaseStorage.instance.ref('uploads/$fileName.png').putFile(file);
        TaskSnapshot taskSnapshot = await uploadTask.whenComplete(() => {});
        String downloadUrl = await taskSnapshot.ref.getDownloadURL();

        setState(() {
          if (imageNumber == 1) {
            _uploadedImageUrl1 = downloadUrl;
            isImage1Uploaded = true; // görsel yüklendiyse durum true
          }
        });
      } catch (e) {
        print(e);
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("Görsel yüklenirken bir hata oluştu.")));
      }
    }
  }

  Map<String, TextEditingController> controllers = {
    'adsoyad': TextEditingController(),
    'aciklama': TextEditingController(),
    /* 
    'il': TextEditingController(), */
    'iletisimadres': TextEditingController(),
    'banka': TextEditingController(),
    'tamamlanmaorani': TextEditingController(),
    'iban': TextEditingController(),
    'alici': TextEditingController(),
    'ibanaciklama': TextEditingController(),
    'yetkiliadsoyad': TextEditingController(),
  };

  @override
  void initState() {
    super.initState();
    controllers['adsoyad']?.text = adsoyad;
    controllers['aciklama']?.text =
        aciklama; /* 
    controllers['il']?.text = il; */
    controllers['iletisimadres']?.text = iletisimadres;
    controllers['tamamlanmaorani']?.text = tamamlanmaorani;
    controllers['banka']?.text = banka;
    controllers['iban']?.text = iban;
    controllers['alici']?.text = alici;
    controllers['ibanaciklama']?.text = ibanaciklama;
    controllers['yetkiliadsoyad']?.text = yetkiliadsoyad;
  }

  @override
  void dispose() {
    controllers.forEach((key, controller) => controller.dispose());
    super.dispose();
  }

  void _submitForm() {
    if (_formKey.currentState!.validate() && isAgreed) {
      if (_uploadedImageUrl1 == null) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Lütfen tüm görsel alanlarını doldurunuz.')),
        );
        return;
      }

      CollectionReference bekleyenleryt =
          FirebaseFirestore.instance.collection('bekleyenyt');

      var now = DateTime.now();
      var formatter = DateFormat('dd.MM.yyyy HH:mm');
      String formattedDate = formatter.format(now);

      bekleyenleryt.add({
        'adsoyad': adsoyad,
        'aciklama': aciklama,
        /* 
        'il': il, */
        'iletisimadres': iletisimadres,
        'banka': banka,
        'iban': iban,
        'alici': alici,
        'tamamlanmaorani': tamamlanmaorani,
        'yetkiliadsoyad': yetkiliadsoyad,
        'ibanaciklama': ibanaciklama,
        'image': _uploadedImageUrl1,
        'eklenme_tarihi': formattedDate,
      }).then((_) {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              backgroundColor: Colors.blue.shade800,
              title: Text('Yardım Talebiniz İncelemeye Alındı!',
                  style: TextStyle(color: Colors.white)),
              content: Text(
                'Verdiğiniz bilgiler 24 saat içinde incelenip onaylanır. Herhangi bir eksik ya da hata tespit edilmesi durumunda ilanınızın onaylanmayacağını unutmayınız.',
                style: TextStyle(color: Colors.white),
              ),
              actions: [
                TextButton(
                  child: Text('Kapat', style: TextStyle(color: Colors.white)),
                  onPressed: () {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (context) => AnaSayfa(),
                    ));
                  },
                ),
              ],
            );
          },
        );
      }).catchError((error) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Bir hata oluştu: $error')),
        );
      });
    } else {
      // form eksikse hata mesajı gösteriliyor
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
            content: Text(
                'Lütfen eksik ya da kabul edilmeyen alanları tamamlayın.')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: false,
      appBar: AppBar(
        title: Text("Yardım Kampanyası Ekle",
            style:
                GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.w800)),
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back_ios_sharp,
              color: Colors.blue.shade800,
              size: 19,
            )),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 30, left: 16, right: 16),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(children: <Widget>[
                  Expanded(
                    child: Divider(
                      color: Colors.blue.shade100,
                      thickness: 0.5,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Text("Kampanya Bilgileri",
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
                    keyboardType: TextInputType.text,
                    controller: controllers['adsoyad'],
                    decoration: InputDecoration(
                      labelText: 'Kampanya Başlığı',
                      labelStyle: TextStyle(
                        color: Colors.blue.shade800,
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                      ),
                      filled: true,
                      fillColor: Colors.white,
                    ),
                    onChanged: (value) {
                      adsoyad = value;
                    },
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Ad soyad alanı boş olamaz';
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: TextFormField(
                    controller: controllers['aciklama'],
                    decoration: InputDecoration(
                      contentPadding:
                          EdgeInsets.only(top: 10, left: 10, bottom: 50),
                      labelText: 'Açıklama',
                      labelStyle: TextStyle(
                        color: Colors.blue.shade800,
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                      ),
                      filled: true,
                      fillColor: Colors.white,
                    ),
                    onChanged: (value) {
                      aciklama = value;
                    },
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Açıklama alanı boş olamaz';
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    controller: controllers['kampanyaorani'],
                    decoration: InputDecoration(
                      labelText: 'Kampanya Tamamlanma Oranı (%)',
                      labelStyle: TextStyle(
                        color: Colors.blue.shade800,
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                      ),
                      filled: true,
                      fillColor: Colors.white,
                    ),
                    onChanged: (value) {
                      tamamlanmaorani = value;
                    },
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Kampanya Tamamlanma Oranı alanı boş olamaz';
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Row(children: <Widget>[
                  Expanded(
                    child: Divider(
                      color: Colors.blue.shade100,
                      thickness: 0.5,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Text("Banka Bilgileri",
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

                /* 
                Padding(
                  padding: const EdgeInsets.only(top: 20, bottom: 20),
                  child: TextFormField(
                    controller: controllers['il'],
                    keyboardType: TextInputType.name, // mail için klavye tipi
                    decoration: InputDecoration(
                      labelText: 'İl/ İlçe',
                      labelStyle: TextStyle(
                        color: Colors.blue.shade800,
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                      ),
                      filled: true,
                      fillColor: Colors.white,
                    ),
                    onChanged: (value) {
                      il = value;
                    },
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'İl alanı boş olamaz';
                      }
                      return null;
                    },
                  ),
                ), */
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: TextFormField(
                    controller: controllers['banka'],
                    decoration: InputDecoration(
                      labelText: 'Banka İsmi',
                      labelStyle: TextStyle(
                        color: Colors.blue.shade800,
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                      ),
                      filled: true,
                      fillColor: Colors.white,
                    ),
                    onChanged: (value) {
                      banka = value;
                    },
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Banka İsmi alanı boş olamaz';
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: TextFormField(
                    controller: controllers['iban'],
                    decoration: InputDecoration(
                      labelText: 'İban Bilgisi',
                      labelStyle: TextStyle(
                        color: Colors.blue.shade800,
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                      ),
                      filled: true,
                      fillColor: Colors.white,
                    ),
                    onChanged: (value) {
                      iban = value;
                    },
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'İban Bilgisi alanı boş olamaz';
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: TextFormField(
                    controller: controllers['alici'],
                    decoration: InputDecoration(
                      labelText: 'Alıcı Bilgisi',
                      labelStyle: TextStyle(
                        color: Colors.blue.shade800,
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                      ),
                      filled: true,
                      fillColor: Colors.white,
                    ),
                    onChanged: (value) {
                      alici = value;
                    },
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Alıcı Bilgisi alanı boş olamaz';
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: TextFormField(
                    controller: controllers['ibanaciklama'],
                    decoration: InputDecoration(
                      labelText: 'İbana Gönderim açıklaması',
                      labelStyle: TextStyle(
                        color: Colors.blue.shade800,
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                      ),
                      filled: true,
                      fillColor: Colors.white,
                    ),
                    onChanged: (value) {
                      ibanaciklama = value;
                    },
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'İbana Gönderim açıklaması alanı boş olamaz';
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Row(children: <Widget>[
                  Expanded(
                    child: Divider(
                      color: Colors.blue.shade100,
                      thickness: 0.5,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Text("Yetkili İletişim Bilgileri",
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
                    controller: controllers['iletisimadres'],
                    cursorColor: Colors.blue.shade800,
                    decoration: InputDecoration(
                      labelText: 'İletişim tercihi (Mail/ Telefon)',
                      labelStyle: TextStyle(
                          color: Colors.blue.shade800,
                          fontSize: 12,
                          fontWeight: FontWeight.w400),
                      filled: true,
                      fillColor: Colors.white,
                    ),
                    onChanged: (value) {
                      iletisimadres = value;
                    },
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'İletişim alanı boş olamaz';
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: TextFormField(
                    controller: controllers['yetkiliadsoyad'],
                    cursorColor: Colors.blue.shade800,
                    decoration: InputDecoration(
                      labelText: 'Yetkili Ad Soyad',
                      labelStyle: TextStyle(
                          color: Colors.blue.shade800,
                          fontSize: 12,
                          fontWeight: FontWeight.w400),
                      filled: true,
                      fillColor: Colors.white,
                    ),
                    onChanged: (value) {
                      yetkiliadsoyad = value;
                    },
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Yetkili İsim Soyisim alanı boş olamaz';
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Row(children: <Widget>[
                  Expanded(
                    child: Divider(
                      color: Colors.blue.shade100,
                      thickness: 0.5,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Text("Kampanya Onay Belgesi",
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
                  child: InkWell(
                    onTap: () => _uploadImage(1),
                    child: Column(
                      children: [
                        Icon(
                          Icons.add_a_photo,
                          color: Colors.white,
                          size: 30,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Text(
                            "Kampanya Onay Belgesi Yükle",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 20, top: 10),
                          child: Text(
                            "Kampanya onay belgesini yanlızca görsel olarak, Faaliyet No (xx-xxxx) ve iban bilgileri gibi tüm alanların görüntüleneceği şekilde yükleyiniz.",
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.white70),
                          ),
                        ),
                        if (isImage1Uploaded)
                          Icon(
                            Icons.check_circle,
                            color: Colors.green,
                            size: 24,
                          )
                      ],
                    ),
                  ),
                ),
                Divider(
                  thickness: 0.5,
                  color: Colors.blue.shade100,
                ),
                Row(
                  children: [
                    Checkbox(
                      activeColor: Colors.amber,
                      checkColor: Colors.white,
                      fillColor: MaterialStateProperty.resolveWith<Color>(
                          (Set<MaterialState> states) {
                        if (states.contains(MaterialState.selected)) {
                          return Colors.amber;
                        }
                        return Colors.white;
                      }),
                      value: isAgreed,
                      onChanged: (newValue) {
                        setState(() {
                          isAgreed = newValue!;
                        });
                      },
                      shape: RoundedRectangleBorder(
                        side: BorderSide(
                            color: const Color.fromARGB(255, 245, 128, 128),
                            width: 0),
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                    Expanded(
                      child: RichText(
                        text: TextSpan(
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.white,
                          ),
                          children: [
                            TextSpan(
                              text: "İlan vermek için ",
                            ),
                            TextSpan(
                              text: "Açık Rıza Sözleşmesi",
                              style: TextStyle(
                                decoration: TextDecoration.underline,
                              ),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Acikriza()));
                                },
                            ),
                            TextSpan(
                              text: ", ",
                            ),
                            TextSpan(
                              text: "Gizlilik Sözleşmesi",
                              style: TextStyle(
                                decoration: TextDecoration.underline,
                              ),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Gizlilik()));
                                },
                            ),
                            TextSpan(
                              text: " ve ",
                            ),
                            TextSpan(
                              text: "Kullanım Koşulları",
                              style: TextStyle(
                                decoration: TextDecoration.underline,
                              ),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Kosullar()));
                                },
                            ),
                            TextSpan(
                              text:
                                  " sözleşmelerini kabul ettiğimi onaylıyorum",
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 22, bottom: 15),
                  child: ElevatedButton(
                    onPressed: _submitForm,
                    child: Text(
                      "İlanı Onaya Gönder",
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        color: Colors.blue.shade600,
                      ),
                    ),
                    style: ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(
                        Color.fromARGB(255, 255, 255, 255),
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
