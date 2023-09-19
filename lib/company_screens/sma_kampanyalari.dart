import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class SmaKampanyalari extends StatefulWidget {
  const SmaKampanyalari({Key? key}) : super(key: key);

  @override
  State<SmaKampanyalari> createState() => _SmaKampanyalariState();
}

class _SmaKampanyalariState extends State<SmaKampanyalari> {
  List<bool> showDetails = [];
  late Future<List<Map<String, dynamic>>> _dataFuture;
  bool isExpanded = false;

  @override
  void initState() {
    super.initState();
    _dataFuture = fetchDataFromFirebaseOnce();
  }

  Future<void> saveDataToLocal(List<Map<String, dynamic>> documents) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('sma_data', jsonEncode(documents));
    await prefs.setInt(
        'last_fetch_time', DateTime.now().millisecondsSinceEpoch);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: false,
      appBar: AppBar(
        title: Text("SMA Kampanyaları",
            style:
                GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.w800)),
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
      body: FutureBuilder(
        future: _dataFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(color: Colors.white),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Padding(
                padding: const EdgeInsets.all(18.0),
                child: Text(
                  'Veri alınırken bir hata oluştu. Lütfen daha sonra tekrar deneyiniz.',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white, fontSize: 12),
                ),
              ),
            );
          } else {
            List<Map<String, dynamic>> data =
                snapshot.data as List<Map<String, dynamic>>;
            return buildListViewFromLocalData(data);
          }
        },
      ),
    );
  }

  Future<List<Map<String, dynamic>>> fetchDataFromFirebaseOnce() async {
    final prefs = await SharedPreferences.getInstance();
    final lastFetchTime = prefs.getInt('last_fetch_time') ?? 0;
    final currentTime = DateTime.now().millisecondsSinceEpoch;

    final data = prefs.getString('sma_data');
    if (data != null && currentTime - lastFetchTime < 86400000) {
      //24 saatte bir çeksin
      List<Map<String, dynamic>> decodedData =
          List<Map<String, dynamic>>.from(jsonDecode(data));
      decodedData.shuffle(); // Cached data shuffle
      return decodedData;
    } else {
      QuerySnapshot querySnapshot =
          await FirebaseFirestore.instance.collection('sma').get();
      List<Map<String, dynamic>> docs = querySnapshot.docs
          .map((doc) => doc.data() as Map<String, dynamic>)
          .toList();
      docs.shuffle(); // New fetch data shuffle
      await saveDataToLocal(docs);
      return docs;
    }
  }

  Widget buildListViewFromLocalData(List<Map<String, dynamic>> data) {
    return ListView.builder(
      itemCount: data.length,
      itemBuilder: (context, index) {
        if (showDetails.length <= index) {
          showDetails.add(false);
        }

        return buildCard(data[index], index);
      },
    );
  }

  Widget buildCard(Map<String, dynamic> data, int index) {
    return Card(
        margin: EdgeInsets.only(top: 20, left: 17, right: 17, bottom: 10),
        color: Colors.blue.shade600,
        shadowColor: Color.fromARGB(110, 0, 0, 0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Padding(
            padding: const EdgeInsets.only(left: 20, top: 15, bottom: 6),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 15),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Image.network(
                      data['image'],
                      height: 100,
                      width: 165,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Ad Soyad",
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: const Color.fromARGB(255, 253, 253, 253)),
                      ),
                      Text(
                        data['aciklama1'],
                        style: TextStyle(
                            fontWeight: FontWeight.w100,
                            fontSize: 12,
                            color: const Color.fromARGB(255, 255, 255, 255)),
                      ),
                      SizedBox(height: 10), // Bu satırı ekledim
                      Text(
                        "Kampanya Türü",
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: const Color.fromARGB(255, 255, 255, 255)),
                      ),
                      SizedBox(width: 10),
                      Text(
                        "SMA",
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.normal,
                            color: const Color.fromARGB(255, 255, 255, 255)),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Divider(
            color: Colors.blue.shade800,
            thickness: 2,
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 5,
            ),
            child: Center(
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    showDetails[index] = !showDetails[index];
                    isExpanded = !isExpanded;
                  });
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Kampanya Detayları ",
                      style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: const Color.fromARGB(255, 250, 250, 250)),
                    ),
                    Icon(
                      isExpanded ? Icons.arrow_drop_up : Icons.arrow_drop_down,
                      color: Color.fromARGB(255, 255, 255, 255),
                    ),
                  ],
                ),
              ),
            ),
          ),
          if (showDetails[index])
            Padding(
              padding: const EdgeInsets.only(
                right: 25,
                left: 25,
                top: 15,
              ),
              child: Column(children: [
                Text(
                  "Kampanya Tamamlanma Oranı: ${(double.parse(data['bagis']) / 100 * 100).toStringAsFixed(1)}%",
                  style: TextStyle(
                      fontSize: 12, color: Color.fromARGB(255, 255, 255, 255)),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 35, right: 35, top: 4, bottom: 15),
                  child: LinearProgressIndicator(
                    color: Color.fromARGB(255, 159, 230, 79),
                    value: double.parse(data['bagis']) / 100,
                  ),
                ),
                Row(children: <Widget>[
                  Expanded(
                    child: Divider(
                      color: Colors.blue.shade100,
                      thickness: 0.3,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Text("Banka Bilgileri",
                        style: TextStyle(
                            fontSize: 11, color: Colors.blue.shade100)),
                  ),
                  Expanded(
                    child: Divider(
                      color: Colors.blue.shade100,
                      thickness: 0.3,
                    ),
                  ),
                ]),
                Padding(
                  padding: const EdgeInsets.only(left: 1, right: 0, top: 10),
                  child: Row(
                    children: [
                      Text("Banka:",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                              color: const Color.fromARGB(255, 255, 255, 255))),
                      SizedBox(width: 5),
                      Flexible(
                        // Bu satırı ekledim
                        child: Text(data['banka2'],
                            softWrap: true,
                            style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.normal,
                                color:
                                    const Color.fromARGB(255, 249, 249, 250))),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 1),
                  child: Row(
                    children: [
                      Text("IBAN:",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                              color: const Color.fromARGB(255, 255, 255, 255))),
                      SizedBox(width: 5),
                      Flexible(
                        child: Text(data['iban'],
                            softWrap: true,
                            style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.normal,
                                color:
                                    const Color.fromARGB(255, 249, 249, 250))),
                      ),
                      IconButton(
                          icon: Icon(
                            Icons.copy,
                            size: 13,
                            color: const Color.fromARGB(255, 253, 253, 253),
                          ),
                          onPressed: () {
                            Clipboard.setData(ClipboardData(text: data['iban']))
                                .then(
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
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 1),
                  child: Row(
                    children: [
                      Text("Alıcı:",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                              color: const Color.fromARGB(255, 255, 255, 255))),
                      SizedBox(width: 5),
                      Flexible(
                        // Bu satırı ekledim
                        child: Text(data['alici'],
                            softWrap: true,
                            style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.normal,
                                color:
                                    const Color.fromARGB(255, 249, 249, 250))),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 1, right: 0, top: 12, bottom: 25),
                  child: Row(
                    children: [
                      Text("Açıklama:",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                              color: const Color.fromARGB(255, 255, 255, 255))),
                      SizedBox(width: 5),
                      Flexible(
                        // Bu satırı ekledim
                        child: Text(data['aciklamasi'],
                            softWrap: true,
                            style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.normal,
                                color:
                                    const Color.fromARGB(255, 249, 249, 250))),
                      ),
                    ],
                  ),
                ),
                Row(children: <Widget>[
                  Expanded(
                    child: Divider(
                      color: Colors.blue.shade100,
                      thickness: 0.3,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Text("Kampanya İzinleri",
                        style: TextStyle(
                            fontSize: 11, color: Colors.blue.shade100)),
                  ),
                  Expanded(
                    child: Divider(
                      color: Colors.blue.shade100,
                      thickness: 0.3,
                    ),
                  ),
                ]),
                Padding(
                  padding: EdgeInsets.only(left: 1, bottom: 10),
                  child: Row(
                    children: [
                      Text("Yasal İzin:",
                          style: TextStyle(
                              fontSize: 12,
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
                                              fontSize: 12,
                                              color: const Color.fromARGB(
                                                  255, 255, 255, 255))),
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
                            softWrap:
                                true, // Metnin yumuşak bir şekilde taşmasına izin ver
                            style: TextStyle(
                              decoration: TextDecoration.underline,
                              fontWeight: FontWeight.normal,
                              fontSize: 12,
                              color: const Color.fromARGB(255, 255, 255, 255),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Row(children: <Widget>[
                  Expanded(
                    child: Divider(
                      color: Colors.blue.shade100,
                      thickness: 0.3,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Text("Diğer Bilgiler",
                        style: TextStyle(
                            fontSize: 11, color: Colors.blue.shade100)),
                  ),
                  Expanded(
                    child: Divider(
                      color: Colors.blue.shade100,
                      thickness: 0.3,
                    ),
                  ),
                ]),
                Padding(
                  padding: const EdgeInsets.only(left: 5, bottom: 5, top: 15),
                  child: Row(
                    children: [
                      Text("Detaylar:",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                              color: const Color.fromARGB(255, 255, 255, 255))),
                      SizedBox(width: 10),
                      Flexible(
                        // Bu satırı ekledim
                        child: Text(data['detayaciklama'],
                            softWrap: true,
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.normal,
                                color:
                                    const Color.fromARGB(255, 249, 249, 250))),
                      ),
                    ],
                  ),
                ),
              ]),
            ),
          Padding(padding: EdgeInsets.only(bottom: 15)),
        ]));
  }

  Widget buildListViewFromMapData(List<Map<String, dynamic>> data) {
    return ListView.builder(
      itemCount: data.length,
      itemBuilder: (context, index) {
        if (showDetails.length <= index) {
          showDetails.add(false);
        }

        Map<String, dynamic> dataMap = data[index];
        return buildCard(dataMap, index);
      },
    );
  }
}
