import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../models/belediyelink.dart'; // Bu dosyanın doğru bir şekilde mevcut olduğundan emin olun.

class resmikurumpage extends StatefulWidget {
  const resmikurumpage({super.key});

  @override
  State<resmikurumpage> createState() => _resmikurumpageState();
}

class _resmikurumpageState extends State<resmikurumpage> {
  List<bool> showDetails = List<bool>.filled(36, false);

  void toggleDetail(int index) {
    setState(() {
      showDetails[index] = !showDetails[index];
    });
  }

  Widget infoCard(bool showDetails, String imageUrl, String title,
      String subtitle, String details, void Function() onTap, Function fnk) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        margin: EdgeInsets.only(bottom: 0, right: 15, left: 15, top: 15),
        color: Colors.blue.shade600,
        child: Padding(
          padding:
              const EdgeInsets.only(top: 12, bottom: 12, right: 25, left: 15),
          child: Column(
            children: [
              Row(
                children: [
                  ClipOval(
                    child: Image.network(
                      imageUrl,
                      height: 45,
                      width: 45,
                      fit: BoxFit.cover,
                      errorBuilder: (BuildContext context, Object error,
                          StackTrace? stackTrace) {
                        return Icon(
                          Icons.error,
                          color: Colors.red,
                        );
                      },
                    ),
                  ),
                  SizedBox(width: 15),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          subtitle,
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Icon(
                    showDetails ? Icons.arrow_drop_up : Icons.arrow_drop_down,
                    color: Colors.white,
                    size: 40,
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
                      Padding(
                        padding: const EdgeInsets.only(top: 10, bottom: 10),
                        child: Text(
                          "Kurum Hakkında",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            bottom: 25, right: 5, left: 5, top: 15),
                        child: Text(
                          details,
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      Center(
                        child: ElevatedButton(
                          onPressed: () {
                            fnk();
                          },
                          child: Text("Başvur",
                              style: TextStyle(color: Colors.blue.shade600)),
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

  TextStyle appbarStyle() =>
      GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.w800);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: false,
      appBar: AppBar(
        title: Text("Resmi Kurum Kampanyaları", style: appbarStyle()),
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back_ios_sharp,
              color: Colors.blue.shade800,
              size: 19,
            )),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            infoCard(
              showDetails[0],
              'https://www.webtekno.com/images/editor/default/0003/46/22d8650d9dfc51f845c3f7fa895474e2824ea273.jpeg',
              'İstanbul Büyükşehir Belediyesi',
              'Sosyal Yardımlaşma ve Dayanışma Vakfı aracılığıyla',
              "İstanbul Büyükşehir Belediyesi, Sosyal Yardımlaşma ve Dayanışma Vakfı aracılığıyla, ihtiyaç sahibi vatandaşlara gıda, yakacak, kira, nakdi yardım gibi çeşitli yardımlar yapmaktadır. Bu yardımlardan yararlanmak için, İstanbul Büyükşehir Belediyesi'nin web sitesinden veya ALO 153 çağrı merkezinden başvuru yapılabilir.",
              () => toggleDetail(0),
              launchUrl1,
            ),
            infoCard(
              showDetails[1],
              'https://logowik.com/content/uploads/images/949_ankara_buyuksehir_belediyesi.jpg',
              'Ankara Büyükşehir Belediyesi',
              'Sosyal Hizmetler Daire Başkanlığı aracılığıyla',
              "Ankara Büyükşehir Belediyesi, Sosyal Hizmetler Daire Başkanlığı aracılığıyla, ihtiyaç sahibi vatandaşlara gıda, yakacak, kira, nakdi yardım gibi çeşitli yardımlar yapmaktadır. Bu yardımlardan yararlanmak için, Ankara Büyükşehir Belediyesi'nin web sitesinden veya 444 0 444 numaralı çağrı merkezinden başvuru yapılabilir.",
              () => toggleDetail(1),
              launchUrl1,
            ),
            infoCard(
              showDetails[2],
              'https://cdn.karar.com/news/1540950.jpg',
              'İzmir Büyükşehir Belediyesi',
              'Sosyal Hizmetler Daire Başkanlığı aracılığıyla',
              "İzmir Büyükşehir Belediyesi, Sosyal Hizmetler ve Daire Başkanlığı aracılığıyla, ihtiyaç sahibi vatandaşlara gıda, yakacak, kira, nakdi yardım gibi çeşitli yardımlar yapmaktadır. Bu yardımlardan yararlanmak için, İzmir Büyükşehir Belediyesi'nin web sitesinden veya 444 0 933 numaralı çağrı merkezinden başvuru yapılabilir.",
              () => toggleDetail(2),
              launchUrl1,
            ),
            infoCard(
              showDetails[3],
              'https://d1yjjnpx0p53s8.cloudfront.net/styles/logo-thumbnail/s3/0012/4495/brand.gif?itok=rUN59G6Z',
              'Bursa Büyükşehir Belediyesi',
              'Sosyal Yardımlaşma ve Dayanışma Vakfı aracılığıyla',
              "Bursa Büyükşehir Belediyesi, Sosyal Yardımlaşma ve Dayanışma Vakfı aracılığıyla, ihtiyaç sahibi vatandaşlara gıda, yakacak, kira, nakdi yardım gibi çeşitli yardımlar yapmaktadır. Bu yardımlardan yararlanmak için, Bursa Büyükşehir Belediyesi'nin web sitesinden veya 444 99 77 numaralı çağrı merkezinden başvuru yapılabilir.",
              () => toggleDetail(3),
              launchUrl1,
            ),
            infoCard(
              showDetails[4],
              'https://hotelasistan.com/yonetim/firmalogolari/5144323.png',
              'Antalya Büyükşehir Belediyesi',
              'Sosyal Hizmetler Daire Başkanlığı aracılığıyla',
              "Antalya Büyükşehir Belediyesi, Sosyal Hizmetler ve Daire Başkanlığı aracılığıyla, ihtiyaç sahibi vatandaşlara gıda, yakacak, kira, nakdi yardım gibi çeşitli yardımlar yapmaktadır. Bu yardımlardan yararlanmak için, Antalya Büyükşehir Belediyesi'nin web sitesinden veya 444 99 99 numaralı çağrı merkezinden başvuru yapılabilir.",
              () => toggleDetail(4),
              launchUrl1,
            ),
          ],
        ),
      ),
    );
  }
}
