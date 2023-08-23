import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DigerKampanyalar extends StatefulWidget {
  const DigerKampanyalar({super.key});

  @override
  State<DigerKampanyalar> createState() => _DigerKampanyalarState();
}

class _DigerKampanyalarState extends State<DigerKampanyalar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
      title: Text(
        "Diğer Kampanyalar",
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
    ));
  }

  TextStyle appbarStyle() => GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.w800);
}
