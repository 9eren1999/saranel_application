import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class SmaKampanyalari extends StatefulWidget {
  const SmaKampanyalari({super.key});

  @override
  State<SmaKampanyalari> createState() => _SmaKampanyalariState();
}

class _SmaKampanyalariState extends State<SmaKampanyalari> {
  List<bool> showDetails = [];
  List<Map<String, dynamic>>? localData;
  Stream<QuerySnapshot>? smaStream;
  bool shouldFetchFromFirestore = false;
  bool dataFetched = false;

  late Future<void> _initializationFuture;

  @override
  void initState() {
    super.initState();
    _initializationFuture = initializeData();
  }

  Future<void> initializeData() async {
    localData = await fetchDataFromLocal();
    if (localData == null || localData!.isEmpty) {
      List<String> ids = await fetchAllSmaIds();
      if (ids.isNotEmpty) {
        smaStream = FirebaseFirestore.instance
            .collection('sma')
            .where(FieldPath.documentId, whereIn: ids)
            .snapshots();
        setState(() {
          shouldFetchFromFirestore = true;
        });
      } else {
        Text("Veri alınamadı.");
      }
    } else {
      localData!.shuffle();
    }
  }

  Future<void> saveDataToLocal(List<Map<String, dynamic>> documents) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('sma_data', jsonEncode(documents));
    await prefs.setInt(
        'last_fetch_time', DateTime.now().millisecondsSinceEpoch);
  }

  Widget buildListViewFromFirebaseData(List<DocumentSnapshot> data) {
    return ListView.builder(
      itemCount: data.length,
      itemBuilder: (context, index) {
        if (showDetails.length <= index) {
          showDetails.add(false);
        }

        Map<String, dynamic> dataMap =
            data[index].data() as Map<String, dynamic>;
        return buildCard(dataMap, index);
      },
    );
  }

  Future<List<Map<String, dynamic>>?> fetchDataFromLocal() async {
    final prefs = await SharedPreferences.getInstance();
    final lastFetchTime = prefs.getInt('last_fetch_time') ?? 0;
    final currentTime = DateTime.now().millisecondsSinceEpoch;

    if (currentTime - lastFetchTime < 60000) {
      // 1 dakika kontrolü
      final data = prefs.getString('sma_data');
      if (data != null) {
        return List<Map<String, dynamic>>.from(jsonDecode(data));
      }
    }
    return null;
  }

  Future<List<String>> fetchAllSmaIds() async {
    final prefs = await SharedPreferences.getInstance();
    final lastFetchTime = prefs.getInt('sma_ids_last_fetch_time') ?? 0;
    final currentTime = DateTime.now().millisecondsSinceEpoch;

    // 24 saat kontrolü (86400000 ms = 24 saat)
    if (currentTime - lastFetchTime >= 60000) {
      DocumentSnapshot doc = await FirebaseFirestore.instance
          .collection('allsma')
          .doc('7DNg1yOoUq6v2zSXO84K')
          .get();
      Map<String, dynamic> data = doc.data() as Map<String, dynamic>;

      List<String> ids = [];
      data.forEach((key, value) {
        if (key.startsWith('id')) {
          ids.add(value as String);
        }
      });

      // Yeni ID'leri ve güncel zaman damgasını yerel depolamaya kaydedin
      await prefs.setStringList('sma_ids', ids);
      await prefs.setInt('sma_ids_last_fetch_time', currentTime);

      return ids;
    } else {
      // Yerel depolamadan ID'leri alın
      return prefs.getStringList('sma_ids') ?? [];
    }
  }

  @override
  Widget build(BuildContext context) {
    // CollectionReference sma = FirebaseFirestore.instance.collection('sma');
    return Scaffold(
      extendBodyBehindAppBar: true,
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
        future: _initializationFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator();
          } else if (snapshot.hasError) {
            return Text('Bir hata oluştu');
          } else {
            return localData != null
                ? buildListViewFromLocalData(localData!)
                : (shouldFetchFromFirestore
                    ? FutureBuilder(
                        future: fetchDataFromFirebaseOnce(),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return CircularProgressIndicator();
                          } else if (snapshot.hasError) {
                            return Text('Bir hata oluştu');
                          } else {
                            List<DocumentSnapshot> data =
                                snapshot.data as List<DocumentSnapshot>;
                            return buildListViewFromFirebaseData(
                                data); // Bu fonksiyonu tanımlamanız gerekmekte
                          }
                        },
                      )
                    : CircularProgressIndicator());
          }
        },
      ),
    );
  }

  Future<List<Map<String, dynamic>>> fetchDataFromFirebaseOnce() async {
    final prefs = await SharedPreferences.getInstance();
    final lastFetchTime = prefs.getInt('last_fetch_time') ?? 0;
    final currentTime = DateTime.now().millisecondsSinceEpoch;

    if (!dataFetched && currentTime - lastFetchTime >= 60000) {
      // 1 dakika kontrolü
      QuerySnapshot querySnapshot =
          await FirebaseFirestore.instance.collection('sma').get();
      List<Map<String, dynamic>> docs = querySnapshot.docs
          .map((doc) => doc.data() as Map<String, dynamic>)
          .toList();

      // Verileri yerel depolamaya kaydedin
      await saveDataToLocal(docs);

      setState(() {
        localData = docs;
        dataFetched = true; // Veriler çekildi, flag'i true olarak ayarlayın
      });

      return docs;
    } else {
      // Yerel depolamadan verileri alın
      final data = prefs.getString('sma_data');
      if (data != null) {
        List<Map<String, dynamic>> decodedData =
            List<Map<String, dynamic>>.from(jsonDecode(data));
        return decodedData;
      }
    }
    return [];
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
        margin: EdgeInsets.only(top: 15, left: 15, right: 15, bottom: 12),
        color: Colors.blue.shade600,
        shadowColor: Color.fromARGB(110, 0, 0, 0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
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
                        "Ad Soyad",
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
                        "Kampanya Türü",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: const Color.fromARGB(255, 255, 255, 255)),
                      ),
                      SizedBox(width: 10),
                      Text(
                        "SMA",
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
          Divider(
            color: Colors.blue.shade800,
            thickness: 4,
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
                      height: 30,
                    )
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
                      fontSize: 13, color: Color.fromARGB(255, 255, 255, 255)),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 35, right: 35, top: 4, bottom: 35),
                  child: LinearProgressIndicator(
                    color: Color.fromARGB(255, 159, 230, 79),
                    value: double.parse(data['bagis']) / 100,
                  ),
                ),
                Row(children: <Widget>[
                  Expanded(
                    child: Divider(
                      color: Colors.blue.shade100,
                      thickness: 0.5,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Text("Banka Bilgileri",
                        style: TextStyle(
                            fontSize: 12, color: Colors.blue.shade100)),
                  ),
                  Expanded(
                    child: Divider(
                      color: Colors.blue.shade100,
                      thickness: 0.5,
                    ),
                  ),
                ]),
                Padding(
                  padding: const EdgeInsets.only(left: 1, right: 0, top: 15),
                  child: Row(
                    children: [
                      Text("Banka:",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                              color: const Color.fromARGB(255, 255, 255, 255))),
                      SizedBox(width: 5),
                      Flexible(
                        // Bu satırı ekledim
                        child: Text(data['banka2'],
                            softWrap: true,
                            style: TextStyle(
                                fontSize: 13,
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
                              fontSize: 14,
                              color: const Color.fromARGB(255, 255, 255, 255))),
                      SizedBox(width: 5),
                      Flexible(
                        child: Text(data['iban'],
                            softWrap: true,
                            style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.normal,
                                color:
                                    const Color.fromARGB(255, 249, 249, 250))),
                      ),
                      IconButton(
                          icon: Icon(
                            Icons.copy,
                            size: 14,
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
                              fontSize: 14,
                              color: const Color.fromARGB(255, 255, 255, 255))),
                      SizedBox(width: 5),
                      Flexible(
                        // Bu satırı ekledim
                        child: Text(data['alici'],
                            softWrap: true,
                            style: TextStyle(
                                fontSize: 13,
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
                              fontSize: 14,
                              color: const Color.fromARGB(255, 255, 255, 255))),
                      SizedBox(width: 5),
                      Flexible(
                        // Bu satırı ekledim
                        child: Text(data['aciklamasi'],
                            softWrap: true,
                            style: TextStyle(
                                fontSize: 13,
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
                      thickness: 0.5,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Text("Kampanya İzinleri",
                        style: TextStyle(
                            fontSize: 12, color: Colors.blue.shade100)),
                  ),
                  Expanded(
                    child: Divider(
                      color: Colors.blue.shade100,
                      thickness: 0.5,
                    ),
                  ),
                ]),
                Padding(
                  padding: EdgeInsets.only(left: 1, bottom: 10),
                  child: Row(
                    children: [
                      Text("Yasal İzin:",
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
                              fontSize: 13,
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
                      thickness: 0.5,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Text("Diğer Bilgiler",
                        style: TextStyle(
                            fontSize: 12, color: Colors.blue.shade100)),
                  ),
                  Expanded(
                    child: Divider(
                      color: Colors.blue.shade100,
                      thickness: 0.5,
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
                              fontSize: 14,
                              color: const Color.fromARGB(255, 255, 255, 255))),
                      SizedBox(width: 10),
                      Flexible(
                        // Bu satırı ekledim
                        child: Text(data['detayaciklama'],
                            softWrap: true,
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                fontSize: 13,
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
}
