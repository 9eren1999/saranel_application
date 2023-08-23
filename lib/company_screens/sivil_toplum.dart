import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class stkuruluslari extends StatefulWidget {
  const stkuruluslari({super.key});

  @override
  State<stkuruluslari> createState() => _stkuruluslariState();
}

class _stkuruluslariState extends State<stkuruluslari> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Sivil Toplum Kuruluşları",
          style: appbarStyle(),
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
    );
  }

  TextStyle appbarStyle() => GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.w800);
}
