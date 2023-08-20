import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';

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
      backgroundColor: Color.fromARGB(255, 244, 241, 241),
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text("SMA Kampanyaları"),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios_sharp,
            color: Color.fromARGB(255, 255, 255, 255),
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
              child: CircularProgressIndicator(),
            );
          }

          return ListView.builder(
            itemCount: snapshot.data!.docs.length,
            itemBuilder: (context, index) {
              DocumentSnapshot document = snapshot.data!.docs[index];
              Map<String, dynamic> data =
                  document.data()! as Map<String, dynamic>;

              if (showDetails.length <= index) {
                showDetails.add(false);
              }

              return Card(
                margin: EdgeInsets.only(top: 35, left: 15, right: 15),
                color: Color.fromARGB(255, 255, 255, 251),
                shadowColor: Color.fromARGB(110, 0, 0, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 25, top: 20, bottom: 15),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 15),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(15),
                              child: Image.network(
                                data['image'],
                                height: 100,
                                width: 140,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    data['title1'],
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: const Color.fromARGB(
                                            255, 218, 50, 64)),
                                  ),
                                  SizedBox(width: 10),
                                  Text(
                                    data['aciklama1'],
                                    style: TextStyle(
                                        fontWeight: FontWeight.w100,
                                        fontSize: 14,
                                        color: const Color.fromARGB(
                                            255, 218, 50, 64)),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Text(
                                    data['title2'],
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: const Color.fromARGB(
                                            255, 218, 50, 64)),
                                  ),
                                  SizedBox(width: 10),
                                  Text(
                                    data['aciklama2'],
                                    style: TextStyle(
                                        fontWeight: FontWeight.normal,
                                        color: const Color.fromARGB(
                                            255, 218, 50, 64)),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Divider(), // İnce çizgi
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          showDetails[index] = !showDetails[index];
                        });
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Detayları Gör",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: const Color.fromARGB(255, 218, 50, 64)),
                          ),
                          Icon(
                            Icons.arrow_drop_down,
                            color: const Color.fromARGB(255, 218, 50, 64),
                          ),
                          SizedBox(
                            height: 40,
                          )
                        ],
                      ),
                    ),
                    if (showDetails[index])
                      Padding(
                        padding: const EdgeInsets.all(25.0),
                        child: Column(
                          children: [
                            Text(
                              "Kampanya Tamamlanma Oranı: ${(double.parse(data['bagis']) / 100 * 100).toStringAsFixed(1)}%",
                              style: TextStyle(
                                  color:
                                      const Color.fromARGB(255, 218, 50, 64)),
                            ),
                            LinearProgressIndicator(
                              color: const Color.fromARGB(255, 218, 50, 64),
                              value: double.parse(data['bagis']) / 100,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 30.0, left: 5, right: 0),
                              child: Row(
                                children: [
                                  Text(data['btitle1'],
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: const Color.fromARGB(
                                              255, 218, 50, 64))),
                                  SizedBox(width: 10),
                                  Text(data['iban'],
                                      style: TextStyle(
                                          fontWeight: FontWeight.normal,
                                          color: const Color.fromARGB(
                                              255, 218, 50, 64))),
                                  IconButton(
                                      icon: Icon(
                                        Icons.copy,
                                        size: 15,
                                        color: const Color.fromARGB(
                                            255, 218, 50, 64),
                                      ), // Kopyalama simgesi
                                      onPressed: () {
                                        Clipboard.setData(ClipboardData(
                                                text: data['iban']))
                                            .then(
                                          (_) {
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(
                                              SnackBar(
                                                content:
                                                    Text('IBAN kopyalandı!'),
                                              ),
                                            );
                                          },
                                        );
                                      })
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 0.0, left: 5, right: 0),
                              child: Row(
                                children: [
                                  Text(data['btitle2'],
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: const Color.fromARGB(
                                              255, 218, 50, 64))),
                                  SizedBox(width: 10),
                                  Text(data['alici'],
                                      style: TextStyle(
                                          fontWeight: FontWeight.normal,
                                          color: const Color.fromARGB(
                                              255, 218, 50, 64))),
                          ],
                        ),
                      ),
                       Padding(
                              padding:  EdgeInsets.only(
                                  top: 1.0, left: 5, right: 0),
                              child: Row(
                                children: [
                                  Text(data['btitle3'],
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: const Color.fromARGB(
                                              255, 218, 50, 64))),
                                  SizedBox(width: 10,),
                                  TextButton(
  onPressed: () async {
    String urlString = data['ylink'];
    if (urlString.startsWith("http://") || urlString.startsWith("https://")) {
      Uri url = Uri.parse(urlString);
      if (await canLaunchUrl(url)) {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              content: Container(
                child: Image.network(urlString), // Görseli burada göster
              ),
              actions: [
                TextButton(
                  child: Text("Kapat"),
                  onPressed: () {
                    Navigator.of(context).pop(); // Pop-up penceresini kapat
                  },
                ),
              ],
            );
          },
        );
      } else {
        print("URL başlatılamıyor");
      }
    } else {
      print("Geçersiz URL");
    }
  },
  child: Text(
    "Görüntülemek için tıklayınız.",
    style: TextStyle(
      decoration: TextDecoration.underline,
      fontWeight: FontWeight.normal,
      color: const Color.fromARGB(255, 218, 50, 64),
    ),
  ),
)

                          ],
                        ))],
                ),
              )]));
            },
          );
        },
      ),
    );
  }
}
