import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:saranel_application/settings_screens/iletisim.dart';

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
        "Ayarlar",
        style: GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.w600),
      )),
      body: ListView(
        children: [
          Padding(
            padding:
                const EdgeInsets.only(top: 20, left: 12, right: 12, bottom: 25),
            child: Container(
              width: 350,
              height: 310,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(15)),
                boxShadow: [
                  BoxShadow(
                    color: Color.fromRGBO(243, 240, 240, 1).withOpacity(0.9),
                    spreadRadius: 500,
                    blurRadius: 0.1,
                    offset: Offset(0, 1),
                  ),
                ],
              ),
              child: Card(
                color: Color.fromARGB(255, 218, 50, 64),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15))),
                margin: EdgeInsets.all(0),
                child: SizedBox(
                  width:
                      350, //Boyut buradan değil bir üst satırdaki container'dan ayarlanır.
                  height: 285,
                  child: Padding(
                    padding: EdgeInsets.only(top: 20, left: 22, right: 22),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "Saraneli Desteklemek İster Misiniz?",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Color.fromARGB(255, 248, 248, 248),
                              fontSize: 15,
                              fontWeight: FontWeight.w600),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Text(
                          "Saranel, yardım ve bağışların etkin bir şekilde derlenip yönlendirilmesi amacıyla kurulmuş ücretsiz bir platformdur. Fakat, sunucu giderleri ve diğer operasyonel alanlarda faaliyetlerimizi sürdürebilmek için siz değerli bağışçılarımızın desteğine ihtiyaç duyuyoruz. Saranel'e yapacağınız destek, tüm bu önemli faaliyetlerin devamlılığını sağlayacaktır. Siz de Saranel'i destekleyerek, toplumsal dayanışma ve yardımlaşma misyonumuzun bir parçası olabilirsiniz.",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Color.fromARGB(255, 255, 255, 255),
                              fontSize: 12,
                              fontWeight: FontWeight.w100),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        ElevatedButton(
                          onPressed: () {},
                          child: Text(
                            "Saranel'i Destekle!",
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              color: Color.fromARGB(255, 218, 50, 64),
                            ),
                          ),
                          style: ButtonStyle(
                              backgroundColor: MaterialStatePropertyAll(
                                  Color.fromARGB(255, 255, 255, 255))),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(2.0),
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    boxShadow: [
                      BoxShadow(
                        color:
                            Color.fromRGBO(129, 121, 121, 0).withOpacity(0.0),
                        spreadRadius: 0,
                        blurRadius: 0.1,
                        offset: Offset(0, 0),
                      ),
                    ],
                  ),
                  //İletişim
                  child: Card(
                      color: Color.fromARGB(255, 255, 255, 251),
                      shadowColor: Color.fromARGB(55, 0, 0, 0),
                      child: Column(children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              bottom: 0, left: 10, right: 10, top: 0),
                          child: ListTile(
                            title: Text(
                              "İletişim",
                              style: TextStyle(
                                color: Color.fromARGB(255, 218, 50, 64),
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                              ),
                              textAlign: TextAlign.start,
                            ),
                            trailing: Icon(Icons.navigate_next_outlined,
                                color: Color.fromARGB(255, 218, 50, 64)),
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => iletisim()));
                            },
                          ),
                        ),

                        // Geliştiriciler
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
                              "Geliştiriciler",
                              style: TextStyle(
                                color: Color.fromARGB(255, 218, 50, 64),
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                              ),
                              textAlign: TextAlign.start,
                            ),
                            trailing: Icon(Icons.navigate_next_outlined,
                                color: Color.fromARGB(255, 218, 50, 64)),
                            onTap: () {},
                          ),
                        ),

                        // Sıkça Sorulan Sorular
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
                              "Sıkça Sorulan Sorular",
                              style: TextStyle(
                                color: Color.fromARGB(255, 218, 50, 64),
                                fontSize: 14,
                                fontWeight: FontWeight.w100,
                              ),
                              textAlign: TextAlign.start,
                            ),
                            trailing: Icon(Icons.navigate_next_outlined,
                                color: Color.fromARGB(255, 218, 50, 64)),
                            onTap: () {},
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
                                color: Color.fromARGB(255, 218, 50, 64),
                                fontSize: 14,
                                fontWeight: FontWeight.w100,
                              ),
                              textAlign: TextAlign.start,
                            ),
                            trailing: Icon(Icons.navigate_next_outlined,
                                color: Color.fromARGB(255, 218, 50, 64)),
                            onTap: () {},
                          ),
                        ),
                      ]))),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 75),
            child: Center(
              child: Text(
                "Saranel 2023. Tüm Hakları Saklıdır.",
                style: TextStyle(
                    fontSize: 12, color: Color.fromARGB(255, 218, 50, 64)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
