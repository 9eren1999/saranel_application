import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class SmaKampanyalari extends StatefulWidget {
  const SmaKampanyalari({super.key});

  @override
  State<SmaKampanyalari> createState() => _SmaKampanyalariState();
}

class _SmaKampanyalariState extends State<SmaKampanyalari> {
  List<bool> showDetails = [];

  @override
  Widget build(BuildContext context) {
    CollectionReference sma = FirebaseFirestore.instance.collection('sma');
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text("SMA Kampanyaları" ,style: GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.w800)),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios_sharp,
            color: Colors.blue.shade800,
            size: 19,
          ),
        ),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: sma.snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return Text('Bir hata oluştu');
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(color: Colors.white),
            );
          }

          return ListView.builder(
            itemCount: snapshot.data!.docs.length,
            itemBuilder: (context, index) {
              DocumentSnapshot document = snapshot.data!.docs[index];
              Map<String, dynamic> data =
                  document.data()! as Map<String, dynamic>;

              if (showDetails.length <= index) {
                showDetails.add(true);
              }

              return Card(
  margin: EdgeInsets.only(top: 35, left: 15, right: 15,),
  color: Colors.blue.shade600,
  shadowColor: Color.fromARGB(110, 0, 0, 0),
  child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Padding(
        padding: const EdgeInsets.only(left: 25, top: 20, bottom: 15),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 15),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.network(
                  data['image'],
                  height: 110,
                  width: 140,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Flexible( 
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    data['title1'],
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: const Color.fromARGB(255, 253, 253, 253)),
                  ),
                  SizedBox(height: 0), // Bu satırı ekledim
                  Text(
                    data['aciklama1'],
                    style: TextStyle(
                        fontWeight: FontWeight.w100,
                        fontSize: 14,
                        color: const Color.fromARGB(255, 255, 255, 255)),
                  ),
                  SizedBox(height: 10), // Bu satırı ekledim
                  Text(
                    data['title2'],
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: const Color.fromARGB(255, 255, 255, 255)),
                  ),
                  SizedBox(width: 10),
                  Text(
                    data['aciklama2'],
                    style: TextStyle(
                        fontWeight: FontWeight.normal,
                        color: const Color.fromARGB(255, 255, 255, 255)),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
                    Divider(), // İnce çizgi
                    Center(
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            showDetails[index] = !showDetails[index];
                          });
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Kampanya Detayları ",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: const Color.fromARGB(255, 250, 250, 250)),
                            ),
                            Icon(
                              Icons.arrow_drop_down,
                              color: Color.fromARGB(255, 255, 255, 255),
                            ),
                            SizedBox(
                              height: 40,
                            )
                          ],
                        ),
                      ),
                    ),
                    if (showDetails[index])
                      Padding(
                        padding: const EdgeInsets.only(right: 25, left: 25, top: 15),
                        child: Column(
                          children: [
                            Text(
                              "Kampanya Tamamlanma Oranı: ${(double.parse(data['bagis']) / 100 * 100).toStringAsFixed(1)}%",
                              style: TextStyle( fontSize: 13,
                                  color:
                                      Color.fromARGB(255, 255, 255, 255)),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 35, right: 35, top:4),
                              child: LinearProgressIndicator(
                                color: Color.fromARGB(255, 159, 230, 79),
                                                   value: double.parse(data['bagis']) / 100,
                              ),
                            ),Padding(
  padding: const EdgeInsets.only( left: 1, right: 0, top: 25),
  child: Row(
    children: [
      Text(data['banka'],
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 14,
              color: const Color.fromARGB(255, 255, 255, 255))),
      SizedBox(width: 5),
      Flexible( // Bu satırı ekledim
        child: Text(data['banka2'],
            softWrap: true,
            style: TextStyle(
              fontSize: 14,
                fontWeight: FontWeight.normal,
                color: const Color.fromARGB(255, 249, 249, 250))),
      ),
     
    ],
  ),
),
                            Padding(
  padding: const EdgeInsets.only(top: 0.0, left: 1, right: 0),
  child: Row(
    children: [
      Text(data['btitle1'],
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 14,
              color: const Color.fromARGB(255, 255, 255, 255))),
      SizedBox(width: 5),
      Flexible(
        child: Text(data['iban'],
            softWrap: true,
            style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.normal,
                color: const Color.fromARGB(255, 249, 249, 250))),
      ),
      IconButton(
          icon: Icon(
            Icons.copy,
            size: 14,
            color: const Color.fromARGB(255, 253, 253, 253),
          ),
          onPressed: () {
            Clipboard.setData(ClipboardData(text: data['iban'])).then(
              (_) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('IBAN kopyalandı!'),
                  ),
                );
              },
            );
          })
    ],
  ),
),Padding(
  padding: const EdgeInsets.only( left: 1, right: 0, top: 0),
  child: Row(
    children: [
      Text(data['btitle2'],
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 14,
              color: const Color.fromARGB(255, 255, 255, 255))),
      SizedBox(width: 5),
      Flexible( // Bu satırı ekledim
        child: Text(data['alici'],
            softWrap: true,
            style: TextStyle(
              fontSize: 14,
                fontWeight: FontWeight.normal,
                color: const Color.fromARGB(255, 249, 249, 250))),
      ),
     
    ],
  ),
),Padding(
  padding: EdgeInsets.only(left: 1, right: 0),
  child: Row(
    children: [
      Text(data['btitle3'],
          style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: const Color.fromARGB(255, 253, 253, 253))),
      Flexible(
        child: TextButton(
          onPressed: () {
            String urlString = data['ylink'];

            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  backgroundColor: Colors.blue.shade800,
                  content: Container(
                    child: Image.network(urlString),
                  ),
                  actions: [
                    TextButton(
                      child: Text("Kapat",
                          style: TextStyle(
                              color: const Color.fromARGB(255, 255, 255, 255))),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ],
                );
              },
            );
          },
          child: Text(
            "Görüntülemek için tıklayınız.",
            softWrap: true, // Metnin yumuşak bir şekilde taşmasına izin ver
            style: TextStyle(
              decoration: TextDecoration.underline,
              fontWeight: FontWeight.normal,
              fontSize: 13,
              color: const Color.fromARGB(255, 255, 255, 255),
            ),
          ),
        ),
      ),
    ],
  ),
),

Padding(
  padding: const EdgeInsets.only( left: 5, right: 0, top: 5),
  child: Row(
    children: [
      Text(data['detay'],
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 14,
              color: const Color.fromARGB(255, 255, 255, 255))),
      SizedBox(width: 10),
      Flexible( // Bu satırı ekledim
        child: Text(data['detayaciklama'], 
            softWrap: true, textAlign: TextAlign.left,
            style: TextStyle(  
              fontSize: 14,
                fontWeight: FontWeight.normal,
                color: const Color.fromARGB(255, 249, 249, 250))),
      ),
     
    ],
  ),
),



    ]),
    
              ),Padding(padding: EdgeInsets.only(bottom:20))]));
            },
          );
        },
      ),
    );
  }
}
