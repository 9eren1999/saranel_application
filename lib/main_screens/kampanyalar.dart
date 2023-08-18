import 'package:flutter/material.dart';
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
      appBar: AppBar(title: Text("Kampanyalar")),
      body: Column(children: [
        Card(
          elevation: 0.7,
          color: Color.fromARGB(255, 255, 255, 255),
          shadowColor: Colors.black45,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(20))),
          margin: EdgeInsets.only(left: 20, top: 35, right: 20),
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
                      color: Color.fromARGB(255, 23, 190, 219),
                      fontSize: 15,
                      fontWeight: FontWeight.w600),
                ),
                trailing: Icon(Icons.navigate_next_outlined,
                    color: Color.fromARGB(255, 23, 190, 219)),
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
        Card(
            elevation: 0.7,
            color: Color.fromARGB(255, 255, 255, 255),
            shadowColor: Colors.black45,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(20))),
            margin: EdgeInsets.only(left: 20, top: 15, right: 20),
            child: Column(
              children: [
                ListTile(
                  contentPadding: EdgeInsets.symmetric(horizontal: 20),
                  title: Text(
                    "Belediye Kampanyaları",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                        color: Color.fromARGB(255, 23, 190, 219),
                        fontSize: 15,
                        fontWeight: FontWeight.w600),
                  ),
                  trailing: Icon(Icons.navigate_next_outlined,
                      color: Color.fromARGB(255, 23, 190, 219)),
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
        Card(
            elevation: 0.7,
            color: Color.fromARGB(255, 255, 255, 255),
            shadowColor: Colors.black45,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(20))),
            margin: EdgeInsets.only(left: 20, top: 15, right: 20),
            child: Column(children: [
              ListTile(
                contentPadding: EdgeInsets.symmetric(horizontal: 20),
                title: Text(
                  "SMA Kampanyaları",
                  textAlign: TextAlign.start,
                  style: TextStyle(
                      color: Color.fromARGB(255, 23, 190, 219),
                      fontSize: 15,
                      fontWeight: FontWeight.w600),
                ),
                trailing: Icon(Icons.navigate_next_outlined,
                    color: Color.fromARGB(255, 23, 190, 219)),
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
            elevation: 0.7,
            color: Color.fromARGB(255, 255, 255, 255),
            shadowColor: Colors.black45,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(20))),
            margin: EdgeInsets.only(left: 20, top: 15, right: 20),
            child: Column(
              children: [
                ListTile(
                  contentPadding: EdgeInsets.symmetric(horizontal: 20),
                  title: Text(
                    "Eğitim Kampanyaları",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                        color: Color.fromARGB(255, 23, 190, 219),
                        fontSize: 15,
                        fontWeight: FontWeight.w600),
                  ),
                  trailing: Icon(Icons.navigate_next_outlined,
                      color: Color.fromARGB(255, 23, 190, 219)),
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
            elevation: 0.7,
            color: Color.fromARGB(255, 255, 255, 255),
            shadowColor: Colors.black45,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(20))),
            margin: EdgeInsets.only(left: 20, top: 15, right: 20),
            child: Column(children: [
              ListTile(
                contentPadding: EdgeInsets.symmetric(horizontal: 20),
                title: Text(
                  "Diğer Kampanyalar",
                  textAlign: TextAlign.start,
                  style: TextStyle(
                      color: Color.fromARGB(255, 23, 190, 219),
                      fontSize: 15,
                      fontWeight: FontWeight.w600),
                ),
                trailing: Icon(Icons.navigate_next_outlined,
                    color: Color.fromARGB(255, 23, 190, 219)),
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
    );
  }
}
