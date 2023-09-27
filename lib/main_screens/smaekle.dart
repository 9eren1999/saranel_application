import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:flutter/gestures.dart';
import 'package:saranel_application/main_screens/anasayfa.dart';
import 'package:saranel_application/settings_screens/acikriza.dart';
import 'package:saranel_application/settings_screens/gizlilik.dart';
import 'package:saranel_application/settings_screens/kosullar.dart';

class SMAIlanEkle extends StatefulWidget {
  @override
  _SMAIlanEkleState createState() => _SMAIlanEkleState();
}

class _SMAIlanEkleState extends State<SMAIlanEkle> {
  final _formKey = GlobalKey<FormState>();
  final picker = ImagePicker();
  String? _uploadedImageUrl1;
  String? _uploadedImageUrl2;
  bool isAgreed = false;

  bool isImage1Uploaded = false;
  bool isImage2Uploaded = false;

  String adSoyad = '';
  String tamamlanmaOrani = '';
  String bankaAdi = '';
  String iban = '';
  String alici = '';
  String aciklama = '';
  String ekDetaylar = '';
  String ilgiliadSoyad = '';
  String email = '';
  String telefonNo = '';
  String bitistarihi = '';

  bool isValidIban(String iban) {
    final RegExp ibanRegExp = RegExp(r'^TR[0-9]{24}$');
    return ibanRegExp.hasMatch(iban);
  }

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
          } else if (imageNumber == 2) {
            _uploadedImageUrl2 = downloadUrl;
            isImage2Uploaded = true; //görsel yüklendiyse durum true
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
    'ilgiliadSoyad': TextEditingController(),
    'telefonNo': TextEditingController(),
    'email': TextEditingController(),
    'adSoyad': TextEditingController(),
    'tamamlanmaOrani': TextEditingController(),
    'bankaAdi': TextEditingController(),
    'iban': TextEditingController(),
    'alici': TextEditingController(),
    'aciklama': TextEditingController(),
    'ekDetaylar': TextEditingController(),
    'bitistarihi': TextEditingController(),
  };

  @override
  void initState() {
    super.initState();
    controllers['ilgiliadSoyad']?.text = ilgiliadSoyad;
    controllers['telefonNo']?.text = telefonNo;
    controllers['email']?.text = email;
    controllers['adSoyad']?.text = adSoyad;
    controllers['tamamlanmaOrani']?.text = tamamlanmaOrani;
    controllers['bankaAdi']?.text = bankaAdi;
    controllers['iban']?.text = iban;
    controllers['alici']?.text = alici;
    controllers['aciklama']?.text = aciklama;
    controllers['ekDetaylar']?.text = ekDetaylar;
    controllers['bitistarihi']?.text = bitistarihi;
  }

  @override
  void dispose() {
    controllers.forEach((key, controller) => controller.dispose());
    super.dispose();
  }

  void _submitForm() {
    if (_formKey.currentState!.validate() && isAgreed) {
      // Görsel alanlarının kontrolü
      if (_uploadedImageUrl1 == null || _uploadedImageUrl2 == null) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Lütfen tüm görsel alanlarını doldurunuz.')),
        );
        return;
      }

      if (ilgiliadSoyad.isEmpty ||
          telefonNo.isEmpty ||
          email.isEmpty ||
          adSoyad.isEmpty ||
          tamamlanmaOrani.isEmpty ||
          bankaAdi.isEmpty ||
          iban.isEmpty ||
          bitistarihi.isEmpty ||
          alici.isEmpty ||
          aciklama.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Lütfen tüm alanları doldurunuz.')),
        );
        return;
      }
      CollectionReference bekleyenler =
          FirebaseFirestore.instance.collection('bekleyenler');

      bekleyenler.add({
        'aciklama1': adSoyad,
        'bagis': tamamlanmaOrani,
        'banka2': bankaAdi,
        'iban': iban,
        'bitistarihi': bitistarihi,
        'alici': alici,
        'aciklamasi': aciklama,
        'ilgiliadSoyad': ilgiliadSoyad,
        'email': email,
        'telefonNo': telefonNo,
        'detayaciklama': ekDetaylar,
        'image': _uploadedImageUrl1,
        'ylink': _uploadedImageUrl2,
      }).then((_) {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              backgroundColor: Colors.blue.shade800,
              title: Text('İlanınız İncelemeye Alındı!',
                  style: TextStyle(color: Colors.white)),
              content: Text(
                'Bilgiler 48 saat içinde incelenecektir. Herhangi bir eksik tespit edilmesi durumunda, vermiş olduğunuz iletişim adreslerinden bilgilendirme yapılacaktır.',
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
      //inputlar doğru bir şekilde doldurulmamışsa hata mesajı göstersin
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Lütfen eksik alanları tamamlayın.')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: false,
      appBar: AppBar(
        title: Text("SMA Kampanyası Ekle",
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
                    controller: controllers['ilgiliadSoyad'],
                    decoration: InputDecoration(
                      labelText: 'Yetkili Ad Soyad',
                      labelStyle: TextStyle(
                        color: Colors.blue.shade800,
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                      ),
                      filled: true,
                      fillColor: Colors.white,
                    ),
                    onChanged: (value) {
                      ilgiliadSoyad = value;
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
                    controller: controllers['telefonNo'],
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: 'Telefon Numarası',
                      labelStyle: TextStyle(
                        color: Colors.blue.shade800,
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                      ),
                      filled: true,
                      fillColor: Colors.white,
                    ),
                    onChanged: (value) {
                      telefonNo = value;
                    },
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Telefon numarası alanı boş olamaz';
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20, bottom: 20),
                  child: TextFormField(
                    controller: controllers['email'],
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      labelText: 'E-mail',
                      labelStyle: TextStyle(
                        color: Colors.blue.shade800,
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                      ),
                      filled: true,
                      fillColor: Colors.white,
                    ),
                    onChanged: (value) {
                      email = value;
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'E-mail alanı boş olamaz';
                      }
                      //mail doğrulama işlemi
                      Pattern pattern =
                          r'^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$';
                      RegExp regex = new RegExp(pattern as String);
                      if (!regex.hasMatch(value))
                        return 'Geçerli bir e-mail adresi giriniz';
                      else
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
                    controller: controllers['adSoyad'],
                    cursorColor: Colors.blue.shade800,
                    decoration: InputDecoration(
                      labelText: 'Hasta Ad Soyad',
                      labelStyle: TextStyle(
                          color: Colors.blue.shade800,
                          fontSize: 12,
                          fontWeight: FontWeight.w400),
                      filled: true,
                      fillColor: Colors.white,
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
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: TextFormField(
                    controller: controllers['tamamlanmaOrani'],
                    cursorColor: Colors.blue.shade800,
                    keyboardType:
                        TextInputType.number, // sayısal değer girişi için
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
                      tamamlanmaOrani = value;
                    },
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Tamamlanma oranı alanı boş olamaz';
                      }
                      final int? oran = int.tryParse(value);
                      if (oran == null || oran < 0 || oran > 100) {
                        return 'Lütfen 0 ile 100 arasında bir değer girin';
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20, bottom: 20),
                  child: TextFormField(
                    controller: controllers['bitistarihi'],
                    cursorColor: Colors.blue.shade800,
                    keyboardType:
                        TextInputType.number, // sayısal değer girişi için
                    decoration: InputDecoration(
                      labelText: 'Kampanya Bitiş Tarihi (gg.aa.yyyy)',
                      labelStyle: TextStyle(
                        color: Colors.blue.shade800,
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                      ),
                      filled: true,
                      fillColor: Colors.white,
                    ),
                    onChanged: (value) {
                      bitistarihi = value;
                    },
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Kampanya Bitiş Tarihi alanı boş olamaz';
                      }
                      final RegExp datePattern =
                          RegExp(r'^\d{2}\.\d{2}\.\d{4}$');

                      final bool isValid = datePattern.hasMatch(value);
                      if (!isValid) {
                        return 'Lütfen tarihi gg.aa.yyyy formatında girin';
                      }
                      final parts = value.split('.');
                      final day = int.parse(parts[0]);
                      final month = int.parse(parts[1]);

                      if (day < 1 || day > 31) {
                        return 'Gün 1 ile 31 arasında olmalıdır';
                      }

                      if (month < 1 || month > 12) {
                        return 'Ay 1 ile 12 arasında olmalıdır';
                      }

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
                    child: Text("Kampanya Bağış Bilgileri",
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
                    controller: controllers['bankaAdi'],
                    cursorColor: Colors.blue.shade800,
                    decoration: InputDecoration(
                      labelText: 'Banka Adı',
                      labelStyle: TextStyle(
                        color: Colors.blue.shade800,
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                      ),
                      filled: true,
                      fillColor: Colors.white,
                    ),
                    onChanged: (value) {
                      bankaAdi = value;
                    },
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Banka adı alanı boş olamaz';
                      }
                      return null;
                    },
                  ),
                ),

                // iban
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: TextFormField(
                    controller: controllers['iban'],
                    cursorColor: Colors.blue.shade800,
                    decoration: InputDecoration(
                      labelText: 'IBAN ',
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
                        return 'IBAN alanı boş olamaz';
                      }
                      if (!isValidIban(value)) {
                        return 'Geçersiz IBAN';
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 20,
                  ),
                  child: TextFormField(
                    controller: controllers['alici'],
                    cursorColor: Colors.blue.shade800,
                    decoration: InputDecoration(
                      labelText: 'Alıcı Adı Soyadı',
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
                        return 'Alıcı adı soyadı alanı boş olamaz';
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: TextFormField(
                    controller: controllers['aciklama'],
                    cursorColor: Colors.blue.shade800,
                    decoration: InputDecoration(
                      labelText: 'Bağış Açıklaması',
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
                        return 'Bağış açıklaması alanı boş olamaz';
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20, bottom: 30),
                  child: TextFormField(
                    controller: controllers['ekDetaylar'],
                    cursorColor: Colors.blue.shade800,
                    maxLines: null,
                    decoration: InputDecoration(
                      labelText: 'Eklemek İstediğiniz Diğer Detaylar',
                      labelStyle: TextStyle(
                        color: Colors.blue.shade800,
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                      ),
                      filled: true,
                      fillColor: Colors.white,
                    ),
                    onChanged: (value) {
                      ekDetaylar = value;
                    },
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Ek detaylar alanı boş olamaz';
                      }
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
                    child: Text("Kampanya Görselleri",
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
                            "Kampanya Görseli Yükle",
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
                            "Kampanya kimin için yapılıyorsa o kişinin görselini yükleyiniz. Kendi resminizi ya da reklam afişinizi yüklemeyiniz.",
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.white70),
                          ),
                        ),
                        if (isImage1Uploaded) // eğer görsel yüklendiyse onay işareti
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
                Padding(
                  padding: const EdgeInsets.only(
                    top: 10,
                  ),
                  child: InkWell(
                    onTap: () => _uploadImage(2),
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
                            "İzin Belgesi Yükle",
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
                            "Valilik onay belgesini yanlızca görsel olarak, Faaliyet No (xx-xxxx) ve iban bilgileri gibi tüm alanların görüntüleneceği şekilde yükleyiniz.",
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.white70),
                          ),
                        ),
                        if (isImage2Uploaded)
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
