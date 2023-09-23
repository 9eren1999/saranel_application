import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SaranelPage extends StatefulWidget {
  const SaranelPage({super.key});

  @override
  State<SaranelPage> createState() => _SaranelPageState();
}

class _SaranelPageState extends State<SaranelPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          title: Text("Saranel Hakkında", style: appbarStyle()),
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
                      "Saranel Platformu Tanıtımı",
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
                      "Saranel, dijital bir yardımlaşma köprüsüdür. Teknolojik olanaklar sayesinde, yardıma ihtiyacı olanlarla yardımseverleri buluşturmayı amaçlar.",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Color.fromARGB(255, 255, 255, 255),
                          fontSize: 12,
                          fontWeight: FontWeight.w100),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Neden Saranel?",
                      textAlign: TextAlign.start,
                      style: TextStyle(
                          color: Color.fromARGB(255, 248, 248, 248),
                          fontSize: 14,
                          fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Text(
                      "Saranel, teknolojinin sunduğu imkanları kullanarak güvenilir ve şeffaf bir yardımlaşma platformu sunar. İnsanların güven içinde yardım yapabileceği bir ortamın oluşturulmasını hedefler.",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Color.fromARGB(255, 255, 255, 255),
                          fontSize: 12,
                          fontWeight: FontWeight.w100),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Saranel Ekibi",
                      textAlign: TextAlign.start,
                      style: TextStyle(
                          color: Color.fromARGB(255, 248, 248, 248),
                          fontSize: 14,
                          fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Text(
                      "Saranel, iki üniversite öğrencisinin ortak vizyonuyla oluşturuldu. Her iki öğrenci de Flutter geliştirme konusunda deneyimli ve bu platformun arkasındaki ana güçlerdir. Bu genç geliştiriciler, Saranel'i topluma katkıda bulunmak ve yardımlaşma kültürünü dijitalleştirmek için bir araç olarak tasarladılar.",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Color.fromARGB(255, 255, 255, 255),
                          fontSize: 12,
                          fontWeight: FontWeight.w100),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Amacımız",
                      textAlign: TextAlign.start,
                      style: TextStyle(
                          color: Color.fromARGB(255, 248, 248, 248),
                          fontSize: 14,
                          fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Text(
                      "Saranel'in temel amacı, yardımlaşmayı teşvik ederek toplumda dayanışmayı güçlendirmektir. Platform, güvenli bir bağış ortamı oluşturarak, yardımların doğru yerlere ulaşmasını sağlar.",
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
