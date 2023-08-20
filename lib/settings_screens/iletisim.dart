import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class iletisim extends StatelessWidget {
  const iletisim({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Bize Ulaş",
            style:
                GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.w600),
          ),
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.arrow_back_ios_sharp,
                color: Color.fromARGB(255, 255, 255, 255),
                size: 19,
              )),
        ),
        body: Container(
            child: Padding(
                padding: const EdgeInsets.only(top: 5, left: 5, right: 5),
                child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Container(
                        width: 400,
                        height: 135,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          boxShadow: [
                            BoxShadow(
                              color: Color.fromRGBO(243, 240, 240, 1)
                                  .withOpacity(0.9),
                              spreadRadius: 900,
                              blurRadius: 0.1,
                              offset: Offset(0, 1),
                            ),
                          ],
                        ),
                        //İletişim
                        child: Card(
                            elevation: 1,
                            color: Color.fromARGB(255, 255, 255, 251),
                            shadowColor: Color.fromARGB(55, 0, 0, 0),
                            child: Column(children: [
                              Padding(
                                  padding: const EdgeInsets.only(
                                      bottom: 0, left: 2, right: 10, top: 10),
                                  child: ListTile(
                                      title: Text(
                                        "iletisim@saranel.com",
                                        style: TextStyle(
                                          color:
                                              Color.fromARGB(255, 218, 50, 64),
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600,
                                        ),
                                        textAlign: TextAlign.start,
                                      ),
                                      leading: Icon(Icons.mail_outlined,
                                          color:
                                              Color.fromARGB(255, 218, 50, 64)),
                                      )),  Padding(
                        padding: EdgeInsets.only(left: 20, right: 20,),
                        child: Divider(color: Color.fromARGB(255, 236, 234, 234),height: 0.1),
                      ),
                        // Sıkça Sorulan Sorular
                      Padding(
                        padding: const EdgeInsets.only(left: 20, right: 20,),
                        child: Divider(color: Color.fromARGB(255, 236, 234, 234),height: 0.1),
                      ),
                        Padding(
                          padding: const EdgeInsets.only(
                              bottom: 0, top: 0, left: 0, right: 10),
                          child: ListTile(
                            title: Text(
                              "@saranelcom",
                              style: TextStyle(
                                color: Color.fromARGB(255, 218, 50, 64),
                                fontSize: 14,
                                fontWeight: FontWeight.w100,
                              ),
                              textAlign: TextAlign.start,
                            ),
                            leading: Image.network("https://freepngimg.com/download/logo/62837-instagram-icons-photography-computer-logo-icon.png", width: 30, color: Color.fromARGB(255, 218, 50, 64),)))],
                          ),
                        ),
                            )))));
  }
}
