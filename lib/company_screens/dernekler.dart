import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class dernekler extends StatefulWidget {
  const dernekler({super.key});

  @override
  State<dernekler> createState() => _derneklerState();
}

class _derneklerState extends State<dernekler> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Dernekler", style: appbarStyle()),leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios_sharp,
            color: Colors.blue.shade800,
            size: 19,
          )),),
    );
  }

  TextStyle appbarStyle() => GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.w800);
}