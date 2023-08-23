import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:saranel_application/company_screens/belediye_kampanyalari.dart';
import 'package:saranel_application/company_screens/dernekler.dart';
import 'package:saranel_application/company_screens/diger_kampanyalar.dart';
import 'package:saranel_application/company_screens/sivil_toplum.dart';
import 'package:saranel_application/company_screens/sma_kampanyalari.dart';
import '../company_screens/vakiflar.dart';

class AnaSayfa extends StatefulWidget {
  const AnaSayfa({super.key});

  @override
  State<AnaSayfa> createState() => _AnaSayfaState();
}

class _AnaSayfaState extends State<AnaSayfa> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          toolbarHeight: 0,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(0),
                  bottomRight: Radius.circular(0))),
        ),
        body: ListView(children: [
          ClipPath(
            clipper: MyClipper(),
            child: Container(
              color: Colors.white,
              width: double.infinity,
              child: Padding(
                  padding: EdgeInsets.only(
                    top: 40,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "Saranel'e Hoşgeldin!",
                        style: GoogleFonts.poppins(
                            fontSize: 18,
                            fontWeight: FontWeight.w800,
                            color: Colors.blue.shade800),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 30, right: 30, top: 7, bottom: 50),
                        child: Text(
                          " Saranel'de resmi kurumlar tarafından onaylanmış vakıf, dernek ve kampanyalara ulaşabilirsin..",
                          style: GoogleFonts.poppins(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Colors.blue.shade600,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  )),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 15),
            child: Text("Bağış Yapabileceğin Yerler",
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: Colors.white)),
          ),
          // Padding(
          //   padding: const EdgeInsets.only(left: 15, right: 15, top: 25),
          //   child: IntrinsicHeight(
          //     child: Row(
          //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //       children: [
          //         Expanded(
          //           child: InkWell(
          //             onTap: () {
          //               Navigator.push(
          //                   context,
          //                   MaterialPageRoute(
          //                     builder: (context) => Vakiflar(),
          //                   ));
          //             },
          //             child: Container(
          //               width: 185,
          //               height: 50,
          //               decoration: BoxDecoration(
          //                 color: Colors.red.shade800,
          //                 boxShadow: [
          //                   BoxShadow(
          //                     color: Color.fromARGB(8, 0, 0, 1),
          //                     spreadRadius: 1,
          //                     blurRadius: 1,
          //                   ),
          //                 ],
          //                 borderRadius: BorderRadius.all(Radius.circular(25)),
          //               ),
          //               child: Column(
          //                 mainAxisAlignment: MainAxisAlignment.center,
          //                 children: [

          //                   Text(
          //                     'Acil Yardım Talepleri',
          //                     overflow: TextOverflow.ellipsis,
          //                     textAlign: TextAlign.center,
          //                     style: TextStyle(
          //                       fontSize: 14,
          //                       color: Colors.white,
          //                       fontWeight: FontWeight.bold,
          //                     ),
          //                   ),
          //                 ],
          //               ),
          //             ),
          //           ),
          //         ),
                 
          //       ],
          //     ),
          //   ),
          // ),
          Padding(
            padding: const EdgeInsets.only(left: 15, right: 15, top: 25),
            child: IntrinsicHeight(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Vakiflar(),
                            ));
                      },
                      child: Container(
                        width: 185,
                        padding: EdgeInsets.only(
                          top: 20,
                          bottom: 20,
                          left: 32,
                          right: 32,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.blue.shade600,
                          boxShadow: [
                            BoxShadow(
                              color: Color.fromARGB(8, 0, 0, 1),
                              spreadRadius: 1,
                              blurRadius: 1,
                            ),
                          ],
                          borderRadius: BorderRadius.all(Radius.circular(25)),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.volunteer_activism_rounded,
                                size: 35, color: Colors.white),
                            SizedBox(height: 10),
                            Text(
                              'Vakıflar',
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 20), // İki Container arasında boşluk bırakır
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => dernekler(),
                            ));
                      },
                      child: Container(
                        width: 185,
                        padding: EdgeInsets.only(
                          left: 32,
                          right: 32,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.blue.shade600,
                          boxShadow: [
                            BoxShadow(
                              color: Color.fromARGB(8, 0, 0, 1),
                              spreadRadius: 1,
                              blurRadius: 1,
                            ),
                          ],
                          borderRadius: BorderRadius.all(Radius.circular(25)),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.handshake,
                                size: 35, color: Colors.white),
                            SizedBox(height: 10),
                            Text(
                              'Dernekler',
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Column(children: [
            // ...
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 15, top: 25),
              child: IntrinsicHeight(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => stkuruluslari(),
                              ));
                        },
                        child: Container(
                          width: 185,
                          padding: EdgeInsets.only(
                            top: 20,
                            bottom: 20,
                            left: 32,
                            right: 32,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.blue.shade600,
                            boxShadow: [
                              BoxShadow(
                                color: Color.fromARGB(8, 0, 0, 1),
                                spreadRadius: 1,
                                blurRadius: 1,
                              ),
                            ],
                            borderRadius: BorderRadius.all(Radius.circular(25)),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.health_and_safety_sharp,
                                  size: 35, color: Colors.white),
                              SizedBox(height: 10),
                              Text(
                                'Sivil Toplum \nKuruluşları',
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                        width: 20), // İki Container arasında boşluk bırakır
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => BelediyeKampanyalari(),
                              ));
                        },
                        child: Container(
                          width: 185,
                          padding: EdgeInsets.only(
                            left: 32,
                            right: 32,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.blue.shade600,
                            boxShadow: [
                              BoxShadow(
                                color: Color.fromARGB(8, 0, 0, 1),
                                spreadRadius: 1,
                                blurRadius: 1,
                              ),
                            ],
                            borderRadius: BorderRadius.all(Radius.circular(25)),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.share_location_outlined,
                                  size: 35, color: Colors.white),
                              SizedBox(height: 10),
                              Text(
                                'Belediye \nKampanyaları ',
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            Column(children: [
              // ...
              Padding(
                padding: const EdgeInsets.only(left: 15, right: 15, top: 25),
                child: IntrinsicHeight(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => SmaKampanyalari(),
                                ));
                          },
                          child: Container(
                            width: 185,
                            padding: EdgeInsets.only(
                              left: 32,
                              right: 32,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.blue.shade600,
                              boxShadow: [
                                BoxShadow(
                                  color: Color.fromARGB(8, 0, 0, 1),
                                  spreadRadius: 1,
                                  blurRadius: 1,
                                ),
                              ],
                              borderRadius:
                                  BorderRadius.all(Radius.circular(25)),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.stream_rounded,
                                    size: 35, color: Colors.white),
                                SizedBox(height: 10),
                                Text(
                                  'SMA',
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                          width: 20), // İki Container arasında boşluk bırakır
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => DigerKampanyalar(),
                                ));
                          },
                          child: Container(
                            width: 185,
                            padding: EdgeInsets.only(
                              top: 20,
                              bottom: 20,
                              left: 32,
                              right: 32,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.blue.shade600,
                              boxShadow: [
                                BoxShadow(
                                  color: Color.fromARGB(8, 0, 0, 1),
                                  spreadRadius: 1,
                                  blurRadius: 1,
                                ),
                              ],
                              borderRadius:
                                  BorderRadius.all(Radius.circular(25)),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.bookmark_outline_sharp,
                                    size: 35, color: Colors.white),
                                SizedBox(height: 10),
                                Text(
                                  'Diğer',
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ]),
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25),
              ),
              margin: EdgeInsets.all(15),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.amber.shade700,
                  borderRadius: BorderRadius.all(Radius.circular(25)),
                ),
                child: ListTile(
                  contentPadding: EdgeInsets.all(15),
                  title: Text(
                    "Saranel, bağış kampanyaları için ödeme aracılığı yapmaz veya herhangi bir komisyon almaz. Bağış işlemleri, ilgili organizasyonlar tarafından doğrudan yürütülür. Platform, yalnızca resmi kurumlar tarafından onaylanmış vakıf, dernek, topluluk ve kampanyalar hakkında bilgi sunar. Bağış yapılan yerlerle ilgili yaşanabilecek sorunlardan Saranel sorumlu değildir. \n\nGörüş, öneri ve talepleriniz için iletisim@saranel.com.tr mail adresi üzerinden bize ulaşabilirsiniz.",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                    ),
                    textAlign: TextAlign.start,
                  ),
                  leading: Icon(
                    Icons.warning, // Ünlem simgesi
                    size: 30, // İkon boyutu
                    color: Colors.white, // İkon rengi
                  ),
                ),
              ),
            )
          ]),
        ]));
  }
}

class MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height);
    path.quadraticBezierTo(
        size.width / 2, size.height - 35, size.width, size.height);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
