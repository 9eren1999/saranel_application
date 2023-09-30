import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

Future<void> saveDataToLocal(List<Dernek> dernekList) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  List<Map<String, dynamic>> dataList = dernekList
      .map((dernek) => {
            'logoUrl': dernek.logoUrl,
            'ad': dernek.ad,
            'kategori': dernek.kategori,
            'kurumkt': dernek.kurumkt,
            'kurumgm': dernek.kurumgm,
            'kurumHakkinda': dernek.kurumHakkinda,
            'webSiteUrl': dernek.webSiteUrl,
          })
      .toList();
  String jsonString = jsonEncode(dataList);
  prefs.setString('dernekList', jsonString);
  prefs.setInt('dernekListTimestamp', DateTime.now().millisecondsSinceEpoch);
}

Future<List<Dernek>?> getDataFromLocal() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String? jsonString = prefs.getString('dernekList');
  if (jsonString != null) {
    List<dynamic> jsonList = jsonDecode(jsonString);
    List<Dernek> dernekList = jsonList.map((json) {
      return Dernek(
        logoUrl: json['logoUrl'],
        ad: json['ad'],
        kategori: json['kategori'],
        kurumkt: json['kurumkt'],
        kurumgm: json['kurumgm'],
        kurumHakkinda: json['kurumHakkinda'],
        webSiteUrl: json['webSiteUrl'],
      );
    }).toList();
    int? timestamp = prefs.getInt('dernekListTimestamp');
    final currentTime = DateTime.now().millisecondsSinceEpoch;
    final threeDays = 259200000; // 3 gün
    if (timestamp != null && currentTime - timestamp < threeDays) {
      return dernekList;
    }
  }
  return null;
}

class Dernek {
  final String logoUrl;
  final String ad;
  final String kategori;
  final String kurumkt;
  final String kurumgm;
  final String kurumHakkinda;
  final String webSiteUrl;

  Dernek({
    required this.logoUrl,
    required this.ad,
    required this.kategori,
    required this.kurumkt,
    required this.kurumgm,
    required this.kurumHakkinda,
    required this.webSiteUrl,
  });
}

class DerneklerPage extends StatefulWidget {
  @override
  _DerneklerPageState createState() => _DerneklerPageState();
}

class _DerneklerPageState extends State<DerneklerPage> {
  ScrollController _scrollController = ScrollController();
  List<bool> showDetailsList = [];
  List<Dernek> derneklerListesi = [];
  bool loading = true;
  DateTime lastFetchTime = DateTime.now().subtract(Duration(days: 4));
  String? errorMessage;

  @override
  void initState() {
    super.initState();

    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        setState(() {});
      } else {
        setState(() {});
      }
    });

    fetchDernekler().then((fetchedList) {
      setState(() {
        if (fetchedList != Null) {
          derneklerListesi = fetchedList;
          showDetailsList = List<bool>.filled(fetchedList.length, false);
          loading = false;
          lastFetchTime = DateTime.now();
        }
      });
    }).catchError((error) {
      setState(() {
        errorMessage = error.toString();
        loading = false;
      });
    });
  }

  Future<List<Dernek>> fetchDernekler() async {
    // Öncelikle yerel depolamadan veriyi almayı deneyin.
    List<Dernek>? dernekListFromLocal = await getDataFromLocal();
    if (dernekListFromLocal != null) {
      return dernekListFromLocal;
    }

    // Eğer yerel depolamada veri yoksa veya veri eskiyse Firebase'den veriyi çekin.
    derneklerListesi = [];
    try {
      QuerySnapshot querySnapshot =
          await FirebaseFirestore.instance.collection('dernekler').get();
      for (var doc in querySnapshot.docs) {
        var data = doc.data() as Map<String, dynamic>?;
        if (data != null) {
          String logoUrl = data['logoPath'] ?? '';
          derneklerListesi.add(
            Dernek(
              logoUrl: logoUrl,
              ad: data['ad'] ?? '',
              kategori: data['kategori'] ?? '',
              kurumkt: data['kurumkt'] ?? '',
              kurumgm: data['kurumgm'] ?? '',
              kurumHakkinda: data['kurumHakkinda'] ?? '',
              webSiteUrl: data['webSiteUrl'] ?? '',
            ),
          );
        }
      }
      // Firebase'den çekilen veriyi yerel depolamaya kaydedin.
      await saveDataToLocal(derneklerListesi);
    } catch (e) {
      print('Dernekler fetch hatası: $e');
      throw Exception(
          'Veri alınırken bir hata oluştu. Lütfen daha sonra tekrar deneyiniz.');
    }

    return derneklerListesi;
  }

  Future<String> getLogoUrl(String filePath) async {
    try {
      if (filePath.isEmpty) {
        return '';
      }

      FirebaseStorage storage = FirebaseStorage.instance;
      String url = await storage.ref(filePath).getDownloadURL();
      return url;
    } catch (e) {
      print('Logo URL alınırken hata: $e');
      return '';
    }
  }

  void _launchURL(String url) async {
    try {
      await launchUrl(Uri.parse(url));
    } catch (e) {
      print('Could not launch $url: $e');
    }
  }

  Widget dernekKarti(Dernek dernek, bool showDetails, int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          showDetailsList[index] = !showDetailsList[index];
        });
      },
      child: Card(
        margin: EdgeInsets.only(bottom: 7, top: 7, right: 15, left: 15),
        color: Colors.blue.shade600,
        child: Padding(
          padding:
              const EdgeInsets.only(top: 12, bottom: 12, right: 25, left: 15),
          child: Column(
            children: [
              Row(
                children: [
                  ClipOval(
                    child: CachedNetworkImage(
                      imageUrl: dernek.logoUrl,
                      placeholder: (context, url) =>
                          CircularProgressIndicator(),
                      errorWidget: (context, url, error) => Icon(Icons.error),
                      height: 45,
                      width: 45,
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(width: 15),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          dernek.ad,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          dernek.kategori,
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        showDetailsList[index] = !showDetailsList[index];
                      });
                    },
                    child: Icon(
                      showDetails ? Icons.arrow_drop_up : Icons.arrow_drop_down,
                      color: Colors.white,
                      size: 40,
                    ),
                  ),
                ],
              ),
              if (showDetails)
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    children: [
                      Divider(
                        thickness: 0.2,
                      ),
                      SizedBox(height: 7),
                      Text(
                        "Kurum Hakkında\n",
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10, bottom: 10),
                        child: RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: 'Kuruluş Tarihi: ${dernek.kurumkt}\n\n',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              TextSpan(
                                text: 'Genel Merkez: ${dernek.kurumgm}\n\n',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              TextSpan(
                                text: '${dernek.kurumHakkinda}',
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          _launchURL(dernek.webSiteUrl);
                        },
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.white),
                          shadowColor:
                              MaterialStateProperty.all(Colors.transparent),
                          elevation: MaterialStateProperty.all(0.0),
                          side: MaterialStateProperty.all(BorderSide.none),
                        ),
                        child: Text(
                          'Bağış Yap',
                          style: TextStyle(
                            color: Colors.blue.shade800,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
        title: Text(
          "Sivil Toplum Kuruluşları",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: loading
          ? Center(
              child: CircularProgressIndicator(
              color: Colors.white,
            ))
          : errorMessage != null
              ? Center(
                  child: Text(
                    errorMessage!,
                    style: TextStyle(color: Colors.red, fontSize: 16),
                    textAlign: TextAlign.center,
                  ),
                )
              : ListView.builder(
                  controller: _scrollController,
                  padding: EdgeInsets.only(top: 12),
                  itemCount: derneklerListesi.length + 1, // +1 ekledik
                  itemBuilder: (context, index) {
                    if (index == derneklerListesi.length) {
                      // Eğer son öğe ise
                      return Container(
                        color: Colors.blue.shade800,
                        padding: EdgeInsets.all(10),
                        child: Text(
                          "Kuruluşunuzu platformumuzda görmek istiyorsanız, lütfen iletisim@saranel.com.tr adresine talebinizi iletin.",
                          style: TextStyle(color: Colors.white, fontSize: 8),
                          textAlign: TextAlign.center,
                        ),
                      );
                    } else {
                      return dernekKarti(derneklerListesi[index],
                          showDetailsList[index], index);
                    }
                  },
                ),
    );
  }
}
