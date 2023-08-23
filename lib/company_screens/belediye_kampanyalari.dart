import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BelediyeKampanyalari extends StatefulWidget {
  const BelediyeKampanyalari({super.key});

  @override
  State<BelediyeKampanyalari> createState() => _BelediyeKampanyalariState();
}

class _BelediyeKampanyalariState extends State<BelediyeKampanyalari> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
      title: Text("Belediye Kampanyaları", style: appbarStyle()),
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
