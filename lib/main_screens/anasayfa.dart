import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AnaSayfa extends StatefulWidget {
  const AnaSayfa({super.key});

  @override
  State<AnaSayfa> createState() => _AnaSayfaState();
}

class _AnaSayfaState extends State<AnaSayfa> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text("Akış", style: GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.w600))));
  }
}
