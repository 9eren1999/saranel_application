import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:saranel_application/settings_screens/acikriza.dart';
import 'package:saranel_application/settings_screens/gizlilik.dart';
import 'package:saranel_application/settings_screens/iletisim.dart';
import 'package:saranel_application/settings_screens/kosullar.dart';
import 'package:saranel_application/settings_screens/lisanslar.dart';
import 'package:saranel_application/settings_screens/platformkurallari.dart';

class Ayarlar extends StatefulWidget {
  const Ayarlar({super.key});

  @override
  State<Ayarlar> createState() => _AyarlarState();
}

class _AyarlarState extends State<Ayarlar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text(
          "Uygulama Bilgileri",
          style: GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.w800),
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
          SizedBox(height: 12,),
          Padding(
            padding: const EdgeInsets.all(2.0),
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    boxShadow: [
                      BoxShadow(
                        color: Color.fromRGBO(0, 0, 0, 0).withOpacity(0.0),
                        spreadRadius: 0,
                        blurRadius: 0.1,
                        offset: Offset(0, 0),
                      ),
                    ],
                  ),
                  //İletişim
                  child: Card(
                      color: Colors.blue.shade600,
                      shadowColor: Color.fromARGB(55, 0, 0, 0),
                      child: Column(children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              bottom: 0, left: 10, right: 10, top: 0),
                          child: ListTile(
                            title: Text(
                              "İletişim",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                              ),
                              textAlign: TextAlign.start,
                            ),
                            trailing: Icon(Icons.navigate_next_outlined,
                                color: Colors.white),
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => iletisim()));
                            },
                          ),
                        ), Divider(
                              color: Color.fromARGB(117, 236, 234, 234),
                              height: 0.1, indent: 20, endIndent: 20),
                        Padding(
                          padding: const EdgeInsets.only(
                              bottom: 0, left: 10, right: 10, top: 0),
                          child: ListTile(
                            title: Text(
                              "Açık Rıza Sözleşmesi",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                              ),
                              textAlign: TextAlign.start,
                            ),
                            trailing: Icon(Icons.navigate_next_outlined,
                                color: Colors.white),
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Acikriza()));
                            },
                          ),
                        ),Divider(
                              color: Color.fromARGB(117, 236, 234, 234),
                              height: 0.1, indent: 20, endIndent: 20),
                        Padding(
                          padding: const EdgeInsets.only(
                              bottom: 0, left: 10, right: 10, top: 0),
                          child: ListTile(
                            title: Text(
                              "Platform Kuralları",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                              ),
                              textAlign: TextAlign.start,
                            ),
                            trailing: Icon(Icons.navigate_next_outlined,
                                color: Colors.white),
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => PlatformKurallari()));
                            },
                          ),
                        ),

                        Padding(
                          padding: const EdgeInsets.only(
                            left: 20,
                            right: 20,
                          ),
                          child: Divider(
                              color: Color.fromARGB(117, 236, 234, 234),
                              height: 0.1),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              bottom: 0, top: 0, left: 10, right: 10),
                          child: ListTile(
                            title: Text(
                              "Gizlilik Sözleşmesi",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                              ),
                              textAlign: TextAlign.start,
                            ),
                            trailing: Icon(Icons.navigate_next_outlined,
                                color: Colors.white),
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Gizlilik()));
                            },
                          ),
                        ),

                        Padding(
                          padding: const EdgeInsets.only(
                            left: 20,
                            right: 20,
                          ),
                          child: Divider(
                              color: Color.fromARGB(117, 236, 234, 234),
                              height: 0.1),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              bottom: 0, top: 0, left: 10, right: 10),
                          child: ListTile(
                            title: Text(
                              "Kullanım Koşulları",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                                fontWeight: FontWeight.w100,
                              ),
                              textAlign: TextAlign.start,
                            ),
                            trailing: Icon(Icons.navigate_next_outlined,
                                color: Colors.white),
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Kosullar()));
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 20, right: 20),
                          child: Divider(
                            color: Color.fromARGB(117, 236, 234, 234),
                            height: 0.1,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              bottom: 5, top: 0, left: 10, right: 10),
                          child: ListTile(
                            title: Text(
                              "Uygulama Lisansları Hakkında",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                                fontWeight: FontWeight.w100,
                              ),
                              textAlign: TextAlign.start,
                            ),
                            trailing: Icon(Icons.navigate_next_outlined,
                                color: Colors.white),
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Lisanslar()));
                            },
                          ),
                        ),
                      ]))),
            ),
          ),
        ]),
      ),
    );
  }
}
