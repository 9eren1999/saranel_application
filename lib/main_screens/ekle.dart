import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class IlanEkle extends StatefulWidget {
  const IlanEkle({super.key});

  @override
  State<IlanEkle> createState() => _IlanEkleState();
}

class _IlanEkleState extends State<IlanEkle> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Yeni İlan ekle", style: GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.w800)), ),
    );
  }
}