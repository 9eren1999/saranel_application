import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Sss extends StatelessWidget {
  const Sss({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Sıkça Sorulan Sorular",
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
          child: ListView(
            padding: EdgeInsets.all(10),
            children: [
              Center(
                child: Text(
                  "SSS",
                  style: TextStyle(
                    color: Colors.blue.shade800,
                    fontSize: 14,
                    fontWeight: FontWeight.w800,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(30.0),
                child: Text(
                  "metin\nmetin\nmetin\nmetin\nmetin\nmetin\nmetin\nmetin\nmetin\nmetin\nmetin\nmetin\nmetin\nmetin\nmetin\nmetin\n",
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
