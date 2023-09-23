import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Lisanslar extends StatelessWidget {
  const Lisanslar({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Uygulama Lisansları",
            style:
                GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.w800),
          ),
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
        body: Container(
            child: ListView(children: [
          Padding(
            padding:
                const EdgeInsets.only(top: 20, left: 12, right: 12, bottom: 20),
            child: Card(
              color: Colors.blue.shade600,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(15))),
              child: Padding(
                padding: EdgeInsets.only(top: 20, left: 30, right: 30),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Uygulama Lisansları Hakkında",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Color.fromARGB(255, 248, 248, 248),
                          fontSize: 14,
                          fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Text(
                      """Lisans Bilgilendirmesi ve Kullanım Şartları

Bu uygulama, Flutter tarafından sağlanan bir dizi açık kaynak yazılım kütüphanesi ile geliştirilmiştir. Kullanılan bağımlılıkların listesi ve bunların ilgili lisansları aşağıda sunulmuştur:

Flutter SDK & Cupertino Icons: Flutter tarafından sağlanan bu SDK, uygulamanın temel yapı taşlarını oluşturur.

Google NavBar: Navigasyon özellikleri için kullanılır. MIT lisansı altında dağıtılır.

Firebase (Core, Cloud Firestore, Storage, Remote Config): Firebase, Google tarafından geliştirilen bir mobil ve web uygulama geliştirme platformudur. Firebase ürünlerinin her biri, Google Cloud Platform'un standart lisansı altında kullanılmaktadır.

Equatable: Dart nesnelerinin eşitliklerini değerlendirmek için kullanılır. MIT lisansı altında dağıtılır.

Cached Network Image: Ağdan alınan resimleri önbelleğe alma ve görüntüleme yeteneği sağlar. MIT lisansı altında dağıtılır.

Google Fonts: Uygulamada kullanılan fontlara kolay erişim sağlar. Apache Lisansı 2.0 altında dağıtılır.

URL Launcher: URL'leri başlatmak için kullanılır. MIT lisansı altında dağıtılır.

Shared Preferences: Küçük, basit veri setlerini kaydetmek ve okumak için kullanılır. BSD Lisansı altında dağıtılır.

Image Picker: Kullanıcının cihazından resim seçmesini sağlar. MIT lisansı altında dağıtılır.

Intl: Uluslararasılaştırma ve yerelleştirme için araçlar sunar. MIT lisansı altında dağıtılır.

Flutter Launcher Icons: Uygulama başlatıcı ikonlarını kolayca oluşturur. MIT lisansı altında dağıtılır.

Her bir bağımlılık, kendi lisansı altında dağıtılır ve kullanıcılar bu lisansların koşullarına uymalıdır.

Ayrıca, Saranel uygulamasının özgün içeriği, tasarımı ve markası telif hakları ile korunmaktadır. Saranel'in içeriği ve markasının herhangi bir şekilde kopyalanması, dağıtılması veya ticari amaçlarla kullanılması yasaktır. Bu uygulamanın kullanımı, kullanıcıların lisans koşullarını, Kullanım Şartları ve Gizlilik Politikası ile belirlenen diğer yasal yükümlülüklerini kabul ettiği anlamına gelir.

""",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Color.fromARGB(255, 255, 255, 255),
                          fontSize: 12,
                          fontWeight: FontWeight.w100),
                    ),
                    SizedBox(
                      height: 25,
                    )
                  ],
                ),
              ),
            ),
          ),
        ])));
  }
}

TextStyle appbarStyle() =>
    GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.w800);
