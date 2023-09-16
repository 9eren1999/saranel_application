import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DonationPage extends StatefulWidget {
  @override
  State<DonationPage> createState() => _DonationPageState();
}

class _DonationPageState extends State<DonationPage> {
  bool isButtonActive = false;
  String? selectedAmount;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blue.shade800,
        appBar: AppBar(
          title: Text(
            "Saranel'i Destekle",
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
            ),
          ),
          backgroundColor: Colors.white,
        ),
        body: Container(
        child: ListView(children: [
          Padding(
            padding:
                const EdgeInsets.only(top: 15, left: 10, right: 10, bottom: 15),
            child: Card(
              color: Colors.blue.shade900,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(15))),
              child: Padding(
                padding: EdgeInsets.only(top: 20, left: 15, right: 15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    
                    Text(
                      "Saranel Platformu, yardıma ihtiyacı olan vatandaşları yardımsever insanlarla bir araya getiren tamamen ücretsiz bir platformdur. Fakat platformun işleyişini sürdürebilmek için değerli bağışçılarımıza ihtiyacımız var. Yapacağınız bağışlarla, Saranel platformunun sunucu ve operasyonel giderlerine destek sağlayabilir, toplumsal yardımlaşma ve dayanışma misyonumuzun bir parçası olabilirsiniz.",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Color.fromARGB(255, 255, 255, 255),
                          fontSize: 12,
                          fontWeight: FontWeight.w100),
                    ),
                    SizedBox(
                      height: 20,
                    
          ),
    ]))))])));
  }
}

TextStyle appbarStyle() =>
    GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.w800);