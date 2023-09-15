import 'package:flutter/material.dart';
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

  // Verileri yerel depodan almanın ve API'dan almanın zaman aşımı süresi

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
      final oneMinute = 60000; //1dakika kontrolü

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
    // Hata yakalama ve kullanıcıya gösterilecek bir hata mesajı oluşturma
    print("An error occurred while fetching data: $e");
    throw Exception('Veri alınırken bir hata oluştu. Lütfen daha sonra tekrar deneyiniz.');
  }
}


  Future<List<Map<String, dynamic>>> getDataFromApi() async {
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance.collection('yardimtalepleri').get();
    List<Map<String, dynamic>> dataList = querySnapshot.docs.map((doc) => doc.data() as Map<String, dynamic>).toList();

    // Yeni çekilen verileri yerelde kaydet
    await saveDataToLocal(dataList);

    setState(() {});

    return dataList;
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text("Bireysel Yardım Talepleri", style: appbarStyle()),
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
              margin: EdgeInsets.only(top: 95, right: 15, left: 15, bottom: 10),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.red.shade900,
                  borderRadius: BorderRadius.all(Radius.circular(25)),
                ),
                child: ListTile(
                  contentPadding: EdgeInsets.only(right: 12, left: 12, top: 5, bottom: 5),
                  title: Text(
                    "Bu kategorideki yardım talepleri, bireysel başvurular yoluyla oluşturulmuş ve başvuran kişilerin T.C. Aile ve Sosyal Politakalar Bakanlığı tarafında 'ihtiyaç sahibi' olup olmadığı teyid edilmemiştir. Bu alanda yapacağınız yardımları gerçekleştirirken dikkatli olunması gerekmektedir.",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 11,
                    ),
                    textAlign: TextAlign.start,
                  ),
                  leading: Icon(
                    Icons.warning, // Ünlem simgesi
                    size: 26, // İkon boyutu
                    color: Colors.white, // İkon rengi
                  ),
                ),
              ),
            ),   FutureBuilder(
  future: dataListFuture,
  builder: (context, snapshot) {
    if (snapshot.connectionState == ConnectionState.waiting) {
      return SizedBox(height: 250,
        child: Center(
          child: CircularProgressIndicator(
            color: Colors.white)),
      );
    }

    if (snapshot.hasError) {
      return Text('Something went wrong: ${snapshot.error}');
    }

    if (snapshot.connectionState == ConnectionState.done) {
          List<Map<String, dynamic>> dataList = snapshot.data as List<Map<String, dynamic>>;
      
      return Column(
        children: dataList.asMap().entries.map((e) {
          int index = e.key;
          Map<String, dynamic> data = e.value;
          return buildCard(data, index);
        }).toList(),
      );
    }

    return SizedBox.shrink(); // Bu kısım asla ulaşılmaması gereken bir durum için, yine de bir şey döndürmelisiniz.
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
    child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Padding(
        padding: const EdgeInsets.only(left: 15, top: 12, bottom: 15, right: 1),
        child: Row(
          children: [
            Flexible(
              flex: 1,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Flexible( flex: 0,
                        child: Text(
                          "${data['adsoyad']}",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: const Color.fromARGB(255, 253, 253, 253),
                          ),
                        ),
                      ),
                      Spacer(),
                      Padding(
                        padding: const EdgeInsets.only(right: 25),
                        child: Flexible(
                          child: Text(
                            "${data['eklenme_tarihi'] ?? 'Saat bilgisi alınamadı!'}", // Tarih ve saat manuel olarak girilmiştir
                            textAlign: TextAlign.end,
                            style: TextStyle( fontSize: 10,
                              color: const Color.fromARGB(255, 253, 253, 253),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ), 
                  SizedBox(height: 2),
                  Text(
                    data['aciklama'],
                    style: TextStyle(
                        fontWeight: FontWeight.w100,
                        fontSize: 14,
                        color: const Color.fromARGB(255, 255, 255, 255)),
                  ),
                  Divider(thickness: 0.5, color: Colors.blue.shade100),
                  SizedBox(height: 5),
Row(
  children: [
    Icon(
      Icons.location_on, // Konum simgesi
      color: Color.fromARGB(255, 255, 255, 255),
    ),
    SizedBox(width: 8),
    Text(
      "${data['il'] ?? 'Bilgi yok'}",
      style: TextStyle(
        fontWeight: FontWeight.w100,
        fontSize: 14,
        color: const Color.fromARGB(255, 255, 255, 255),
      ),
    ),
  ],
),
                  SizedBox(height: 5),
                  Row(
                    children: [
                      Icon(
                        Icons.visibility,
                        color: const Color.fromARGB(255, 255, 255, 255),
                      ),
                      SizedBox(width: 8),
                      InkWell(
                        onTap: () {
                          setState(() {
                            showDetails[index] = !(showDetails[index] ?? false);
                          });
                        },
                        child: Text(
                          showDetails[index] ?? false
                              ? "İletişim bilgisini gizle"
                              : "İletişim bilgisini görüntülemek için tıklayınız",
                          style: TextStyle( decoration: TextDecoration.underline,
                            color: const Color.fromARGB(255, 255, 255, 255),
                          ),
                        ),
                      ),
                    ],
                  ),
                  if (showDetails[index] ?? false)
                    Padding(
                      padding: const EdgeInsets.only(top: 5),
                      child: RichText(
                        text: TextSpan(
                          style: TextStyle(
                            color: const Color.fromARGB(255, 255, 255, 255), // beyaz renk
                          ),
                          children: [
                            TextSpan(
                              text: 'İletişim Adresi: ',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            TextSpan(
                              text: '${data['iletisimadres']}',
                              style: TextStyle(
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    ]),
  );
}

  TextStyle appbarStyle() => GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.w800);
}