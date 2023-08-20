import 'package:flutter/material.dart';

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
      title: Text("Diğer Kampanyalar"),
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
