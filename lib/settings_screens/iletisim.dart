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
        padding: const EdgeInsets.all(5.0),
        child: Card(
          elevation: 1,
          color: Color.fromARGB(255, 255, 255, 251),
          shadowColor: Color.fromARGB(55, 0, 0, 0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                ListTile(
                  title: Text(
                    "iletisim@saranel.com.tr",
                    style: TextStyle(
                      color: Colors.blue.shade800,
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  leading:
                      Icon(Icons.mail_outlined, color: Colors.blue.shade800),
                ),
                Divider(color: Color.fromARGB(255, 236, 234, 234), height: 0.1),
                ListTile(
                  title: Text(
                    "saranelcom",
                    style: TextStyle(
                      color: Colors.blue.shade800,
                      fontSize: 14,
                      fontWeight: FontWeight.w100,
                    ),
                  ),
                  leading: Image.network(
                    "https://freepngimg.com/download/logo/62837-instagram-icons-photography-computer-logo-icon.png",
                    width: 30,
                    color: Colors.blue.shade800,
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
