import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class dernekler extends StatefulWidget {
  const dernekler({super.key});

  @override
  State<dernekler> createState() => _derneklerState();
}

class _derneklerState extends State<dernekler> {
  bool showDetails1 = false;
  bool showDetails2 = false;
  bool showDetails3 = false;
  bool showDetails4 = false;
  bool showDetails5 = false;
  bool showDetails6 = false;
  bool showDetails7 = false;
  bool showDetails8 = false;
  
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
        appBar: AppBar(
          title: Text("Sivil Toplum Kuruluşları", style: appbarStyle()),
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
            child: Column(children: [
          Card(
            margin: EdgeInsets.only(bottom: 15, top: 100, right: 15, left: 15),
            color: Colors.blue.shade600,
            child: Padding(
              padding: const EdgeInsets.only(
                  top: 12, bottom: 12, right: 25, left: 15),
              child: Column(
                children: [
                  Row(
                    children: [
                      ClipOval(
                        child: Image.network(
                          'https://stsprefabrik.com.tr/images/speasyimagegallery/albums/1/images/turk-kizilayi-logo.png',
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
                              "Türkiye Kızılay Derneği",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            Text(
                              "Sağlık ve Yardımlaşma",
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
                            showDetails1 = !showDetails1;
                          });
                        },
                        child: Icon(
                          showDetails1
                              ? Icons.arrow_drop_up
                              : Icons.arrow_drop_down,
                          color: Colors.white,
                          size: 40,
                        ),
                      ),
                    ],
                  ),
                  if (showDetails1)
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
                                bottom: 25, right: 5, left: 5,top: 15),
                            child: Text(textAlign: TextAlign.center,
                              "Kuruluş Tarihi: 1868 \nGenel Merkez: Ankara, Türkiye \n\nTürkiye Kızılay Derneği, Osmanlı İmparatorluğu döneminde kurulmuş, Türkiye'nin en köklü yardım kuruluşlarından biridir. Kızılay, doğal afetlerde, savaşlarda ve diğer kriz durumlarında ihtiyaç sahiplerine yardım ulaştırır. Aynı zamanda kan bağışı organizasyonları düzenler ve sosyal hizmetlerde bulunur. Kızılay, Uluslararası Kızılhaç ve Kızılay Hareketi'nin bir üyesidir.",
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                          SizedBox(height: 10),
                          Center(
                            child: ElevatedButton(
                              onPressed: () {
                                // Bağış yapma işlevselliği buraya eklenecek
                              },
                              child: Text("Bağış Yap"),
                            ),
                          ),
                        ],
                      ),
                    ),
                ],
              ),
            ),
          ),
          Column(children: [
            Card(
              margin: EdgeInsets.symmetric(vertical: 0, horizontal: 15),
              color: Colors.blue.shade600,
              child: Padding(
                padding: const EdgeInsets.only(
                    top: 12, bottom: 12, right: 25, left: 15),
                child: Column(
                  children: [
                    Row(
                      children: [
                        ClipOval(
                          child: Image.network(
                            'https://gelbasla.com/uploads/files/tr/388/thumb-816x460-eefbccb8af9f35e677cfa920e8db5731.jpg',
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
                                "Türkiye Yeşilay Cemiyeti",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                              Text(
                                "Sağlık",
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
                              showDetails2 = !showDetails2;
                            });
                          },
                          child: Icon(
                            showDetails2
                                ? Icons.arrow_drop_up
                                : Icons.arrow_drop_down,
                            color: Colors.white,
                            size: 40,
                          ),
                        ),
                      ],
                    ),
                    if (showDetails2)
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Column(
                          children: [
                            Divider(
                              thickness: 0.2,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 10, bottom: 10),
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
                                  bottom: 25, right: 5, left: 5),
                              child: Text(textAlign: TextAlign.center,
                                "Kuruluş Tarihi: 1920 \nGenel Merkez: İstanbul, Türkiye \n\nYeşilay, bağımlılıkla mücadele konusunda faaliyet gösteren bir sivil toplum kuruluşudur. Alkol, sigara, uyuşturucu gibi bağımlılık yapan maddelerle mücadele eder ve bu konuda toplumu bilinçlendirmeye yönelik çalışmalar yapar. Aynı zamanda bağımlılıkla mücadelede politika geliştirme, araştırma ve eğitim faaliyetlerinde bulunur. Yeşilay, bağımlı bireylere yönelik rehabilitasyon ve tedavi hizmetleri de sunar.",
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            SizedBox(height: 10),
                            Center(
                              child: ElevatedButton(
                                onPressed: () {
                                  // Bağış yapma işlevselliği buraya eklenecek
                                },
                                child: Text("Bağış Yap"),
                              ),
                            ),
                          ],
                        ),
                      ),
                  ],
                ),
              ),
            ),
            Column(children: [
              Card(
                margin: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                color: Colors.blue.shade600,
                child: Padding(
                  padding: const EdgeInsets.only(
                      top: 12, bottom: 12, right: 25, left: 15),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          ClipOval(
                            child: Image.network(
                              'https://ab-ilan.com/wp-content/uploads/2021/09/CYDD.jpg',
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
                                  "Çağdaş Yaşamı Destekleme Derneği",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                                Text(
                                  "Eğitim ve Kadın Hakları",
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
                                showDetails3 = !showDetails3;
                              });
                            },
                            child: Icon(
                              showDetails3
                                  ? Icons.arrow_drop_up
                                  : Icons.arrow_drop_down,
                              color: Colors.white,
                              size: 40,
                            ),
                          ),
                        ],
                      ),
                      if (showDetails3)
                        Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Column(
                            children: [
                              Divider(
                                thickness: 0.2,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(top: 10, bottom: 10),
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
                                    bottom: 25, right: 5, left: 5),
                                child: Text(textAlign: TextAlign.center,
                                "Kuruluş Tarihi: 1989 \nGenel Merkez: Ankara, Türkiye \n\nÇağdaş Yaşamı Destekleme Derneği, Türkiye'de çağdaş, laik ve demokratik bir toplum yapısının oluşturulmasını ve sürdürülmesini amaçlayan bir sivil toplum kuruluşudur. Dernek, özellikle eğitim alanında faaliyet gösterir ve kız çocuklarının eğitimine özel bir önem verir. Burslar, eğitim seminerleri ve çeşitli sosyal projeler aracılığıyla toplumun çağdaşlaşmasına katkıda bulunmayı hedefler.",
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              SizedBox(height: 10),
                              Center(
                                child: ElevatedButton(
                                  onPressed: () {
                                    // Bağış yapma işlevselliği buraya eklenecek
                                  },
                                  child: Text("Bağış Yap"),
                                ),
                              ),
                            ],
                          ),
                        ),
                    ],
                  ),
                ),
              ),
              Column(children: [
                Card(
                  margin: EdgeInsets.symmetric(vertical: 0, horizontal: 15),
                  color: Colors.blue.shade600,
                  child: Padding(
                    padding: const EdgeInsets.only(
                        top: 12, bottom: 12, right: 25, left: 15),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            ClipOval(
                              child: Image.network(
                                'https://trthaberstatic.cdn.wp.trt.com.tr/resimler/586000/586402.jpg',
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
                                    "Türk Hava Kurumu",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                  Text(
                                    "Havacılık ve Eğitim",
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
                                  showDetails4 = !showDetails4;
                                });
                              },
                              child: Icon(
                                showDetails4
                                    ? Icons.arrow_drop_up
                                    : Icons.arrow_drop_down,
                                color: Colors.white,
                                size: 40,
                              ),
                            ),
                          ],
                        ),
                        if (showDetails4)
                          Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Column(
                              children: [
                                Divider(
                                  thickness: 0.2,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 10, bottom: 10),
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
                                      bottom: 25, right: 5, left: 5),
                                  child: Text(textAlign: TextAlign.center,
                                "Kuruluş Tarihi: 1925 \nGenel Merkez: Ankara, Türkiye \n\nTürk Hava Kurumu, Türkiye'de havacılığın geliştirilmesi ve yaygınlaştırılması amacıyla kurulmuş bir kurumdur. THK, sivil havacılık eğitimleri, hava araçlarının bakımı ve onarımı, hava ambulans ve yangın söndürme hizmetleri gibi bir dizi faaliyet yürütür. Aynı zamanda, gençlerin havacılığa olan ilgisini artırmak amacıyla çeşitli eğitim programları ve etkinlikler düzenler. THK, Türkiye'nin havacılık alanındaki önemli kuruluşlarından biridir.5 Ağustos 1925 tarihinden itibaren 'kamu yararına çalışan dernek' statüsündedir.",
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                SizedBox(height: 10),
                                Center(
                                  child: ElevatedButton(
                                    onPressed: () {
                                      // Bağış yapma işlevselliği buraya eklenecek
                                    },
                                    child: Text("Bağış Yap"),
                                  ),
                                ),
                              ],
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
                Column(children: [
                  Card(
                    margin: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                    color: Colors.blue.shade600,
                    child: Padding(
                      padding: const EdgeInsets.only(
                          top: 12, bottom: 12, right: 25, left: 15),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              ClipOval(
                                child: Image.network(
                                  'https://www.tpfund.org/wp-content/uploads/2018/07/TMP-Partners@TURGOK-600x300.jpg',
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
                                      "Türkiye Görme Özürlüler Kitaplığı Derneği",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    ),
                                    Text(
                                      "Sağlık ve Eğitim",
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
                                    showDetails5 = !showDetails5;
                                  });
                                },
                                child: Icon(
                                  showDetails5
                                      ? Icons.arrow_drop_up
                                      : Icons.arrow_drop_down,
                                  color: Colors.white,
                                  size: 40,
                                ),
                              ),
                            ],
                          ),
                          if (showDetails5)
                            Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Column(
                                children: [
                                  Divider(
                                    thickness: 0.2,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 10, bottom: 10),
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
                                        bottom: 25, right: 5, left: 5),
                                    child: Text(textAlign: TextAlign.center,
                                "Kuruluş Tarihi: 1952 \nGenel Merkez: İstanbul, Türkiye \n\nTürkiye Görme Özürlüler Kitaplığı Derneği, görme engelli bireylerin eğitim ve kültürel ihtiyaçlarına yönelik hizmetler sunar. Dernek, görme engellilere yönelik sesli ve braille alfabesiyle basılmış kitaplar üretir, ayrıca bu bireylerin sosyal entegrasyonunu destekleyici projeler ve etkinlikler düzenler.",
                                      style: TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                  Center(
                                    child: ElevatedButton(
                                      onPressed: () {
                                        // Bağış yapma işlevselliği buraya eklenecek
                                      },
                                      child: Text("Bağış Yap"),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                        ],
                      ),
                    ),
                  ),
                  Column(children: [
                    Card(
                      margin: EdgeInsets.symmetric(vertical: 0, horizontal: 15),
                      color: Colors.blue.shade600,
                      child: Padding(
                        padding: const EdgeInsets.only(
                            top: 12, bottom: 12, right: 25, left: 15),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                ClipOval(
                                  child: Image.network(
                                    'https://www.bizimankara.com.tr/images/haberler/2023/01/_6f97e.png',
                                    height: 45,
                                    width: 45,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                SizedBox(width: 15),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Türkiye Kadın Dernekleri Federasyonu",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                        ),
                                      ),
                                      Text(
                                        "Kadın Hakları",
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
                                      showDetails6 = !showDetails6;
                                    });
                                  },
                                  child: Icon(
                                    showDetails6
                                        ? Icons.arrow_drop_up
                                        : Icons.arrow_drop_down,
                                    color: Colors.white,
                                    size: 40,
                                  ),
                                ),
                              ],
                            ),
                            if (showDetails6)
                              Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: Column(
                                  children: [
                                    Divider(
                                      thickness: 0.2,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 10, bottom: 10),
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
                                          bottom: 25, right: 5, left: 5),
                                      child: Text(textAlign: TextAlign.center,
                                "Kuruluş Tarihi: 2002 \nGenel Merkez: Ankara, Türkiye \n\nTKDF, Türkiye genelinde kadın haklarına ve kadınların sosyal statülerinin iyileştirilmesine yönelik çalışmalar yürüten bir federasyondur. Federasyon, kadınların ekonomik, sosyal ve politik alandaki haklarını savunur ve bu konuda çeşitli projeler ve kampanyalar düzenler. Aynı zamanda, kadına yönelik şiddetle mücadele ve kadınların eğitimine yönelik çalışmalar da yürütür.",
                                        style: TextStyle(
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 10),
                                    Center(
                                      child: ElevatedButton(
                                        onPressed: () {
                                          // Bağış yapma işlevselliği buraya eklenecek
                                        },
                                        child: Text("Bağış Yap"),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                          ],
                        ),
                      ),
                    ),
                    Column(children: [
                      Card(
                        margin:
                            EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                        color: Colors.blue.shade600,
                        child: Padding(
                          padding: const EdgeInsets.only(
                              top: 12, bottom: 12, right: 25, left: 15),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  ClipOval(
                                    child: Image.network(
                                      'https://logowik.com/content/uploads/images/753_wwf.jpg',
                                      height: 45,
                                      width: 45,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  SizedBox(width: 15),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Doğal Hayatı Koruma Derneği (WWF)",
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white,
                                          ),
                                        ),
                                        Text(
                                          "Doğal Yaşamın ve Hayvanların Korunması",
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
                                        showDetails7 = !showDetails7;
                                      });
                                    },
                                    child: Icon(
                                      showDetails7
                                          ? Icons.arrow_drop_up
                                          : Icons.arrow_drop_down,
                                      color: Colors.white,
                                      size: 40,
                                    ),
                                  ),
                                ],
                              ),
                              if (showDetails7)
                                Padding(
                                  padding: const EdgeInsets.all(15.0),
                                  child: Column(
                                    children: [
                                      Divider(
                                        thickness: 0.2,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 10, bottom: 10),
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
                                            bottom: 25, right: 5, left: 5),
                                        child: Text(textAlign: TextAlign.center,
                                "Kuruluş Tarihi: 1995 (Türkiye ofisi) \nGenel Merkez: İstanbul, Türkiye \n\nWWF Türkiye, dünya genelinde doğal yaşamın ve biyoçeşitliliğin korunmasına yönelik faaliyetlerde bulunan bir sivil toplum kuruluşudur. Türkiye ofisi, ülkemizdeki doğal kaynakların sürdürülebilir bir şekilde yönetilmesini ve korunmasını amaçlar. WWF Türkiye, iklim değişikliği, su kaynaklarının korunması ve biyoçeşitliliğin korunması gibi konularda projeler yürütür.",
                                          style: TextStyle(
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                      SizedBox(height: 10),
                                      Center(
                                        child: ElevatedButton(
                                          onPressed: () {
                                            // Bağış yapma işlevselliği buraya eklenecek
                                          },
                                          child: Text("Bağış Yap"),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                            ],
                          ),
                        ),
                      ),Column(children: [
                Card(
                  margin: EdgeInsets.symmetric(vertical: 0, horizontal: 15),
                  color: Colors.blue.shade600,
                  child: Padding(
                    padding: const EdgeInsets.only(
                        top: 12, bottom: 12, right: 25, left: 15),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            ClipOval(
                              child: Image.network(
                                'https://www.turkkanserdernegi.org/img/15011962018__1997033954b.jpg',
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
                                    "Türk Kanser Derneği",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                  Text(
                                    "Sağlık",
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
                                  showDetails8 = !showDetails8;
                                });
                              },
                              child: Icon(
                                showDetails8
                                    ? Icons.arrow_drop_up
                                    : Icons.arrow_drop_down,
                                color: Colors.white,
                                size: 40,
                              ),
                            ),
                          ],
                        ),
                        if (showDetails8)
                          Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Column(
                              children: [
                                Divider(
                                  thickness: 0.2,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 10, bottom: 10),
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
                                      bottom: 25, right: 5, left: 5),
                                  child: Text(textAlign: TextAlign.center,
                                "Kuruluş Tarihi: 1949 \nGenel Merkez: Ankara, Türkiye \n\nTürk Kanser Derneği, kanserle mücadele konusunda faaliyet gösteren bir sivil toplum kuruluşudur. Dernek, kanserle ilgili farkındalık yaratma, erken tanı ve tarama programları düzenleme, kanser hastalarına ve ailelerine psikososyal destek sağlama gibi konularda çalışmalar yürütür. Aynı zamanda, kanser araştırmalarını destekler ve kanserle mücadelede politika geliştirme çalışmalarında bulunur.",
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                SizedBox(height: 10),
                                Center(
                                  child: ElevatedButton(
                                    onPressed: () {
                                      // Bağış yapma işlevselliği buraya eklenecek
                                    },
                                    child: Text("Bağış Yap"),
                                  ),
                                ),
                              ],
                            ),
                          ),
                      ],
                    ),
                  ),
                ),Column(children: [
            Card(
              margin: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
              color: Colors.blue.shade600,
              child: Padding(
                padding: const EdgeInsets.only(
                    top: 12, bottom: 12, right: 25, left: 15),
                child: Column(
                  children: [
                    Row(
                      children: [
                        ClipOval(
                          child: Image.network(
                            'https://www.gazeteipekyol.com/upload//losev-1616-1693151530.jpg',
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
                                "LÖSEV",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                              Text(
                                "Sağlık",
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
                              showDetails2 = !showDetails2;
                            });
                          },
                          child: Icon(
                            showDetails2
                                ? Icons.arrow_drop_up
                                : Icons.arrow_drop_down,
                            color: Colors.white,
                            size: 40,
                          ),
                        ),
                      ],
                    ),
                    if (showDetails2)
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Column(
                          children: [
                            Divider(
                              thickness: 0.2,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 10, bottom: 10),
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
                                  bottom: 25, right: 15, left: 15),
                              child: Text(
                                "Kurum hakkında detaylı bilgiler buraya yazılacak.",
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            SizedBox(height: 10),
                            Center(
                              child: ElevatedButton(
                                onPressed: () {
                                  // Bağış yapma işlevselliği buraya eklenecek
                                },
                                child: Text("Bağış Yap"),
                              ),
                            ),
                          ],
                        ),
                      ),
                  ],
                ),
              ),
            ),
            Column(children: [
              Card(
                margin: EdgeInsets.symmetric(vertical: 0, horizontal: 15),
                color: Colors.blue.shade600,
                child: Padding(
                  padding: const EdgeInsets.only(
                      top: 12, bottom: 12, right: 25, left: 15),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          ClipOval(
                            child: Image.network(
                              'https://www.akdenizorgannakli.net/images/turk-bobrek-vakfi.jpg',
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
                                  "Türk Böbrek Vakfı",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                                Text(
                                  "Sağlık",
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
                                showDetails3 = !showDetails3;
                              });
                            },
                            child: Icon(
                              showDetails3
                                  ? Icons.arrow_drop_up
                                  : Icons.arrow_drop_down,
                              color: Colors.white,
                              size: 40,
                            ),
                          ),
                        ],
                      ),
                      if (showDetails3)
                        Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Column(
                            children: [
                              Divider(
                                thickness: 0.2,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(top: 10, bottom: 10),
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
                                    bottom: 25, right: 15, left: 15),
                                child: Text(
                                  "Kurum hakkında detaylı bilgiler buraya yazılacak.",
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              SizedBox(height: 10),
                              Center(
                                child: ElevatedButton(
                                  onPressed: () {
                                    // Bağış yapma işlevselliği buraya eklenecek
                                  },
                                  child: Text("Bağış Yap"),
                                ),
                              ),
                            ],
                          ),
                        ),
                    ],
                  ),
                ),
              ),
              Column(children: [
                Card(
                  margin: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                  color: Colors.blue.shade600,
                  child: Padding(
                    padding: const EdgeInsets.only(
                        top: 12, bottom: 12, right: 25, left: 15),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            ClipOval(
                              child: Image.network(
                                'https://www.sivilsayfalar.org/wp-content/uploads/2023/01/kadin-emegini-degerlendirme-vakfi-kedv-saha-koordinatoru-ariyor-1200x675.jpg',
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
                                    "Kadın Emeğini Değerlendirme Vakfı (KEDV)",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                  Text(
                                    "Kadın Hakları",
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
                                  showDetails4 = !showDetails4;
                                });
                              },
                              child: Icon(
                                showDetails4
                                    ? Icons.arrow_drop_up
                                    : Icons.arrow_drop_down,
                                color: Colors.white,
                                size: 40,
                              ),
                            ),
                          ],
                        ),
                        if (showDetails4)
                          Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Column(
                              children: [
                                Divider(
                                  thickness: 0.2,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 10, bottom: 10),
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
                                      bottom: 25, right: 15, left: 15),
                                  child: Text(
                                    "Kurum hakkında detaylı bilgiler buraya yazılacak.",
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                SizedBox(height: 10),
                                Center(
                                  child: ElevatedButton(
                                    onPressed: () {
                                      // Bağış yapma işlevselliği buraya eklenecek
                                    },
                                    child: Text("Bağış Yap"),
                                  ),
                                ),
                              ],
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
                Column(children: [
                  Card(
                    margin: EdgeInsets.symmetric(vertical: 0, horizontal: 15),
                    color: Colors.blue.shade600,
                    child: Padding(
                      padding: const EdgeInsets.only(
                          top: 12, bottom: 12, right: 25, left: 15),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              ClipOval(
                                child: Image.network(
                                  'https://koruncuk.org/images/koruncuk-og-2.jpg',
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
                                      "Koruncuk Vakfı",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    ),
                                    Text(
                                      "Eğitim ve Sosyal Hizmetler",
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
                                    showDetails5 = !showDetails5;
                                  });
                                },
                                child: Icon(
                                  showDetails5
                                      ? Icons.arrow_drop_up
                                      : Icons.arrow_drop_down,
                                  color: Colors.white,
                                  size: 40,
                                ),
                              ),
                            ],
                          ),
                          if (showDetails5)
                            Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Column(
                                children: [
                                  Divider(
                                    thickness: 0.2,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 10, bottom: 10),
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
                                        bottom: 25, right: 15, left: 15),
                                    child: Text(
                                      "Kurum hakkında detaylı bilgiler buraya yazılacak.",
                                      style: TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                  Center(
                                    child: ElevatedButton(
                                      onPressed: () {
                                        // Bağış yapma işlevselliği buraya eklenecek
                                      },
                                      child: Text("Bağış Yap"),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                        ],
                      ),
                    ),
                  ),
                  Column(children: [
                    Card(
                      margin: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                      color: Colors.blue.shade600,
                      child: Padding(
                        padding: const EdgeInsets.only(
                            top: 12, bottom: 12, right: 25, left: 15),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                ClipOval(
                                  child: Image.network(
                                    'https://cdn-tema.mncdn.com/Uploads/Cms/tema-logomuz_45.jpg',
                                    height: 45,
                                    width: 45,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                SizedBox(width: 15),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "TEMA",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                        ),
                                      ),
                                      Text(
                                        "Çevre Koruma ve Ağaçlandırma",
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
                                      showDetails6 = !showDetails6;
                                    });
                                  },
                                  child: Icon(
                                    showDetails6
                                        ? Icons.arrow_drop_up
                                        : Icons.arrow_drop_down,
                                    color: Colors.white,
                                    size: 40,
                                  ),
                                ),
                              ],
                            ),
                            if (showDetails6)
                              Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: Column(
                                  children: [
                                    Divider(
                                      thickness: 0.2,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 10, bottom: 10),
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
                                          bottom: 25, right: 15, left: 15),
                                      child: Text(
                                        "Kurum hakkında detaylı bilgiler buraya yazılacak.",
                                        style: TextStyle(
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 10),
                                    Center(
                                      child: ElevatedButton(
                                        onPressed: () {
                                          // Bağış yapma işlevselliği buraya eklenecek
                                        },
                                        child: Text("Bağış Yap"),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                          ],
                        ),
                      ),
                    ),
                    Column(children: [
                      Card(
                        margin:
                            EdgeInsets.symmetric(vertical: 0, horizontal: 15),
                        color: Colors.blue.shade600,
                        child: Padding(
                          padding: const EdgeInsets.only(
                              top: 12, bottom: 12, right: 25, left: 15),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  ClipOval(
                                    child: Image.network(
                                      'https://ogrencimerkezi.org/wp-content/uploads/2023/06/turkiye-milli-kultur-vakfi-bursu.jpg',
                                      height: 45,
                                      width: 45,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  SizedBox(width: 15),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Türkiye Milli Kültür Vakfı",
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white,
                                          ),
                                        ),
                                        Text(
                                          "Eğitim ve Kültürel Etkinlikler",
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
                                        showDetails7 = !showDetails7;
                                      });
                                    },
                                    child: Icon(
                                      showDetails7
                                          ? Icons.arrow_drop_up
                                          : Icons.arrow_drop_down,
                                      color: Colors.white,
                                      size: 40,
                                    ),
                                  ),
                                ],
                              ),
                              if (showDetails7)
                                Padding(
                                  padding: const EdgeInsets.all(15.0),
                                  child: Column(
                                    children: [
                                      Divider(
                                        thickness: 0.2,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 10, bottom: 10),
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
                                            bottom: 25, right: 15, left: 15),
                                        child: Text(
                                          "Kurum hakkında detaylı bilgiler buraya yazılacak.",
                                          style: TextStyle(
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                      SizedBox(height: 10),
                                      Center(
                                        child: ElevatedButton(
                                          onPressed: () {
                                            // Bağış yapma işlevselliği buraya eklenecek
                                          },
                                          child: Text("Bağış Yap"),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                            ],
                          ),
                        ),
                      ),Padding(
                        padding: const EdgeInsets.all(14.0),
                        child: Text( textAlign: TextAlign.center,"Sivil Toplum Kuruluşu listeletmek için iletisim@saranel.com.tr adresine talebinizi ileterek listeletme yapabilirsiniz." ,style: TextStyle(color: Colors.white, fontSize: 11),),
                      )
                  ])])])])])])])])])])])])])])));
  }
}

TextStyle appbarStyle() =>
    GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.w800);
