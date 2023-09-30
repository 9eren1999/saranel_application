/* import 'dart:js_util';
import 'package:flutter/gestures.dart';
 */
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class BireyselYardimPage extends StatefulWidget {
  const BireyselYardimPage({Key? key}) : super(key: key);

  @override
  State<BireyselYardimPage> createState() => _BireyselYardimPageState();
}

class _BireyselYardimPageState extends State<BireyselYardimPage> {
  Map<int, bool> showDetails = {};
  late Future<List<Map<String, dynamic>>> dataListFuture;

  @override
  void initState() {
    super.initState();
    dataListFuture = fetchData();
  }

  Future<void> saveDataToLocal(List<Map<String, dynamic>> dataList) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    List<Map<String, dynamic>> modifiedDataList = dataList.map((data) {
      Map<String, dynamic> newData = Map<String, dynamic>.from(data);

      return newData;
    }).toList();

    String jsonString = jsonEncode(modifiedDataList);
    prefs.setString('dataList', jsonString);
    prefs.setInt('dataListTimestamp', DateTime.now().millisecondsSinceEpoch);
  }

  Future<List<Map<String, dynamic>>?> getDataFromLocal() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? jsonString = prefs.getString('dataList');

    if (jsonString != null) {
      List<dynamic> jsonList = jsonDecode(jsonString);
      List<Map<String, dynamic>> dataList = jsonList.map((json) {
        Map<String, dynamic> data = Map<String, dynamic>.from(json);
        return data;
      }).toList();

      int? timestamp = prefs.getInt('dataListTimestamp');
      final currentTime = DateTime.now().millisecondsSinceEpoch;
      final oneMinute = 86400000; //24 saatte bir çeksin

      if (timestamp != null && currentTime - timestamp < oneMinute) {
        return dataList;
      }
    }

    return null;
  }

  Future<List<Map<String, dynamic>>> fetchData() async {
    try {
      List<Map<String, dynamic>>? dataListFromLocal = await getDataFromLocal();

      if (dataListFromLocal != null) {
        return dataListFromLocal;
      }

      return await getDataFromApi();
    } catch (e) {
      print("An error occurred while fetching data: $e");
      throw Exception(
          'Veri alınırken bir hata oluştu. Lütfen daha sonra tekrar deneyiniz.');
    }
  }

  Future<List<Map<String, dynamic>>> getDataFromApi() async {
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('yardimtalepleri')
        .orderBy('eklenme_tarihi', descending: true)
        .get();
    List<Map<String, dynamic>> dataList = querySnapshot.docs
        .map((doc) => doc.data() as Map<String, dynamic>)
        .toList();

    await saveDataToLocal(dataList);

    setState(() {});

    return dataList;
  }

  Widget buildRichTextWithIcon(String label, String value, Widget? icon) {
    return Row(
      children: [
        RichText(
          text: TextSpan(
            style: TextStyle(color: const Color.fromARGB(255, 255, 255, 255)),
            children: [
              TextSpan(
                text: label,
                style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
              ),
              TextSpan(
                text: value,
                style: TextStyle(fontSize: 13, fontWeight: FontWeight.normal),
              ),
            ],
          ),
        ),
        if (icon != null) icon
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: false,
      appBar: AppBar(
        title: Text("Yardım Kampanyaları", style: appbarStyle()),
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
      body: SingleChildScrollView(
        child: Column(children: [
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25),
            ),
            margin: EdgeInsets.only(top: 20, right: 15, left: 15, bottom: 10),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.all(Radius.circular(25)),
              ),
              child: ListTile(
                contentPadding:
                    EdgeInsets.only(right: 12, left: 12, top: 5, bottom: 5),
                title: Text(
                  "Bu kategorideki yardım kampanyaları, bireyler tarafından valiliklerden alınan proje izni ile oluşturulmuştur. Listelenen kampanyaların resmi olarak yardım toplama izni bulunmaktadır. ",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 11,
                  ),
                  textAlign: TextAlign.start,
                ),
                leading: Icon(
                  Icons.verified_user_outlined,
                  size: 26,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          FutureBuilder(
            future: dataListFuture,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return SizedBox(
                  height: 250,
                  child: Center(
                    child: CircularProgressIndicator(color: Colors.white),
                  ),
                );
              }

              if (snapshot.hasError) {
                return Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Text(
                    'Bir hata oluştu: ${snapshot.error}',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white, fontSize: 12),
                  ),
                );
              }

              if (snapshot.connectionState == ConnectionState.done) {
                if (snapshot.hasData) {
                  List<Map<String, dynamic>> dataList =
                      snapshot.data as List<Map<String, dynamic>>;

                  if (dataList.isEmpty) {
                    return Center(
                      heightFactor: 7,
                      child: Text(
                        textAlign: TextAlign.center,
                        'Bekleyen bireysel yardım talebi bulunamadı.',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 10,
                        ),
                      ),
                    );
                  }

                  return Column(
                    children: dataList.asMap().entries.map((e) {
                      int index = e.key;
                      Map<String, dynamic> data = e.value;
                      return buildCard(data, index);
                    }).toList(),
                  );
                } else {
                  return Center(
                    heightFactor: 5,
                    child: Text(
                      'Bekleyen bireysel yardım talebi bulunamadı.',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                      ),
                    ),
                  );
                }
              }

              return SizedBox.shrink();
            },
          )
        ]),
      ),
    );
  }

  Widget buildCard(Map<String, dynamic> data, int index) {
    return Card(
      margin: EdgeInsets.only(top: 15, left: 15, right: 15, bottom: 12),
      color: Colors.blue.shade600,
      shadowColor: Color.fromARGB(110, 0, 0, 0),
      child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
        Padding(
            padding:
                const EdgeInsets.only(left: 15, top: 12, bottom: 15, right: 15),
            child: Container(
              width: MediaQuery.of(context).size.width,
              child: Row(children: [
                Flexible(
                  flex: 1,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(bottom: 5, top: 5),
                              child: Text(
                                "${data['adsoyad']}",
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  color:
                                      const Color.fromARGB(255, 253, 253, 253),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 2),
                      Padding(
                        padding: const EdgeInsets.only(right: 15, left: 15),
                        child: Text(
                          data['aciklama'],
                          style: TextStyle(
                              fontWeight: FontWeight.w100,
                              fontSize: 12,
                              color: const Color.fromARGB(255, 255, 255, 255)),
                        ),
                      ),
                      /* Divider(thickness: 0.5, color: Colors.blue.shade100), */
                      SizedBox(height: 5),
                      Padding(
                        padding: const EdgeInsets.only(
                          right: 25,
                          left: 25,
                          top: 15,
                        ),
                        child: Column(
                          children: [
                            Text(
                              "Kampanya Tamamlanma Oranı: ${(int.parse(data['tamamlanmaorani']) / 100 * 100).toStringAsFixed(0)}%",
                              style: TextStyle(
                                  fontSize: 12,
                                  color: Color.fromARGB(255, 255, 255, 255)),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 35, right: 35, top: 4, bottom: 15),
                              child: LinearProgressIndicator(
                                color: Color.fromARGB(255, 159, 230, 79),
                                value:
                                    double.parse(data['tamamlanmaorani']) / 100,
                              ),
                            ),
                            Padding(
                              padding:
                                  EdgeInsets.only(left: 0, bottom: 0, top: 10),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    "Bağış Bilgileri:  ",
                                    style: TextStyle(
                                      fontSize: 11,
                                      fontWeight: FontWeight.bold,
                                      color: const Color.fromARGB(
                                          255, 253, 253, 253),
                                    ),
                                  ),
                                  Flexible(
  child: InkWell(
    onTap: () {
      setState(() {
        showDetails[index] = !(showDetails[index] ?? false);
      });
    },
    child: Row(
      children: [
        Icon(
          showDetails[index] ?? false
              ? Icons.visibility_off
              : Icons.visibility,
          color: const Color.fromARGB(255, 255, 255, 255),
          size: 11,
        ),
        SizedBox(width: 4),
        Expanded( // Bu satırı ekledik
          child: Text(
            showDetails[index] ?? false
                ? " Gizlemek için tıklayınız."
                : " Görüntülemek için tıklayınız.",
            softWrap: true,
            style: TextStyle(
              fontSize: 11,
              decoration: TextDecoration.underline,
              color: const Color.fromARGB(255, 255, 255, 255),
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis, // Bu satırı ekledik
                                          ),
    )],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            if (showDetails[index] ?? false)
                              Padding(
                                padding: const EdgeInsets.only(top: 5),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Divider(),
                                    buildRichTextWithIcon('Banka Adı: ',
                                        '${data['banka']}', null),
                                    buildRichTextWithIcon(
                                      'IBAN: ',
                                      '${data['iban']}',
                                      IconButton(
                                        icon: Icon(Icons.copy,
                                            size: 20, color: Colors.white),
                                        onPressed: () {
                                          Clipboard.setData(ClipboardData(
                                              text: data['iban']));
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            SnackBar(
                                              content: Text('IBAN kopyalandı!'),
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                    buildRichTextWithIcon('Alıcı Ad Soyad: ',
                                        '${data['alici']}', null),
                                    SizedBox(
                                      height: 15,
                                    ),
                                    buildRichTextWithIcon('Açıklama: ',
                                        '${data['ibanaciklama']}', null),
                                    Padding(
                                      padding:
                                          EdgeInsets.only(left: 0, bottom: 0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Flexible(
                                            child: TextButton(
                                              onPressed: () {
                                                String urlString =
                                                    data['image'];
                                                showDialog(
                                                  context: context,
                                                  builder:
                                                      (BuildContext context) {
                                                    return AlertDialog(
                                                      backgroundColor:
                                                          Colors.blue.shade800,
                                                      content: Container(
                                                        child: Image.network(
                                                            urlString),
                                                      ),
                                                      actions: [
                                                        TextButton(
                                                          child: Text(
                                                            "Kapat",
                                                            style: TextStyle(
                                                              fontSize: 12,
                                                              color: const Color
                                                                  .fromARGB(
                                                                  255,
                                                                  255,
                                                                  255,
                                                                  255),
                                                            ),
                                                          ),
                                                          onPressed: () {
                                                            Navigator.of(
                                                                    context)
                                                                .pop();
                                                          },
                                                        ),
                                                      ],
                                                    );
                                                  },
                                                );
                                              },
                                              child: Text(
                                                "Yasal İzni görüntülemek için tıklayınız.",
                                                softWrap: true,
                                                style: TextStyle(
                                                  fontSize: 12,
                                                  decoration:
                                                      TextDecoration.underline,
                                                  color: const Color.fromARGB(
                                                      255, 255, 255, 255),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ]),
            ))
      ]),
    );
  }

  TextStyle appbarStyle() =>
      GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.w800);
}
