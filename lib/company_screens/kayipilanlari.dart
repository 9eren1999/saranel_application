import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class KayipIlaniPage extends StatefulWidget {
  const KayipIlaniPage({super.key});

  @override
  State<KayipIlaniPage> createState() => _KayipIlaniPageState();
}

class _KayipIlaniPageState extends State<KayipIlaniPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
          title: Text("Kayıp İlanları", style: appbarStyle()),
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
}

TextStyle appbarStyle() =>
    GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.w800);