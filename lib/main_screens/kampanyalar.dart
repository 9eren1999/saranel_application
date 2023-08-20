import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:saranel_application/company_screens/belediye_kampanyalari.dart';
import 'package:saranel_application/company_screens/diger_kampanyalar.dart';
import 'package:saranel_application/company_screens/egitim_kampanyalari.dart';
import 'package:saranel_application/main_screens/kuruluslar.dart';

import '../company_screens/sma_kampanyalari.dart';

class Kampanyalar extends StatefulWidget {
  const Kampanyalar({super.key});

  @override
  State<Kampanyalar> createState() => _KampanyalarState();
}

class _KampanyalarState extends State<Kampanyalar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Kampanyalar", style: GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.w600)), ),
      body: Container(
        decoration: BoxDecoration(
          boxShadow: [
                  BoxShadow(
                    color:
                        Color.fromRGBO(243, 240, 240, 1).withOpacity(0.9),
                    spreadRadius: 900,
                    blurRadius: 0.1,
                    offset: Offset(0, 1),
                  ),
        ]),
        child: Column(children: [
          Card(
            color: Color.fromARGB(255, 255, 255, 251),
            shadowColor: Color.fromARGB(20, 0, 0, 1), 
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(9))),
            margin: EdgeInsets.only(left: 20, top: 25, right: 20),
            child: Column(
              children: [
                ListTile(
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 20,
                  ),
                  title: Text(
                    "Vakıf ve Dernekler",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                        color: Color.fromARGB(255, 218, 50, 64),
                        fontSize: 14,
                        fontWeight: FontWeight.w600),
                  ),
                  trailing: Icon(Icons.navigate_next_outlined,
                      color: Color.fromARGB(255, 218, 50, 64)),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Kurusluslar(),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
          Container(
            child: Card(
                color: Color.fromARGB(255, 255, 255, 251),
                shadowColor: Color.fromARGB(20, 0, 0, 1),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(9))),
                margin: EdgeInsets.only(left: 20, top: 10, right: 20),
                child: Column(
                  children: [
                    ListTile(
                      contentPadding: EdgeInsets.symmetric(horizontal: 20),
                      title: Text(
                        "Belediye Kampanyaları",
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            color: Color.fromARGB(255, 218, 50, 64),
                            fontSize: 14,
                            fontWeight: FontWeight.w600),
                      ),
                      trailing: Icon(Icons.navigate_next_outlined,
                          color: Color.fromARGB(255, 218, 50, 64)),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => BelediyeKampanyalari(),
                          ),
                        );
                      },
                    ),
                  ],
                )),
          ),
          Card(
              color: Color.fromARGB(255, 255, 255, 251),
              shadowColor: Color.fromARGB(20, 0, 0, 1),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(9))),
              margin: EdgeInsets.only(left: 20, top: 10, right: 20),
              child: Column(children: [
                ListTile(
                  contentPadding: EdgeInsets.symmetric(horizontal: 20),
                  title: Text(
                    "SMA Kampanyaları",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                        color: Color.fromARGB(255, 218, 50, 64),
                        fontSize: 14,
                        fontWeight: FontWeight.w600),
                  ),
                  trailing: Icon(Icons.navigate_next_outlined,
                      color: Color.fromARGB(255, 218, 50, 64)),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SmaKampanyalari(),
                      ),
                    );
                  },
                ),
              ])),
          Card(
              color: Color.fromARGB(255, 255, 255, 251),
              shadowColor: Color.fromARGB(20, 0, 0, 1),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(9))),
              margin: EdgeInsets.only(left: 20, top: 10, right: 20),
              child: Column(
                children: [
                  ListTile(
                    contentPadding: EdgeInsets.symmetric(horizontal: 20),
                    title: Text(
                      "Eğitim Kampanyaları",
                      textAlign: TextAlign.start,
                      style: TextStyle(
                          color: Color.fromARGB(255, 218, 50, 64),
                          fontSize: 14,
                          fontWeight: FontWeight.w600),
                    ),
                    trailing: Icon(Icons.navigate_next_outlined,
                        color: Color.fromARGB(255, 218, 50, 64)),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => EgitimKampanyalari(),
                        ),
                      );
                    },
                  ),
                ],
              )),
          Card(
              color: Color.fromARGB(255, 255, 255, 251),
              shadowColor: Color.fromARGB(20, 0, 0, 1),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(9))),
              margin: EdgeInsets.only(left: 20, top: 10, right: 20),
              child: Column(children: [
                ListTile(
                  contentPadding: EdgeInsets.symmetric(horizontal: 20),
                  title: Text(
                    "Diğer Kampanyalar",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                        color: Color.fromARGB(255, 218, 50, 64),
                        fontSize: 14,
                        fontWeight: FontWeight.w600),
                  ),
                  trailing: Icon(Icons.navigate_next_outlined,
                      color: Color.fromARGB(255, 218, 50, 64)),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DigerKampanyalar(),
                      ),
                    );
                  },
                ),
              ])),
        ]),
      ),
    );
  }
}
