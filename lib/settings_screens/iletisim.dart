import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class iletisim extends StatelessWidget {
  const iletisim({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "İletişim",
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
      body: Padding(
        padding: const EdgeInsets.only(top: 20, left: 8, right: 8),
        child: Card(
          elevation: 1,
          color: Colors.blue.shade600,
          shadowColor: Color.fromARGB(55, 0, 0, 0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    left: 10,
                  ),
                  child: ListTile(
                    title: Text(
                      "iletisim@saranel.com.tr",
                      style: TextStyle(
                        color: const Color.fromARGB(255, 255, 255, 255),
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    leading: Icon(Icons.mail_outlined,
                        color: const Color.fromARGB(255, 255, 255, 255)),
                  ),
                ),
                Divider(
                    color: Color.fromARGB(200, 236, 234, 234),
                    height: 0.1,
                    indent: 20,
                    endIndent: 20),
                Padding(
                  padding: const EdgeInsets.only(left: 12),
                  child: ListTile(
                    title: Text(
                      "saranelplatformu",
                      style: TextStyle(
                        color: const Color.fromARGB(255, 252, 252, 252),
                        fontSize: 12,
                        fontWeight: FontWeight.w100,
                      ),
                    ),
                    leading: Image(
                      image: AssetImage('assets/images/instalogo.png'),
                      width: 22,
                      height: 22,
                      color: const Color.fromARGB(255, 255, 255, 255),
                    ),
                  ),
                ),
                Divider(
                    color: Color.fromARGB(200, 236, 234, 234),
                    height: 0.1,
                    indent: 20,
                    endIndent: 20),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 10,
                  ),
                  child: ListTile(
                    title: Text(
                      "www.saranel.com.tr",
                      style: TextStyle(
                        color: const Color.fromARGB(255, 255, 255, 255),
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    leading: Icon(Icons.language,
                        color: const Color.fromARGB(255, 255, 255, 255)),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
