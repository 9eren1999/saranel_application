import 'package:flutter/material.dart';

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
      title: Text("Belediye Kampanyaları"),
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
