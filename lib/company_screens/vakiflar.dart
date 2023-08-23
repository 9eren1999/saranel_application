import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Vakiflar extends StatefulWidget {
  const Vakiflar({super.key});

  @override
  State<Vakiflar> createState() => _VakiflarState();
}

class _VakiflarState extends State<Vakiflar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
      title: Text("Vakıflar", style: appbarStyle()),
      leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios_sharp,
            color: Colors.blue.shade800,
            size: 19,
          )),
    ));
  }

  TextStyle appbarStyle() =>
      GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.w800);
}
