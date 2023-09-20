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
                      "Bu uygulama, Flutter tarafından sağlanan bir dizi açık kaynak yazılım kütüphanesi kullanılarak geliştirilmiştir. Bu kütüphaneler, kendi lisanslarına tabidir ve kullanıcılar bu lisansların koşullarına uymalıdır. \n \nAyrıca, Saranel uygulamasının kendine ait içeriği ve markasının herhangi bir şekilde kopyalanması, dağıtılması veya ticari amaçlarla kullanılması yasaktır. \n \nBu uygulamanın kullanımı, kullanıcıların lisans koşullarını, Kullanım Şartları ve Gizlilik Politikası ile belirlenen diğer yasal yükümlülüklerini kabul ettiği anlamına gelir.",
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
