import 'package:flutter/material.dart';

class Kurusluslar extends StatefulWidget {
  const Kurusluslar({super.key});

  @override
  State<Kurusluslar> createState() => _KurusluslarState();
}

class _KurusluslarState extends State<Kurusluslar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
      title: Text("Vakıf ve Dernekler"),
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
}
