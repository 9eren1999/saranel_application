import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_fonts/google_fonts.dart';
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
bool isAgreed = false;
  String adsoyad = '';
  String aciklama = '';
  String il = '';
  String iletisimadres = '';

  Map<String, TextEditingController> controllers = {
    'adsoyad': TextEditingController(),
    'aciklama': TextEditingController(),
    'il': TextEditingController(),
    'iletisimadres': TextEditingController(),
  };

  @override
  void initState() {
    super.initState();
    controllers['adsoyad']?.text = adsoyad;
    controllers['aciklama']?.text = aciklama;
    controllers['il']?.text = il;
    controllers['iletisimadres']?.text = iletisimadres;
  }

  @override
  void dispose() {
    controllers.forEach((key, controller) => controller.dispose());
    super.dispose();
  }

  void _submitForm() {
    if (_formKey.currentState!.validate() && isAgreed) {
      CollectionReference bekleyenleryt =
          FirebaseFirestore.instance.collection('bekleyenyt');

      var now = DateTime.now();
      var formatter = DateFormat('dd.MM.yyyy HH:mm');
      String formattedDate = formatter.format(now);

      bekleyenleryt.add({
        'adsoyad': adsoyad,
        'aciklama': aciklama,
        'il': il,
        'iletisimadres': iletisimadres,
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
      // Form doğru bir şekilde doldurulmamışsa, bir hata mesajı gösterilir.
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Lütfen eksik ya da kabul edilmeyen alanları tamamlayın.')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text("Yardım Talebi Oluştur",
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
        padding: const EdgeInsets.only(top: 25, left: 16, right: 16),
        child: Form(
          key: _formKey,
          child: ListView(
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
                  child: Text("Gerekli Bilgiler",
                      style:
                          TextStyle(fontSize: 12, color: Colors.blue.shade100)),
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
                  controller: controllers['adsoyad'],
                  decoration: InputDecoration(
                    labelText: 'Ad Soyad',
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
                  keyboardType: TextInputType.text,
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
                padding: const EdgeInsets.only(top: 20, bottom: 20),
                child: TextFormField(
                  controller: controllers['il'],
                  keyboardType: TextInputType.name, // E-mail için klavye tipi
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
                    // E-mail doğrulama işlemleri de burada yapılabilir.
                    return null;
                  },
                ),
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
                  child: Text("İletişim Bilgileri",
                      style:
                          TextStyle(fontSize: 12, color: Colors.blue.shade100)),
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
                    labelText:
                        'İstediğiniz bir iletişim tercihi(örn: numara, sosyal medya hesabı)',
                    labelStyle: TextStyle(
                        color: Colors.blue.shade800,
                        fontSize: 10,
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
              ),  Row(
  children: [
    Checkbox(
      activeColor: Colors.amber,
      checkColor: Colors.white, 
      fillColor: MaterialStateProperty.resolveWith<Color>((Set<MaterialState> states) {
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
            side: BorderSide(color: const Color.fromARGB(255, 245, 128, 128), width: 0),
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
              text: " sözleşmelerini kabul ettiğimi onaylıyorum",
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
    );
  }
}
