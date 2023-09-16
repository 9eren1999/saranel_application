import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:saranel_application/settings_screens/iletisim.dart';
import 'package:saranel_application/settings_screens/kosullar.dart';
import 'package:saranel_application/settings_screens/lisanslar.dart';

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
          // Padding(
          //   padding:
          //       const EdgeInsets.only(top: 20, left: 12, right: 12, bottom: 20),
          //   child: Card(
          //     color: Colors.blue.shade600,
          //     shape: RoundedRectangleBorder(
          //         borderRadius: BorderRadius.all(Radius.circular(15))),
          //     child: Padding(
          //       padding: EdgeInsets.only(top: 20, left: 22, right: 22),
          //       child: Column(
          //         mainAxisAlignment: MainAxisAlignment.start,
          //         children: [
          //           Text(
          //             "Saraneli Desteklemek İster Misiniz?",
          //             textAlign: TextAlign.center,
          //             style: TextStyle(
          //                 color: Color.fromARGB(255, 248, 248, 248),
          //                 fontSize: 15,
          //                 fontWeight: FontWeight.w600),
          //           ),
          //           SizedBox(
          //             height: 8,
          //           ),
          //           Text(
          //             "Saranel, yardım ve bağışların etkin bir şekilde derlenip yönlendirilmesi amacıyla kurulmuş ücretsiz bir platformdur. Fakat, sunucu giderleri ve diğer operasyonel alanlarda faaliyetlerimizi sürdürebilmek için siz değerli bağışçılarımızın desteğine ihtiyaç duyuyoruz. Saranel'e yapacağınız destek, tüm bu önemli faaliyetlerin devamlılığını sağlayacaktır. Siz de Saranel'i destekleyerek, toplumsal dayanışma ve yardımlaşma misyonumuzun bir parçası olabilirsiniz.",
          //             textAlign: TextAlign.center,
          //             style: TextStyle(
          //                 color: Color.fromARGB(255, 255, 255, 255),
          //                 fontSize: 14,
          //                 fontWeight: FontWeight.w100),
          //           ),
          //           SizedBox(
          //             height: 10,
          //           ),
          //           Padding(
          //             padding: const EdgeInsets.only(top: 10, bottom: 20),
          //             child: ElevatedButton(
          //               onPressed: () {
          //                 Navigator.push(
          //                   context,
          //                   MaterialPageRoute(
          //                       builder: (context) => DonationPage()),
          //                 );
          //               },
          //               child: Text(
          //                 "Saranel'i Destekle!",
          //                 style: TextStyle(
          //                   color: Colors.blue.shade600,
          //                 ),
          //               ),
          //               style: ButtonStyle(
          //                   backgroundColor: MaterialStatePropertyAll(
          //                       Color.fromARGB(255, 255, 255, 255))),
          //             ),
          //           ),
          //         ],
          //       ),
          //     ),
          //   ),
          // ), 
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
                        ),

                        // Geliştiriciler
                        // Padding(
                        //   padding: const EdgeInsets.only(
                        //     left: 20,
                        //     right: 20,
                        //   ),
                        //   child: Divider(
                        //       color: Color.fromARGB(255, 236, 234, 234),
                        //       height: 0.1),
                        // ),
                        // Padding(
                        //   padding: const EdgeInsets.only(
                        //       bottom: 0, top: 0, left: 10, right: 10),
                        //   child: ListTile(
                        //     title: Text(
                        //       "Sıkça Sorulan Sorular",
                        //       style: TextStyle(
                        //         color: Colors.white,
                        //         fontSize: 14,
                        //         fontWeight: FontWeight.w400,
                        //       ),
                        //       textAlign: TextAlign.start,
                        //     ),
                        //     trailing: Icon(Icons.navigate_next_outlined,
                        //         color: Colors.white),
                        //     onTap: () {
                        //       Navigator.push(
                        //           context,
                        //           MaterialPageRoute(
                        //               builder: (context) => Sss()));
                        //     },
                        //   ),
                        // ),

                        Padding(
                          padding: const EdgeInsets.only(
                            left: 20,
                            right: 20,
                          ),
                          child: Divider(
                              color: Color.fromARGB(255, 236, 234, 234),
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

                        // Uygulama Lisanslar Hakkında
                        Padding(
                          padding: const EdgeInsets.only(left: 20, right: 20),
                          child: Divider(
                            color: Color.fromARGB(255, 236, 234, 234),
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
