import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SmaKampanyalari extends StatefulWidget {
  const SmaKampanyalari({super.key});

  @override
  State<SmaKampanyalari> createState() => _SmaKampanyalariState();
}

class _SmaKampanyalariState extends State<SmaKampanyalari> {
  @override
  Widget build(BuildContext context) {
    CollectionReference sma = FirebaseFirestore.instance.collection('sma');
    return Scaffold(
        appBar: AppBar(
      title: Text("SMA Kampanyaları"),
      leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios_sharp,
            color: Color.fromARGB(255, 23, 190, 219),
            size: 19,
          )),
    ),
    body: StreamBuilder<QuerySnapshot>(
        stream: sma.snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return Text('Bir hata oluştu');
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(), // Yüklenme animasyonu
            );
          }

          return ListView(
            children: snapshot.data!.docs.map((DocumentSnapshot document) {
              Map<String, dynamic> data = document.data()! as Map<String, dynamic>;
              return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 20, width: 20,),
          Align(alignment: Alignment.center,),          
          Image.network(data['image'], height: 200, width: 350, fit: BoxFit.cover,), // Resim
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Padding(padding: 
                    EdgeInsets.only(left: 20)),
                    Text(data['title1']), // Başlık 1
                    SizedBox(width: 10), // Aradaki boşluk
                    Text(data['aciklama1']), // Açıklama 1
                  ],
                ),
                Row(
                  children: [
                    Padding(padding: 
                    EdgeInsets.only(left: 20)),
                    Text(data['title2']), // Başlık 2
                    SizedBox(width: 10), // Aradaki boşluk
                    Text(data['aciklama2']), // Açıklama 2
                  ],
                ),
                Row(
                  children: [
                    Padding(padding: 
                    EdgeInsets.only(left: 20)),
                    Text(data['title3']), // Başlık 3
                  ],
                ),
                Row(
                  children: [
                    Padding(padding: 
                    EdgeInsets.only(left: 20)),
                    Text(data['title4']), // Başlık 4
                    SizedBox(width: 10), // Aradaki boşluk
                    Text(data['aciklama3']), // Açıklama 3
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }).toList(),
      );
    })); }}  
