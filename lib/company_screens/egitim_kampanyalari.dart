import 'package:flutter/material.dart';

class EgitimKampanyalari extends StatefulWidget {
  const EgitimKampanyalari({super.key});

  @override
  State<EgitimKampanyalari> createState() => _EgitimKampanyalariState();
}

class _EgitimKampanyalariState extends State<EgitimKampanyalari> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
      title: Text("Eğitim Kampanyaları"),
      leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios_sharp,
            color: Color.fromARGB(255, 255, 255, 255),
            size: 19,
          )),
    ));
  }
}
