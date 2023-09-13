import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:saranel_application/models/link.dart';

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
  bool showDetails9 = false;
  bool showDetails10 = false;
  bool showDetails11 = false;
  bool showDetails12 = false;
  bool showDetails13 = false;
  bool showDetails14 = false;
  bool showDetails15 = false;
  bool showDetails16 = false;
  bool showDetails17 = false;
  bool showDetails18 = false;
  bool showDetails19 = false;
  bool showDetails20 = false;
  bool showDetails21 = false;
  bool showDetails22 = false;
  bool showDetails23 = false;
  bool showDetails24 = false;
  bool showDetails25 = false;
  bool showDetails26 = false;
  bool showDetails27 = false;
  bool showDetails28 = false;
  bool showDetails29 = false;
  bool showDetails30 = false;
  bool showDetails31 = false;
  bool showDetails32 = false;
  bool showDetails33 = false;
  bool showDetails34 = false;
  bool showDetails35 = false;
  bool showDetails36 = false;

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
                        child: Image.asset(
                                      'assets/images/kizilay.jpg',
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
                                bottom: 25, right: 5, left: 5, top: 15),
                            child: Text(
                              textAlign: TextAlign.center,
                              "Kuruluş Tarihi: 1868 \nGenel Merkez: Ankara, Türkiye \n\nTürkiye Kızılay Derneği, Osmanlı İmparatorluğu döneminde kurulmuş, Türkiye'nin en köklü yardım kuruluşlarından biridir. Kızılay, doğal afetlerde, savaşlarda ve diğer kriz durumlarında ihtiyaç sahiplerine yardım ulaştırır. Aynı zamanda kan bağışı organizasyonları düzenler ve sosyal hizmetlerde bulunur. Kızılay, Uluslararası Kızılhaç ve Kızılay Hareketi'nin bir üyesidir.",
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                          SizedBox(height: 10),
                          Center(
                            child: ElevatedButton(
                              onPressed: launchUrl1,
                              child: Text(
                                "Bağış Yap",
                                style: TextStyle(color: Colors.blue.shade600),
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
                          child: Image.asset(
                                      'assets/images/yesilay.jpg',
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
                              child: Text(
                                textAlign: TextAlign.center,
                                "Kuruluş Tarihi: 1920 \nGenel Merkez: İstanbul, Türkiye \n\nYeşilay, bağımlılıkla mücadele konusunda faaliyet gösteren bir sivil toplum kuruluşudur. Alkol, sigara, uyuşturucu gibi bağımlılık yapan maddelerle mücadele eder ve bu konuda toplumu bilinçlendirmeye yönelik çalışmalar yapar. Aynı zamanda bağımlılıkla mücadelede politika geliştirme, araştırma ve eğitim faaliyetlerinde bulunur. Yeşilay, bağımlı bireylere yönelik rehabilitasyon ve tedavi hizmetleri de sunar.",
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            SizedBox(height: 10),
                            Center(
                              child: ElevatedButton(
                                onPressed: launchUrl2,
                                child: Text("Bağış Yap",
                                    style:
                                        TextStyle(color: Colors.blue.shade600)),
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
                            child: Image.asset(
                                      'assets/images/cydd.jpg',
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
                                child: Text(
                                  textAlign: TextAlign.center,
                                  "Kuruluş Tarihi: 1989 \nGenel Merkez: Ankara, Türkiye \n\nÇağdaş Yaşamı Destekleme Derneği, Türkiye'de çağdaş, laik ve demokratik bir toplum yapısının oluşturulmasını ve sürdürülmesini amaçlayan bir sivil toplum kuruluşudur. Dernek, özellikle eğitim alanında faaliyet gösterir ve kız çocuklarının eğitimine özel bir önem verir. Burslar, eğitim seminerleri ve çeşitli sosyal projeler aracılığıyla toplumun çağdaşlaşmasına katkıda bulunmayı hedefler.",
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              SizedBox(height: 10),
                              Center(
                                child: ElevatedButton(
                                  onPressed: launchUrl3,
                                  child: Text("Bağış Yap",
                                      style: TextStyle(
                                          color: Colors.blue.shade600)),
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
                              child: Image.asset(
                                      'assets/images/thk.jpg',
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
                                  child: Text(
                                    textAlign: TextAlign.center,
                                    "Kuruluş Tarihi: 1925 \nGenel Merkez: Ankara, Türkiye \n\nTürk Hava Kurumu, Türkiye'de havacılığın geliştirilmesi ve yaygınlaştırılması amacıyla kurulmuş bir kurumdur. THK, sivil havacılık eğitimleri, hava araçlarının bakımı ve onarımı, hava ambulans ve yangın söndürme hizmetleri gibi bir dizi faaliyet yürütür. Aynı zamanda, gençlerin havacılığa olan ilgisini artırmak amacıyla çeşitli eğitim programları ve etkinlikler düzenler. THK, Türkiye'nin havacılık alanındaki önemli kuruluşlarından biridir.5 Ağustos 1925 tarihinden itibaren 'kamu yararına çalışan dernek' statüsündedir.",
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                SizedBox(height: 10),
                                Center(
                                  child: ElevatedButton(
                                    onPressed: launchUrl4,
                                    child: Text("Bağış Yap",
                                        style: TextStyle(
                                            color: Colors.blue.shade600)),
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
                                child: Image.asset(
                                      'assets/images/tgok.jpg',
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
                                    child: Text(
                                      textAlign: TextAlign.center,
                                      "Kuruluş Tarihi: 1952 \nGenel Merkez: İstanbul, Türkiye \n\nTürkiye Görme Özürlüler Kitaplığı Derneği, görme engelli bireylerin eğitim ve kültürel ihtiyaçlarına yönelik hizmetler sunar. Dernek, görme engellilere yönelik sesli ve braille alfabesiyle basılmış kitaplar üretir, ayrıca bu bireylerin sosyal entegrasyonunu destekleyici projeler ve etkinlikler düzenler.",
                                      style: TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                  Center(
                                    child: ElevatedButton(
                                      onPressed: launchUrl5,
                                      child: Text("Bağış Yap",
                                          style: TextStyle(
                                              color: Colors.blue.shade600)),
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
                                  child: Image.asset(
                                      'assets/images/tev.jpg',
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
                                        "Türk Eğitim Vakfı (TEV)",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                        ),
                                      ),
                                      Text(
                                        "Eğitim",
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
                                      child: Text(
                                        textAlign: TextAlign.center,
                                        "Kuruluş Tarihi: 1967 \nGenel Merkez: İstanbul, Türkiye \n\nTürk Eğitim Vakfı (TEV), eğitim alanında faaliyet gösteren bir sivil toplum kuruluşudur. Eğitimde fırsat eşitliğini sağlamak amacıyla, maddi durumu yetersiz başarılı öğrencilere burslar ve çeşitli eğitim destekleri sağlar. Aynı zamanda, eğitim kalitesini artırmaya yönelik projeler geliştirir ve uygular. TEV, Türkiye'nin dört bir yanındaki öğrencilere ulaşarak, eğitimde daha adil ve kaliteli bir ortamın oluşmasına katkıda bulunur.",
                                        style: TextStyle(
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 10),
                                    Center(
                                      child: ElevatedButton(
                                        onPressed: launchUrl6,
                                        child: Text("Bağış Yap",
                                            style: TextStyle(
                                                color: Colors.blue.shade600)),
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
                                    child: Image.asset(
                                      'assets/images/wwf.jpg',
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
                                        child: Text(
                                          textAlign: TextAlign.center,
                                          "Kuruluş Tarihi: 1995 (Türkiye Ofisi) \nGenel Merkez: İstanbul, Türkiye \n\nWWF Türkiye, dünya genelinde doğal yaşamın ve biyoçeşitliliğin korunmasına yönelik faaliyetlerde bulunan bir sivil toplum kuruluşudur. Türkiye ofisi, ülkemizdeki doğal kaynakların sürdürülebilir bir şekilde yönetilmesini ve korunmasını amaçlar. WWF Türkiye, iklim değişikliği, su kaynaklarının korunması ve biyoçeşitliliğin korunması gibi konularda projeler yürütür.",
                                          style: TextStyle(
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                      SizedBox(height: 10),
                                      Center(
                                        child: ElevatedButton(
                                          onPressed: launchUrl7,
                                          child: Text("Bağış Yap",
                                              style: TextStyle(
                                                  color: Colors.blue.shade600)),
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
                                      child: Image.asset(
                                      'assets/images/kanser.jpg',
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
                                          child: Text(
                                            textAlign: TextAlign.center,
                                            "Kuruluş Tarihi: 1949 \nGenel Merkez: Ankara, Türkiye \n\nTürk Kanser Derneği, kanserle mücadele konusunda faaliyet gösteren bir sivil toplum kuruluşudur. Dernek, kanserle ilgili farkındalık yaratma, erken tanı ve tarama programları düzenleme, kanser hastalarına ve ailelerine psikososyal destek sağlama gibi konularda çalışmalar yürütür. Aynı zamanda, kanser araştırmalarını destekler ve kanserle mücadelede politika geliştirme çalışmalarında bulunur.",
                                            style: TextStyle(
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                        SizedBox(height: 10),
                                        Center(
                                          child: ElevatedButton(
                                            onPressed: launchUrl8,
                                            child: Text("Bağış Yap",
                                                style: TextStyle(
                                                    color:
                                                        Colors.blue.shade600)),
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
                            margin: EdgeInsets.symmetric(
                                vertical: 15, horizontal: 15),
                            color: Colors.blue.shade600,
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  top: 12, bottom: 12, right: 25, left: 15),
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      ClipOval(
                                        child: Image.asset(
                                      'assets/images/losev.jpg',
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
                                              "LÖSEV",
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white,
                                              ),
                                            ),
                                            Text(
                                              "Sağlık ve Sosyal Yardım",
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
                                            showDetails9 = !showDetails9;
                                          });
                                        },
                                        child: Icon(
                                          showDetails9
                                              ? Icons.arrow_drop_up
                                              : Icons.arrow_drop_down,
                                          color: Colors.white,
                                          size: 40,
                                        ),
                                      ),
                                    ],
                                  ),
                                  if (showDetails9)
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
                                            child: Text(
                                              textAlign: TextAlign.center,
                                              "Kuruluş Tarihi: 1998 \nGenel Merkez: Ankara, Türkiye \n\nLösev, lösemi ve kanser hastası çocuklar ile ailelerine yönelik destek sağlayan bir sivil toplum kuruluşudur. Hastaların tedavi süreçlerini daha iyi koşullarda geçirebilmeleri için gerekli maddi ve manevi desteği sağlar. Aynı zamanda, hastalıkla ilgili farkındalık yaratma ve erken tanı konularında toplumu bilinçlendirmeye yönelik çalışmalar yapar. Lösev, hastalar için sosyal rehabilitasyon programları düzenler ve eğitim destekleri sunar, böylece hastaların yaşam kalitelerini artırmayı hedefler.",
                                              style: TextStyle(
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                          SizedBox(height: 10),
                                          Center(
                                            child: ElevatedButton(
                                              onPressed: launchUrl9,
                                              child: Text("Bağış Yap",
                                                  style: TextStyle(
                                                      color: Colors
                                                          .blue.shade600)),
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
                              margin: EdgeInsets.symmetric(
                                  vertical: 0, horizontal: 15),
                              color: Colors.blue.shade600,
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    top: 12, bottom: 12, right: 25, left: 15),
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        ClipOval(
                                          child: Image.asset(
                                      'assets/images/tbobrekv.jpg',
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
                                              showDetails10 = !showDetails10;
                                            });
                                          },
                                          child: Icon(
                                            showDetails10
                                                ? Icons.arrow_drop_up
                                                : Icons.arrow_drop_down,
                                            color: Colors.white,
                                            size: 40,
                                          ),
                                        ),
                                      ],
                                    ),
                                    if (showDetails10)
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
                                                  bottom: 25,
                                                  right: 5,
                                                  left: 5),
                                              child: Text(
                                                textAlign: TextAlign.center,
                                                "Kuruluş Tarihi: 1980 \nGenel Merkez: İstanbul, Türkiye \n\nTürk Böbrek Vakfı, böbrek hastalıkları ve böbrek yetmezliği konularında toplumu bilinçlendirmek ve hastalara destek olmak amacıyla faaliyet gösteren bir sivil toplum kuruluşudur. Böbrek hastalıklarının önlenmesi, erken tanı ve tedavisi konularında çalışmalar yapar. Aynı zamanda, böbrek nakli ve diyaliz tedavisi gören hastalara maddi ve manevi destek sağlar. Türk Böbrek Vakfı, böbrek sağlığını korumak ve hastalıkların yayılmasını önlemek için çeşitli eğitim ve farkındalık programları düzenler.",
                                                style: TextStyle(
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ),
                                            SizedBox(height: 10),
                                            Center(
                                              child: ElevatedButton(
                                                onPressed: launchUrl10,
                                                child: Text("Bağış Yap",
                                                    style: TextStyle(
                                                        color: Colors
                                                            .blue.shade600)),
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
                                margin: EdgeInsets.symmetric(
                                    vertical: 15, horizontal: 15),
                                color: Colors.blue.shade600,
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      top: 12, bottom: 12, right: 25, left: 15),
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          ClipOval(
                                            child: Image.asset(
                                      'assets/images/kedv.jpg',
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
                                                showDetails11 = !showDetails11;
                                              });
                                            },
                                            child: Icon(
                                              showDetails11
                                                  ? Icons.arrow_drop_up
                                                  : Icons.arrow_drop_down,
                                              color: Colors.white,
                                              size: 40,
                                            ),
                                          ),
                                        ],
                                      ),
                                      if (showDetails11)
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
                                                    bottom: 25,
                                                    right: 5,
                                                    left: 5),
                                                child: Text(
                                                  textAlign: TextAlign.center,
                                                  "Kuruluş Tarihi: 1986 \nGenel Merkez: İstanbul, Türkiye \n\nKEDV, kadınların ekonomik bağımsızlıklarını kazanmalarını ve sosyal yaşama eşit katılımlarını destekleyen bir sivil toplum kuruluşudur. Kadınların kendi işlerini kurmalarını ve yönetmelerini destekleyerek, ekonomik kalkınmaya katkıda bulunmayı hedefler. Aynı zamanda, kadınların liderlik ve karar alma mekanizmalarında daha fazla yer alabilmeleri için eğitim ve destek programları düzenler. KEDV, kadınların ve çocukların yaşam kalitelerini artırmak için çeşitli projeler ve atölye çalışmaları yürütür.",
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                  ),
                                                ),
                                              ),
                                              SizedBox(height: 10),
                                              Center(
                                                child: ElevatedButton(
                                                  onPressed: launchUrl11,
                                                  child: Text("Bağış Yap",
                                                      style: TextStyle(
                                                          color: Colors
                                                              .blue.shade600)),
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
                                  margin: EdgeInsets.symmetric(
                                      vertical: 0, horizontal: 15),
                                  color: Colors.blue.shade600,
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        top: 12,
                                        bottom: 12,
                                        right: 25,
                                        left: 15),
                                    child: Column(
                                      children: [
                                        Row(
                                          children: [
                                            ClipOval(
                                              child: Image.asset(
                                      'assets/images/koruncuk.jpg',
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
                                                    "Koruncuk Vakfı",
                                                    style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                  Text(
                                                    "Çocuk Hakları ve Eğitim",
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
                                                  showDetails12 =
                                                      !showDetails12;
                                                });
                                              },
                                              child: Icon(
                                                showDetails12
                                                    ? Icons.arrow_drop_up
                                                    : Icons.arrow_drop_down,
                                                color: Colors.white,
                                                size: 40,
                                              ),
                                            ),
                                          ],
                                        ),
                                        if (showDetails12)
                                          Padding(
                                            padding: const EdgeInsets.all(15.0),
                                            child: Column(
                                              children: [
                                                Divider(
                                                  thickness: 0.2,
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          top: 10, bottom: 10),
                                                  child: Text(
                                                    "Kurum Hakkında",
                                                    style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          bottom: 25,
                                                          right: 5,
                                                          left: 5),
                                                  child: Text(
                                                    textAlign: TextAlign.center,
                                                    "Kuruluş Tarihi: 1979 \nGenel Merkez: İstanbul, Türkiye \n\nKoruncuk Vakfı, risk altındaki çocuklara ve gençlere yönelik koruyucu ve önleyici hizmetler sunan bir sivil toplum kuruluşudur. Vakıf, çocukların fiziksel, duygusal ve zihinsel gelişimlerini destekleyerek, sağlıklı bireyler olarak yetişmelerini sağlamayı amaçlar. Koruncuk Vakfı, çocuklara güvende, sevgi dolu ve eğitimli bir ortam sunarak, onların topluma faydalı bireyler olarak yetişmelerini destekler. Aynı zamanda, çocuk hakları konusunda toplumsal farkındalığı artırmak için çeşitli kampanyalar ve eğitim programları düzenler.",
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(height: 10),
                                                Center(
                                                  child: ElevatedButton(
                                                    onPressed: launchUrl12,
                                                    child: Text("Bağış Yap",
                                                        style: TextStyle(
                                                            color: Colors.blue
                                                                .shade600)),
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
                                    margin: EdgeInsets.symmetric(
                                        vertical: 15, horizontal: 15),
                                    color: Colors.blue.shade600,
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          top: 12,
                                          bottom: 12,
                                          right: 25,
                                          left: 15),
                                      child: Column(
                                        children: [
                                          Row(
                                            children: [
                                              ClipOval(
                                                child: Image.asset(
                                      'assets/images/tema.jpg',
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
                                                        fontWeight:
                                                            FontWeight.bold,
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
                                                    showDetails13 =
                                                        !showDetails13;
                                                  });
                                                },
                                                child: Icon(
                                                  showDetails13
                                                      ? Icons.arrow_drop_up
                                                      : Icons.arrow_drop_down,
                                                  color: Colors.white,
                                                  size: 40,
                                                ),
                                              ),
                                            ],
                                          ),
                                          if (showDetails13)
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(15.0),
                                              child: Column(
                                                children: [
                                                  Divider(
                                                    thickness: 0.2,
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            top: 10,
                                                            bottom: 10),
                                                    child: Text(
                                                      "Kurum Hakkında",
                                                      style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: Colors.white,
                                                      ),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            bottom: 25,
                                                            right: 5,
                                                            left: 5),
                                                    child: Text(
                                                      textAlign:
                                                          TextAlign.center,
                                                      "Kuruluş Tarihi: 1992 \nGenel Merkez: İstanbul, Türkiye \n\nTEMA Vakfı, Türkiye'nin doğal varlıklarını korumak ve erozyonla mücadele etmek amacıyla kurulmuş bir sivil toplum kuruluşudur. Vakıf, ağaçlandırma projeleri, çevre eğitimi ve farkındalık yaratma kampanyaları yürütür. Aynı zamanda, sürdürülebilir tarım uygulamalarını destekler ve çevresel sorunlar konusunda politika önerileri geliştirir. TEMA, doğal kaynakların korunması ve sürdürülebilir kullanımı için toplumu bilinçlendirmeye yönelik çeşitli etkinlikler ve projeler düzenler.",
                                                      style: TextStyle(
                                                        color: Colors.white,
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(height: 10),
                                                  Center(
                                                    child: ElevatedButton(
                                                      onPressed: launchUrl13,
                                                      child: Text("Bağış Yap",
                                                          style: TextStyle(
                                                              color: Colors.blue
                                                                  .shade600)),
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
                                      margin: EdgeInsets.symmetric(
                                          vertical: 0, horizontal: 15),
                                      color: Colors.blue.shade600,
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            top: 12,
                                            bottom: 12,
                                            right: 25,
                                            left: 15),
                                        child: Column(
                                          children: [
                                            Row(
                                              children: [
                                                ClipOval(
                                                  child: Image.asset(
                                      'assets/images/millikv.jpg',
                                                    height: 45,
                                                    width: 45,
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                                SizedBox(width: 15),
                                                Expanded(
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        "Türkiye Milli Kültür Vakfı",
                                                        style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color: Colors.white,
                                                        ),
                                                      ),
                                                      Text(
                                                        "Kültür ve Sanat",
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
                                                      showDetails14 =
                                                          !showDetails14;
                                                    });
                                                  },
                                                  child: Icon(
                                                    showDetails14
                                                        ? Icons.arrow_drop_up
                                                        : Icons.arrow_drop_down,
                                                    color: Colors.white,
                                                    size: 40,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            if (showDetails14)
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(15.0),
                                                child: Column(
                                                  children: [
                                                    Divider(
                                                      thickness: 0.2,
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              top: 10,
                                                              bottom: 10),
                                                      child: Text(
                                                        "Kurum Hakkında",
                                                        style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color: Colors.white,
                                                        ),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              bottom: 25,
                                                              right: 5,
                                                              left: 5),
                                                      child: Text(
                                                        textAlign:
                                                            TextAlign.center,
                                                        "Kuruluş Tarihi: 1972 \nGenel Merkez: İstanbul, Türkiye \n\nTürkiye Milli Kültür Vakfı, Türk kültürünün ve sanatının tanıtılması ve yaşatılması amacıyla kurulmuş bir sivil toplum kuruluşudur. Vakıf, kültürel mirasın korunması, geleneksel sanatların desteklenmesi ve genç sanatçıların yetiştirilmesi için çeşitli projeler ve etkinlikler düzenler. Aynı zamanda, kültürel araştırmalar yapar ve kültürel yayınlar gerçekleştirir. Türkiye Milli Kültür Vakfı, Türk kültürünün ve sanatının dünya çapında tanıtılması için uluslararası işbirlikleri de yapar.",
                                                        style: TextStyle(
                                                          color: Colors.white,
                                                        ),
                                                      ),
                                                    ),
                                                    SizedBox(height: 10),
                                                    Center(
                                                      child: ElevatedButton(
                                                        onPressed: launchUrl14,
                                                        child: Text("Bağış Yap",
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .blue
                                                                    .shade600)),
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
                              margin: EdgeInsets.symmetric(
                                  vertical: 15, horizontal: 15),
                              color: Colors.blue.shade600,
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    top: 12, bottom: 12, right: 25, left: 15),
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        ClipOval(
                                          child: Image.asset(
                                            'assets/images/tegv.jpg',
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
                                                "Türkiye Eğitim Gönüllüleri Vakfı",
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.white,
                                                ),
                                              ),
                                              Text(
                                                "Eğitim",
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
                                              showDetails15 = !showDetails15;
                                            });
                                          },
                                          child: Icon(
                                            showDetails15
                                                ? Icons.arrow_drop_up
                                                : Icons.arrow_drop_down,
                                            color: Colors.white,
                                            size: 40,
                                          ),
                                        ),
                                      ],
                                    ),
                                    if (showDetails15)
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
                                                  bottom: 25,
                                                  right: 15,
                                                  left: 15),
                                              child: Text(textAlign: TextAlign.center,
                                              "Kuruluş Tarihi: 1995 \nGenel Merkez: İstanbul, Türkiye \n\nTEGV, Türkiye genelinde eğitim alanında fark yaratmayı amaçlayan bir sivil toplum kuruluşudur. Vakıf, çocukların ve gençlerin eğitimine yönelik destek programları, atölye çalışmaları ve eğitim projeleri düzenler. TEGV, eğitimde fırsat eşitliğini sağlamak ve çocukların kişisel gelişimlerini desteklemek amacıyla, özellikle dezavantajlı bölgelerdeki çocuklara yönelik eğitim hizmetleri sunar. Aynı zamanda, eğitimde inovasyon ve kaliteyi artırmak için araştırmalar yapar ve politika önerileri geliştirir.",
                                                style: TextStyle(
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ),
                                            SizedBox(height: 10),
                                            Center(
                                              child: ElevatedButton(
                                                onPressed: launchUrl15,
                                                child: Text("Bağış Yap",style: TextStyle(color: Colors.blue.shade600)),
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
                                margin: EdgeInsets.symmetric(
                                    vertical: 0, horizontal: 15),
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
                                              'https://www.diyadinnet.com/d/etiket/turk-egitim-dernegi-1277.jpg',
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
                                                  "Türk Eğitim Derneği: TED",
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.white,
                                                  ),
                                                ),
                                                Text(
                                                  "Eğitim",
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
                                                showDetails16 = !showDetails16;
                                              });
                                            },
                                            child: Icon(
                                              showDetails16
                                                  ? Icons.arrow_drop_up
                                                  : Icons.arrow_drop_down,
                                              color: Colors.white,
                                              size: 40,
                                            ),
                                          ),
                                        ],
                                      ),
                                      if (showDetails16)
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
                                                    bottom: 25,
                                                    right: 5,
                                                    left: 5),
                                                child: Text(textAlign: TextAlign.center,
                                              "Kuruluş Tarihi: 1928 \nGenel Merkez: Ankara, Türkiye \n\nTürk Eğitim Derneği, Türkiye'de eğitim alanında kaliteyi artırmak ve eğitimde fırsat eşitliği sağlamak amacıyla kurulmuş bir sivil toplum kuruluşudur. Dernek, burslar, eğitim programları ve projeleri aracılığıyla öğrencilere destek olur. Aynı zamanda, eğitimde yenilikçi uygulamaları destekler ve eğitim politikalarının geliştirilmesine katkıda bulunur. TED, eğitimde mükemmeliyeti teşvik etmek için öğretmen eğitimleri ve seminerler düzenler.",
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                  ),
                                                ),
                                              ),
                                              SizedBox(height: 10),
                                              Center(
                                                child: ElevatedButton(
                                                  onPressed: launchUrl16,
                                                  child: Text("Bağış Yap",style: TextStyle(color: Colors.blue.shade600)),
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
                                  margin: EdgeInsets.symmetric(
                                      vertical: 15, horizontal: 15),
                                  color: Colors.blue.shade600,
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        top: 12,
                                        bottom: 12,
                                        right: 25,
                                        left: 15),
                                    child: Column(
                                      children: [
                                        Row(
                                          children: [
                                            ClipOval(
                                              child: Image.network(
                                                'https://www.tog.org.tr/wp-content/uploads/2023/01/Web-Site-Logo.png',
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
                                                    "Toplum Gönüllüleri Vakfı",
                                                    style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                  Text(
                                                    "Gençlik ve Toplum Hizmetleri",
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
                                                  showDetails17 = !showDetails17;
                                                });
                                              },
                                              child: Icon(
                                                showDetails17
                                                    ? Icons.arrow_drop_up
                                                    : Icons.arrow_drop_down,
                                                color: Colors.white,
                                                size: 40,
                                              ),
                                            ),
                                          ],
                                        ),
                                        if (showDetails17)
                                          Padding(
                                            padding: const EdgeInsets.all(15.0),
                                            child: Column(
                                              children: [
                                                Divider(
                                                  thickness: 0.2,
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          top: 10, bottom: 10),
                                                  child: Text(
                                                    "Kurum Hakkında",
                                                    style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          bottom: 25,
                                                          right: 5,
                                                          left: 5),
                                                  child: Text(textAlign: TextAlign.center,
                                              "Kuruluş Tarihi: 2002 \nGenel Merkez: İstanbul, Türkiye \n\nToplum Gönüllüleri Vakfı, gençlerin toplumsal sorunlara duyarlı, aktif ve girişimci bireyler olarak yetişmelerini destekleyen bir sivil toplum kuruluşudur. Vakıf, gençlerin toplumda pozitif bir değişim yaratmalarını sağlamak amacıyla çeşitli projeler ve programlar düzenler. TOG, gençlerin liderlik, girişimcilik ve sosyal sorumluluk becerilerini geliştirmelerine yardımcı olur.",
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(height: 10),
                                                Center(
                                                  child: ElevatedButton(
                                                    onPressed: launchUrl17,
                                                    child: Text("Bağış Yap",style: TextStyle(color: Colors.blue.shade600)),
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
                                    margin: EdgeInsets.symmetric(
                                        vertical: 0, horizontal: 15),
                                    color: Colors.blue.shade600,
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          top: 12,
                                          bottom: 12,
                                          right: 25,
                                          left: 15),
                                      child: Column(
                                        children: [
                                          Row(
                                            children: [
                                              ClipOval(
                                                child: Image.network(
                                                  'https://s.solida.app/cache/ngo/tohum-otizm-vakfi-logo.png?w=200&fit=max&s=c68fe4d113f6b1c1f7a55e4ea18e000a',
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
                                                      "Tohum Otizm Vakfı",
                                                      style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
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
                                                    showDetails18 =
                                                        !showDetails18;
                                                  });
                                                },
                                                child: Icon(
                                                  showDetails18
                                                      ? Icons.arrow_drop_up
                                                      : Icons.arrow_drop_down,
                                                  color: Colors.white,
                                                  size: 40,
                                                ),
                                              ),
                                            ],
                                          ),
                                          if (showDetails18)
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(15.0),
                                              child: Column(
                                                children: [
                                                  Divider(
                                                    thickness: 0.2,
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            top: 10,
                                                            bottom: 10),
                                                    child: Text(
                                                      "Kurum Hakkında",
                                                      style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: Colors.white,
                                                      ),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            bottom: 25,
                                                            right: 5,
                                                            left: 5),
                                                    child: Text(textAlign: TextAlign.center,
                                              "Kuruluş Tarihi: 2003 \nGenel Merkez: İstanbul, Türkiye \n\nTohum Otizm Vakfı, otizm spektrum bozukluğu olan bireylerin erken tanı ve tedavilerini desteklemek, onlara daha iyi bir yaşam kalitesi sunmak amacıyla kurulmuş bir sivil toplum kuruluşudur. Vakıf, otizmli bireylerin topluma entegrasyonunu destekleyen projeler ve programlar düzenler. Aynı zamanda, otizm konusunda toplumsal farkındalığı artırmak için eğitimler ve seminerler gerçekleştirir. Tohum Otizm Vakfı, otizmli bireylerin eğitimine yönelik özel eğitim programları ve materyalleri geliştirir.",
                                                      style: TextStyle(
                                                        color: Colors.white,
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(height: 10),
                                                  Center(
                                                    child: ElevatedButton(
                                                      onPressed: launchUrl18,
                                                      child: Text("Bağış Yap",style: TextStyle(color: Colors.blue.shade600)),
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
                                      margin: EdgeInsets.symmetric(
                                          vertical: 15, horizontal: 15),
                                      color: Colors.blue.shade600,
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            top: 12,
                                            bottom: 12,
                                            right: 25,
                                            left: 15),
                                        child: Column(
                                          children: [
                                            Row(
                                              children: [
                                                ClipOval(
                                                  child: Image.network(
                                                    'https://mir-s3-cdn-cf.behance.net/projects/max_808/22fff5142829283.Y3JvcCw4MDgsNjMyLDAsMTQ.jpg',
                                                    height: 45,
                                                    width: 45,
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                                SizedBox(width: 15),
                                                Expanded(
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        "Türkiye Spastik Çocuklar Vakfı",
                                                        style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
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
                                                      showDetails19 =
                                                          !showDetails19;
                                                    });
                                                  },
                                                  child: Icon(
                                                    showDetails19
                                                        ? Icons.arrow_drop_up
                                                        : Icons.arrow_drop_down,
                                                    color: Colors.white,
                                                    size: 40,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            if (showDetails19)
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(15.0),
                                                child: Column(
                                                  children: [
                                                    Divider(
                                                      thickness: 0.2,
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              top: 10,
                                                              bottom: 10),
                                                      child: Text(
                                                        "Kurum Hakkında",
                                                        style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color: Colors.white,
                                                        ),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              bottom: 25,
                                                              right: 5,
                                                              left: 5),
                                                      child: Text(textAlign: TextAlign.center,
                                              "Kuruluş Tarihi: 1962 \nGenel Merkez: İstanbul, Türkiye \n\nTürkiye Spastik Çocuklar Vakfı, spastik çocukların ve gençlerin fiziksel, zihinsel ve sosyal gelişimlerini desteklemek amacıyla kurulmuş bir sivil toplum kuruluşudur. Vakıf, bu bireylerin topluma entegrasyonunu destekleyen rehabilitasyon programları, eğitim faaliyetleri ve terapiler düzenler. Aynı zamanda, ailelere yönelik danışmanlık hizmetleri sunar ve spastisite konusunda toplumsal farkındalığı artırmak için çeşitli projeler gerçekleştirir.",
                                                        style: TextStyle(
                                                          color: Colors.white,
                                                        ),
                                                      ),
                                                    ),
                                                    SizedBox(height: 10),
                                                    Center(
                                                      child: ElevatedButton(
                                                        onPressed: launchUrl19,
                                                        child:
                                                            Text("Bağış Yap",style: TextStyle(color: Colors.blue.shade600)),
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
                                    margin: EdgeInsets.symmetric(
                                        vertical: 0, horizontal: 15),
                                    color: Colors.blue.shade600,
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          top: 12,
                                          bottom: 12,
                                          right: 25,
                                          left: 15),
                                      child: Column(
                                        children: [
                                          Row(
                                            children: [
                                              ClipOval(
                                                child: Image.network(
                                                  'https://www.diplomasi.net/wp-content/uploads/2018/11/unicef.png',
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
                                                      "UNICEF",
                                                      style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: Colors.white,
                                                      ),
                                                    ),
                                                    Text(
                                                      "Çocuk Hakları ve Kalkınma",
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
                                                    showDetails20 =
                                                        !showDetails20;
                                                  });
                                                },
                                                child: Icon(
                                                  showDetails20
                                                      ? Icons.arrow_drop_up
                                                      : Icons.arrow_drop_down,
                                                  color: Colors.white,
                                                  size: 40,
                                                ),
                                              ),
                                            ],
                                          ),
                                          if (showDetails20)
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(15.0),
                                              child: Column(
                                                children: [
                                                  Divider(
                                                    thickness: 0.2,
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            top: 10,
                                                            bottom: 10),
                                                    child: Text(
                                                      "Kurum Hakkında",
                                                      style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: Colors.white,
                                                      ),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            bottom: 25,
                                                            right: 5,
                                                            left: 5),
                                                    child: Text(textAlign: TextAlign.center,
                                              "Kuruluş Tarihi: 1951 (Türkiye Ofisi) \nGenel Merkez: Ankara, Türkiye \n\nUNICEF, dünya genelinde çocukların sağlık, eğitim ve güvenlik haklarını korumak ve geliştirmek amacıyla faaliyet gösteren bir Birleşmiş Milletler kuruluşudur. UNICEF, çocukların temel haklarına erişimini sağlamak için hükümetlerle işbirliği yapar. Çeşitli projeler ve programlar düzenler. Aynı zamanda, acil durumlarda çocuklara yönelik yardım faaliyetlerinde bulunur.",
                                                      style: TextStyle(
                                                        color: Colors.white,
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(height: 10),
                                                  Center(
                                                    child: ElevatedButton(
                                                      onPressed: launchUrl20,
                                                      child: Text("Bağış Yap",style: TextStyle(color: Colors.blue.shade600)),
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
                                      margin: EdgeInsets.symmetric(
                                          vertical: 15, horizontal: 15),
                                      color: Colors.blue.shade600,
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            top: 12,
                                            bottom: 12,
                                            right: 25,
                                            left: 15),
                                        child: Column(
                                          children: [
                                            Row(
                                              children: [
                                                ClipOval(
                                                  child: Image.network(
                                                    'https://www.girisimhaberleri.com/wp-content/uploads/2023/02/Calisma-Yuzeyi-1-1-scaled.jpg',
                                                    height: 45,
                                                    width: 45,
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                                SizedBox(width: 15),
                                                Expanded(
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        "Ahbap",
                                                        style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color: Colors.white,
                                                        ),
                                                      ),
                                                      Text(
                                                        "Toplum Hizmetleri ve Yardımlaşma",
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
                                                      showDetails21 =
                                                          !showDetails21;
                                                    });
                                                  },
                                                  child: Icon(
                                                    showDetails21
                                                        ? Icons.arrow_drop_up
                                                        : Icons.arrow_drop_down,
                                                    color: Colors.white,
                                                    size: 40,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            if (showDetails21)
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(15.0),
                                                child: Column(
                                                  children: [
                                                    Divider(
                                                      thickness: 0.2,
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              top: 10,
                                                              bottom: 10),
                                                      child: Text(
                                                        "Kurum Hakkında",
                                                        style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color: Colors.white,
                                                        ),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              bottom: 25,
                                                              right: 5,
                                                              left: 5),
                                                      child: Text(textAlign: TextAlign.center,
                                              "Kuruluş Tarihi: 2020 \nGenel Merkez: İstanbul, Türkiye \n\nAhbap, sanatçı Haluk Levent tarafından kurulmuş, toplumsal dayanışmayı ve yardımlaşmayı teşvik eden bir platformdur. Ahbap, ihtiyaç sahibi bireylerle yardımseverleri bir araya getirir ve sosyal yardım projeleri düzenler. Platform, eğitim, sağlık, barınma gibi alanlarda destek sağlar ve toplumda pozitif bir değişim yaratmayı amaçlar.",
                                                        style: TextStyle(
                                                          color: Colors.white,
                                                        ),
                                                      ),
                                                    ),
                                                    SizedBox(height: 10),
                                                    Center(
                                                      child: ElevatedButton(
                                                        onPressed: launchUrl21,
                                                        child:
                                                            Text("Bağış Yap",style: TextStyle(color: Colors.blue.shade600)),
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
                              margin: EdgeInsets.symmetric(
                                  vertical: 0, horizontal: 15),
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
                                            'https://www.akut.org.tr/images/AKUT-logo-400x400.png',
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
                                                "AKUT Arama Kurtarma Derneği",
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.white,
                                                ),
                                              ),
                                              Text(
                                                "Afet ve Acil Durum Yardımı",
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
                                              showDetails22 = !showDetails22;
                                            });
                                          },
                                          child: Icon(
                                            showDetails22
                                                ? Icons.arrow_drop_up
                                                : Icons.arrow_drop_down,
                                            color: Colors.white,
                                            size: 40,
                                          ),
                                        ),
                                      ],
                                    ),
                                    if (showDetails22)
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
                                                  bottom: 25,
                                                  right: 5,
                                                  left: 5),
                                              child: Text(textAlign: TextAlign.center,
                                              "Kuruluş Tarihi: 1996 \nGenel Merkez: İstanbul, Türkiye \n\nAKUT, Türkiye'de doğal afetler ve acil durumlar sırasında arama-kurtarma faaliyetlerini yürüten gönüllü bir sivil toplum kuruluşudur. Dernek, afetlere hızlı ve etkili bir şekilde müdahale etmek için eğitimli gönüllülerle çalışır. Aynı zamanda, afet bilinci ve hazırlığı konusunda toplumu bilinçlendirmek için eğitimler ve seminerler düzenler. AKUT, afetlerde can kaybını önlemek ve afetzedelere yardımcı olmak amacıyla faaliyet gösterir.",
                                                style: TextStyle(
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ),
                                            SizedBox(height: 10),
                                            Center(
                                              child: ElevatedButton(
                                                onPressed: launchUrl22,
                                                child: Text("Bağış Yap",style: TextStyle(color: Colors.blue.shade600)),
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
                                margin: EdgeInsets.symmetric(
                                    vertical: 15, horizontal: 15),
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
                                              'https://yt3.googleusercontent.com/7iRIziKVfTrhxCchikusLcQqwNpT6it3wkQSbiPYL4loUPlUbSz089NavnVS5dOOzfOJq-d09w=s900-c-k-c0x00ffffff-no-rj',
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
                                                  "Darüşşafaka Cemiyeti",
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.white,
                                                  ),
                                                ),
                                                Text(
                                                  "Eğitim",
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
                                                showDetails23 = !showDetails23;
                                              });
                                            },
                                            child: Icon(
                                              showDetails23
                                                  ? Icons.arrow_drop_up
                                                  : Icons.arrow_drop_down,
                                              color: Colors.white,
                                              size: 40,
                                            ),
                                          ),
                                        ],
                                      ),
                                      if (showDetails23)
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
                                                    bottom: 25,
                                                    right: 5,
                                                    left: 5),
                                                child: Text(textAlign: TextAlign.center,
                                              "Kuruluş Tarihi: 1863 \nGenel Merkez: İstanbul, Türkiye \n\nDarüşşafaka Cemiyeti, annesi veya babası hayatta olmayan, maddi durumu yetersiz çocuklara eğitim imkanı sağlayan bir sivil toplum kuruluşudur. Cemiyet, çocuklara ilkokuldan üniversiteye kadar kapsamlı bir eğitim programı sunar ve onların sosyal, kültürel ve sportif gelişimlerini destekler. Darüşşafaka, eğitimde fırsat eşitliğini sağlamak için çeşitli burs ve destek programları düzenler.",
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                  ),
                                                ),
                                              ),
                                              SizedBox(height: 10),
                                              Center(
                                                child: ElevatedButton(
                                                  onPressed: launchUrl23,
                                                  child: Text("Bağış Yap",style: TextStyle(color: Colors.blue.shade600)),
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
                                  margin: EdgeInsets.symmetric(
                                      vertical: 0, horizontal: 15),
                                  color: Colors.blue.shade600,
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        top: 12,
                                        bottom: 12,
                                        right: 25,
                                        left: 15),
                                    child: Column(
                                      children: [
                                        Row(
                                          children: [
                                            ClipOval(
                                              child: Image.network(
                                                'https://cdn.fonzip.com/public/kacuv/img/fundraising/kacuv_logo_1486383953039.jpg',
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
                                                    "Kanserli Çocuklara Umut Vakfı (KAÇUV)",
                                                    style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
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
                                                  showDetails24 = !showDetails24;
                                                });
                                              },
                                              child: Icon(
                                                showDetails24
                                                    ? Icons.arrow_drop_up
                                                    : Icons.arrow_drop_down,
                                                color: Colors.white,
                                                size: 40,
                                              ),
                                            ),
                                          ],
                                        ),
                                        if (showDetails24)
                                          Padding(
                                            padding: const EdgeInsets.all(15.0),
                                            child: Column(
                                              children: [
                                                Divider(
                                                  thickness: 0.2,
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          top: 10, bottom: 10),
                                                  child: Text(
                                                    "Kurum Hakkında",
                                                    style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          bottom: 25,
                                                          right: 5,
                                                          left: 5),
                                                  child: Text(textAlign: TextAlign.center,
                                              "Kuruluş Tarihi: 2000 \nGenel Merkez: İstanbul, Türkiye \n\nKAÇUV, kanser tedavisi gören çocuklar ve ailelerine psikososyal destek sağlamak amacıyla kurulmuş bir vakıftır. Vakıf, çocukların tedavi sürecini daha konforlu ve destekleyici bir şekilde geçirmelerini sağlamak için çeşitli projeler ve programlar düzenler. Aynı zamanda, ailelere psikolojik destek ve danışmanlık hizmetleri sunar.",
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(height: 10),
                                                Center(
                                                  child: ElevatedButton(
                                                    onPressed: launchUrl24,
                                                    child: Text("Bağış Yap",style: TextStyle(color: Colors.blue.shade600)),
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
                                    margin: EdgeInsets.symmetric(
                                        vertical: 15, horizontal: 15),
                                    color: Colors.blue.shade600,
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          top: 12,
                                          bottom: 12,
                                          right: 25,
                                          left: 15),
                                      child: Column(
                                        children: [
                                          Row(
                                            children: [
                                              ClipOval(
                                                child: Image.network(
                                                  'https://logowik.com/content/uploads/images/553_ihh_logo.jpg',
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
                                                      "İnsani Yardım Vakfı (İHH)",
                                                      style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: Colors.white,
                                                      ),
                                                    ),
                                                    Text(
                                                      "İnsani Yardım",
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
                                                    showDetails25 =
                                                        !showDetails25;
                                                  });
                                                },
                                                child: Icon(
                                                  showDetails25
                                                      ? Icons.arrow_drop_up
                                                      : Icons.arrow_drop_down,
                                                  color: Colors.white,
                                                  size: 40,
                                                ),
                                              ),
                                            ],
                                          ),
                                          if (showDetails25)
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(15.0),
                                              child: Column(
                                                children: [
                                                  Divider(
                                                    thickness: 0.2,
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            top: 10,
                                                            bottom: 10),
                                                    child: Text(
                                                      "Kurum Hakkında",
                                                      style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: Colors.white,
                                                      ),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            bottom: 25,
                                                            right: 5,
                                                            left: 5),
                                                    child: Text(textAlign: TextAlign.center,
                                              "Kuruluş Tarihi: 1992 \nGenel Merkez: İstanbul, Türkiye \n\nİHH, dünya genelinde ihtiyaç sahibi bireylere ve topluluklara insani yardım sağlayan bir sivil toplum kuruluşudur. Vakıf, doğal afetler, savaşlar ve krizler sırasında yardım faaliyetlerinde bulunur. Eğitim, sağlık, su ve sanitasyon gibi alanlarda projeler gerçekleştirir ve ihtiyaç sahiplerine ulaştırır.",
                                                      style: TextStyle(
                                                        color: Colors.white,
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(height: 10),
                                                  Center(
                                                    child: ElevatedButton(
                                                      onPressed: launchUrl25,
                                                      child: Text("Bağış Yap",style: TextStyle(color: Colors.blue.shade600)),
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
                                      margin: EdgeInsets.symmetric(
                                          vertical: 0, horizontal: 15),
                                      color: Colors.blue.shade600,
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            top: 12,
                                            bottom: 12,
                                            right: 25,
                                            left: 15),
                                        child: Column(
                                          children: [
                                            Row(
                                              children: [
                                                ClipOval(
                                                  child: Image.network(
                                                    'https://www.sivilsayfalar.org/wp-content/uploads/2022/03/acev-babalik-calismalari-uzmani-ariyor.jpg',
                                                    height: 45,
                                                    width: 45,
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                                SizedBox(width: 15),
                                                Expanded(
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        "Anne Çocuk Eğitim Vakfı (AÇEV)",
                                                        style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color: Colors.white,
                                                        ),
                                                      ),
                                                      Text(
                                                        "Eğitim",
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
                                                      showDetails26 =
                                                          !showDetails26;
                                                    });
                                                  },
                                                  child: Icon(
                                                    showDetails26
                                                        ? Icons.arrow_drop_up
                                                        : Icons.arrow_drop_down,
                                                    color: Colors.white,
                                                    size: 40,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            if (showDetails26)
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(15.0),
                                                child: Column(
                                                  children: [
                                                    Divider(
                                                      thickness: 0.2,
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              top: 10,
                                                              bottom: 10),
                                                      child: Text(
                                                        "Kurum Hakkında",
                                                        style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color: Colors.white,
                                                        ),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              bottom: 25,
                                                              right: 5,
                                                              left: 5),
                                                      child: Text(textAlign: TextAlign.center,
                                              "Kuruluş Tarihi: 1993 \nGenel Merkez: İstanbul, Türkiye \n\nAÇEV, erken çocukluk eğitimi ve aile eğitimi alanlarında faaliyet gösteren bir sivil toplum kuruluşudur. Vakıf, çocukların bilişsel, duygusal ve sosyal gelişimlerini desteklemek için çeşitli eğitim programları düzenler. Aynı zamanda, ailelere yönelik eğitimlerle, çocukların sağlıklı bir şekilde büyümelerini ve gelişmelerini destekler. AÇEV, toplumda eğitim fırsatlarının artırılması için çeşitli projeler ve kampanyalar gerçekleştirir.",
                                                        style: TextStyle(
                                                          color: Colors.white,
                                                        ),
                                                      ),
                                                    ),
                                                    SizedBox(height: 10),
                                                    Center(
                                                      child: ElevatedButton(
                                                        onPressed: launchUrl26,
                                                        child:
                                                            Text("Bağış Yap",style: TextStyle(color: Colors.blue.shade600)),
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
                                    margin: EdgeInsets.symmetric(
                                        vertical: 15, horizontal: 15),
                                    color: Colors.blue.shade600,
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          top: 12,
                                          bottom: 12,
                                          right: 25,
                                          left: 15),
                                      child: Column(
                                        children: [
                                          Row(
                                            children: [
                                              ClipOval(
                                                child: Image.network(
                                                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQlLu1ITeQePgzxe6EmX62qj0KIp0O8LNoUO0gLPqPKYzMo8h3GIVXnSBXtG13CzUP57v8&usqp=CAU',
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
                                                      "Down Sendromu Derneği",
                                                      style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
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
                                                    showDetails27 =
                                                        !showDetails27;
                                                  });
                                                },
                                                child: Icon(
                                                  showDetails27
                                                      ? Icons.arrow_drop_up
                                                      : Icons.arrow_drop_down,
                                                  color: Colors.white,
                                                  size: 40,
                                                ),
                                              ),
                                            ],
                                          ),
                                          if (showDetails27)
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(15.0),
                                              child: Column(
                                                children: [
                                                  Divider(
                                                    thickness: 0.2,
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            top: 10,
                                                            bottom: 10),
                                                    child: Text(
                                                      "Kurum Hakkında",
                                                      style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: Colors.white,
                                                      ),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            bottom: 25,
                                                            right: 5,
                                                            left: 5),
                                                    child: Text(textAlign: TextAlign.center,
                                              "Kuruluş Tarihi: 2005 \nGenel Merkez: Ankara, Türkiye \n\nDown Sendromu Derneği, Down sendromlu bireylerin ve ailelerinin yaşam kalitesini artırmak amacıyla kurulmuş bir sivil toplum kuruluşudur. Dernek, eğitim, sağlık ve sosyal hizmetler alanlarında destek sağlar, aynı zamanda toplumu Down sendromu konusunda bilinçlendirmeye yönelik çalışmalar yapar.",
                                                      style: TextStyle(
                                                        color: Colors.white,
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(height: 10),
                                                  Center(
                                                    child: ElevatedButton(
                                                      onPressed: launchUrl27,
                                                      child: Text("Bağış Yap",style: TextStyle(color: Colors.blue.shade600)),
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
                                      margin: EdgeInsets.symmetric(
                                          vertical: 0, horizontal: 15),
                                      color: Colors.blue.shade600,
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            top: 12,
                                            bottom: 12,
                                            right: 25,
                                            left: 15),
                                        child: Column(
                                          children: [
                                            Row(
                                              children: [
                                                ClipOval(
                                                  child: Image.network(
                                                    'https://cdnuploads.aa.com.tr/uploads/Contents/2014/09/04/thumbs_b_c_cc9235176ab33a3e4b5db31c2ebbd3f1.jpg',
                                                    height: 45,
                                                    width: 45,
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                                SizedBox(width: 15),
                                                Expanded(
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        "Türkiye Diyanet Vakfı",
                                                        style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color: Colors.white,
                                                        ),
                                                      ),
                                                      Text(
                                                        "Dinî ve Sosyal Hizmetler",
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
                                                      showDetails28 =
                                                          !showDetails28;
                                                    });
                                                  },
                                                  child: Icon(
                                                    showDetails28
                                                        ? Icons.arrow_drop_up
                                                        : Icons.arrow_drop_down,
                                                    color: Colors.white,
                                                    size: 40,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            if (showDetails28)
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(15.0),
                                                child: Column(
                                                  children: [
                                                    Divider(
                                                      thickness: 0.2,
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              top: 10,
                                                              bottom: 10),
                                                      child: Text(
                                                        "Kurum Hakkında",
                                                        style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color: Colors.white,
                                                        ),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              bottom: 25,
                                                              right: 5,
                                                              left: 5),
                                                      child: Text(textAlign: TextAlign.center,
                                              "Kuruluş Tarihi: 1975 \nGenel Merkez: Ankara, Türkiye \n\nTürkiye Diyanet Vakfı, dinî, kültürel ve sosyal hizmetler alanında faaliyet gösteren bir vakıftır. Vakıf, eğitim, sağlık, kültür ve sosyal yardım projeleri düzenler, aynı zamanda yurt içinde ve yurt dışında ihtiyaç sahiplerine yardım ulaştırır.",
                                                        style: TextStyle(
                                                          color: Colors.white,
                                                        ),
                                                      ),
                                                    ),
                                                    SizedBox(height: 10),
                                                    Center(
                                                      child: ElevatedButton(
                                                        onPressed: launchUrl28,
                                                        child:
                                                            Text("Bağış Yap",style: TextStyle(color: Colors.blue.shade600)),
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
                              margin: EdgeInsets.symmetric(
                                  vertical: 15, horizontal: 15),
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
                                            'https://www.akut.org.tr/images/AKUT-logo-400x400.png',
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
                                                "Türkiye Gaziler ve Şehit Aileleri Vakfı",
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.white,
                                                ),
                                              ),
                                              Text(
                                                "Sosyal Yardım ve Destek",
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
                                              showDetails29 = !showDetails29;
                                            });
                                          },
                                          child: Icon(
                                            showDetails29
                                                ? Icons.arrow_drop_up
                                                : Icons.arrow_drop_down,
                                            color: Colors.white,
                                            size: 40,
                                          ),
                                        ),
                                      ],
                                    ),
                                    if (showDetails29)
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
                                                  bottom: 25,
                                                  right: 5,
                                                  left: 5),
                                              child: Text(textAlign: TextAlign.center,
                                              "Kuruluş Tarihi: 1995 \nGenel Merkez: Ankara, Türkiye \n\nTürkiye Gaziler ve Şehit Aileleri Vakfı, şehit ailelerine ve gazilere maddi ve manevi destek sağlamak amacıyla faaliyet gösteren bir sivil toplum kuruluşudur. Vakıf, şehit ailelerinin ve gazilerin yaşam kalitelerini artırmak, eğitim ve sağlık gibi temel ihtiyaçlarını karşılamak ve onlara psikososyal destek sağlamak gibi faaliyetlerde bulunur. Aynı zamanda, şehitliklerin bakımı ve onarımları konularında da çalışmalar yürütür.",
                                                style: TextStyle(
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ),
                                            SizedBox(height: 10),
                                            Center(
                                              child: ElevatedButton(
                                                onPressed: launchUrl29,
                                                child: Text("Bağış Yap",style: TextStyle(color: Colors.blue.shade600)),
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
                                margin: EdgeInsets.symmetric(
                                    vertical: 0, horizontal: 15),
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
                                              'https://yt3.googleusercontent.com/7iRIziKVfTrhxCchikusLcQqwNpT6it3wkQSbiPYL4loUPlUbSz089NavnVS5dOOzfOJq-d09w=s900-c-k-c0x00ffffff-no-rj',
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
                                                  "TİDER",
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.white,
                                                  ),
                                                ),
                                                Text(
                                                  "Sosyal Yardım",
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
                                                showDetails30 = !showDetails30;
                                              });
                                            },
                                            child: Icon(
                                              showDetails30
                                                  ? Icons.arrow_drop_up
                                                  : Icons.arrow_drop_down,
                                              color: Colors.white,
                                              size: 40,
                                            ),
                                          ),
                                        ],
                                      ),
                                      if (showDetails30)
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
                                                    bottom: 25,
                                                    right: 5,
                                                    left: 5),
                                                child: Text(textAlign: TextAlign.center,
                                              "Kuruluş Tarihi: 2010 \nGenel Merkez: İstanbul, Türkiye \n\nTemel İhtiyaç Derneği (TİDER), işsizlikle mücadele ve temel ihtiyaçların karşılanması alanında faaliyet gösteren bir sivil toplum kuruluşudur. Dernek, işsiz bireylere iş bulma konusunda yardımcı olurken, aynı zamanda yardıma muhtaç bireylere gıda, giyim gibi temel ihtiyaçlarını karşılayacak yardımlar ulaştırır. TİDER, sürdürülebilir yardım modeli ile toplumda pozitif bir değişim yaratmayı hedefler.",
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                  ),
                                                ),
                                              ),
                                              SizedBox(height: 10),
                                              Center(
                                                child: ElevatedButton(
                                                  onPressed: launchUrl30,
                                                  child: Text("Bağış Yap",style: TextStyle(color: Colors.blue.shade600)),
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
                                  margin: EdgeInsets.symmetric(
                                      vertical: 15, horizontal: 15),
                                  color: Colors.blue.shade600,
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        top: 12,
                                        bottom: 12,
                                        right: 25,
                                        left: 15),
                                    child: Column(
                                      children: [
                                        Row(
                                          children: [
                                            ClipOval(
                                              child: Image.network(
                                                'https://cdn.fonzip.com/public/kacuv/img/fundraising/kacuv_logo_1486383953039.jpg',
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
                                                    "Pİ Kadın Kanserleri Derneği",
                                                    style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
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
                                                  showDetails31 = !showDetails31;
                                                });
                                              },
                                              child: Icon(
                                                showDetails31
                                                    ? Icons.arrow_drop_up
                                                    : Icons.arrow_drop_down,
                                                color: Colors.white,
                                                size: 40,
                                              ),
                                            ),
                                          ],
                                        ),
                                        if (showDetails31)
                                          Padding(
                                            padding: const EdgeInsets.all(15.0),
                                            child: Column(
                                              children: [
                                                Divider(
                                                  thickness: 0.2,
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          top: 10, bottom: 10),
                                                  child: Text(
                                                    "Kurum Hakkında",
                                                    style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          bottom: 25,
                                                          right: 5,
                                                          left: 5),
                                                  child: Text(textAlign: TextAlign.center,
                                              "Kuruluş Tarihi: 2012 \nGenel Merkez: İstanbul, Türkiye \n\nPembe İzler Kadın Kanserleri Derneği, kadınlarda görülen kanser türleriyle mücadele eden bir sivil toplum kuruluşudur. Dernek, kanserle mücadelede erken tanının önemini vurgulayan bilinçlendirme çalışmaları yapar, aynı zamanda kanser hastalarına ve ailelerine psikolojik ve maddi destek sağlar.",
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(height: 10),
                                                Center(
                                                  child: ElevatedButton(
                                                    onPressed: launchUrl31,
                                                    child: Text("Bağış Yap",style: TextStyle(color: Colors.blue.shade600)),
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
                                    margin: EdgeInsets.symmetric(
                                        vertical: 0, horizontal: 15),
                                    color: Colors.blue.shade600,
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          top: 12,
                                          bottom: 12,
                                          right: 25,
                                          left: 15),
                                      child: Column(
                                        children: [
                                          Row(
                                            children: [
                                              ClipOval(
                                                child: Image.network(
                                                  'https://logowik.com/content/uploads/images/553_ihh_logo.jpg',
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
                                                      "Maya Vakfı",
                                                      style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: Colors.white,
                                                      ),
                                                    ),
                                                    Text(
                                                      "Çocuk ve Gençlik",
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
                                                    showDetails32 =
                                                        !showDetails32;
                                                  });
                                                },
                                                child: Icon(
                                                  showDetails32
                                                      ? Icons.arrow_drop_up
                                                      : Icons.arrow_drop_down,
                                                  color: Colors.white,
                                                  size: 40,
                                                ),
                                              ),
                                            ],
                                          ),
                                          if (showDetails32)
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(15.0),
                                              child: Column(
                                                children: [
                                                  Divider(
                                                    thickness: 0.2,
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            top: 10,
                                                            bottom: 10),
                                                    child: Text(
                                                      "Kurum Hakkında",
                                                      style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: Colors.white,
                                                      ),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            bottom: 25,
                                                            right: 5,
                                                            left: 5),
                                                    child: Text(textAlign: TextAlign.center,
                                              "Kuruluş Tarihi: 2015 \nGenel Merkez: İstanbul, Türkiye \n\nMaya Vakfı, travma geçirmiş çocuklar ve gençler için psikososyal destek programları düzenleyen bir sivil toplum kuruluşudur. Vakıf, çocukların ve gençlerin ruhsal yaralarını sarmalarına yardımcı olurken, aynı zamanda onların topluma sağlıklı bir şekilde entegre olmalarını destekler.",
                                                      style: TextStyle(
                                                        color: Colors.white,
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(height: 10),
                                                  Center(
                                                    child: ElevatedButton(
                                                      onPressed: launchUrl32,
                                                      child: Text("Bağış Yap",style: TextStyle(color: Colors.blue.shade600)),
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
                                      margin: EdgeInsets.symmetric(
                                          vertical: 15, horizontal: 15),
                                      color: Colors.blue.shade600,
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            top: 12,
                                            bottom: 12,
                                            right: 25,
                                            left: 15),
                                        child: Column(
                                          children: [
                                            Row(
                                              children: [
                                                ClipOval(
                                                  child: Image.network(
                                                    'https://www.sivilsayfalar.org/wp-content/uploads/2022/03/acev-babalik-calismalari-uzmani-ariyor.jpg',
                                                    height: 45,
                                                    width: 45,
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                                SizedBox(width: 15),
                                                Expanded(
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        "Nesin Vakfı",
                                                        style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color: Colors.white,
                                                        ),
                                                      ),
                                                      Text(
                                                        "Eğitim",
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
                                                      showDetails33 =
                                                          !showDetails33;
                                                    });
                                                  },
                                                  child: Icon(
                                                    showDetails33
                                                        ? Icons.arrow_drop_up
                                                        : Icons.arrow_drop_down,
                                                    color: Colors.white,
                                                    size: 40,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            if (showDetails33)
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(15.0),
                                                child: Column(
                                                  children: [
                                                    Divider(
                                                      thickness: 0.2,
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              top: 10,
                                                              bottom: 10),
                                                      child: Text(
                                                        "Kurum Hakkında",
                                                        style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color: Colors.white,
                                                        ),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              bottom: 25,
                                                              right: 5,
                                                              left: 5),
                                                      child: Text(textAlign: TextAlign.center,
                                              "Kuruluş Tarihi: 1982 \nGenel Merkez: İstanbul, Türkiye \n\nNesin Vakfı, Aziz Nesin tarafından kurulmuş bir eğitim vakfıdır. Vakıf, eğitimde fırsat eşitliği sağlamak amacıyla maddi imkânı kısıtlı yetenekli çocuklara burs ve eğitim olanakları sunar. Aynı zamanda, Aziz Nesin'in eserlerini yaşatma ve yayma görevini de üstlenmiştir.",
                                                        style: TextStyle(
                                                          color: Colors.white,
                                                        ),
                                                      ),
                                                    ),
                                                    SizedBox(height: 10),
                                                    Center(
                                                      child: ElevatedButton(
                                                        onPressed: launchUrl33,
                                                        child:
                                                            Text("Bağış Yap",style: TextStyle(color: Colors.blue.shade600)),
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
                                    margin: EdgeInsets.symmetric(
                                        vertical: 0, horizontal: 15),
                                    color: Colors.blue.shade600,
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          top: 12,
                                          bottom: 12,
                                          right: 25,
                                          left: 15),
                                      child: Column(
                                        children: [
                                          Row(
                                            children: [
                                              ClipOval(
                                                child: Image.network(
                                                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQlLu1ITeQePgzxe6EmX62qj0KIp0O8LNoUO0gLPqPKYzMo8h3GIVXnSBXtG13CzUP57v8&usqp=CAU',
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
                                                      "Akdeniz Koruma Derneği",
                                                      style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: Colors.white,
                                                      ),
                                                    ),
                                                    Text(
                                                      "Çevre Koruma",
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
                                                    showDetails34 =
                                                        !showDetails34;
                                                  });
                                                },
                                                child: Icon(
                                                  showDetails34
                                                      ? Icons.arrow_drop_up
                                                      : Icons.arrow_drop_down,
                                                  color: Colors.white,
                                                  size: 40,
                                                ),
                                              ),
                                            ],
                                          ),
                                          if (showDetails34)
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(15.0),
                                              child: Column(
                                                children: [
                                                  Divider(
                                                    thickness: 0.2,
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            top: 10,
                                                            bottom: 10),
                                                    child: Text(
                                                      "Kurum Hakkında",
                                                      style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: Colors.white,
                                                      ),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            bottom: 25,
                                                            right: 5,
                                                            left: 5),
                                                    child: Text(textAlign: TextAlign.center,
                                              "Kuruluş Tarihi: 1993 \nGenel Merkez: Antalya, Türkiye \n\nAkdeniz Koruma Derneği, Akdeniz bölgesinin doğal ve kültürel değerlerini korumak ve sürdürülebilir bir şekilde yönetmek amacıyla faaliyet gösteren bir sivil toplum kuruluşudur. Dernek, deniz ve kıyı ekosistemlerinin korunması, biyoçeşitliliğin artırılması ve sürdürülebilir balıkçılık gibi konulara odaklanır. Aynı zamanda, çevre bilincini artırmak için eğitim ve bilinçlendirme çalışmaları da yürütür.",
                                                      style: TextStyle(
                                                        color: Colors.white,
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(height: 10),
                                                  Center(
                                                    child: ElevatedButton(
                                                      onPressed: launchUrl34,
                                                      child: Text("Bağış Yap",style: TextStyle(color: Colors.blue.shade600)),
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
                                      margin: EdgeInsets.symmetric(
                                          vertical: 15, horizontal: 15),
                                      color: Colors.blue.shade600,
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            top: 12,
                                            bottom: 12,
                                            right: 25,
                                            left: 15),
                                        child: Column(
                                          children: [
                                            Row(
                                              children: [
                                                ClipOval(
                                                  child: Image.network(
                                                    'https://cdnuploads.aa.com.tr/uploads/Contents/2014/09/04/thumbs_b_c_cc9235176ab33a3e4b5db31c2ebbd3f1.jpg',
                                                    height: 45,
                                                    width: 45,
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                                SizedBox(width: 15),
                                                Expanded(
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        "Bir Dilek Tut Derneği",
                                                        style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color: Colors.white,
                                                        ),
                                                      ),
                                                      Text(
                                                        "Çocuk Sağlığı ve Eğitim",
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
                                                      showDetails35 =
                                                          !showDetails35;
                                                    });
                                                  },
                                                  child: Icon(
                                                    showDetails35
                                                        ? Icons.arrow_drop_up
                                                        : Icons.arrow_drop_down,
                                                    color: Colors.white,
                                                    size: 40,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            if (showDetails35)
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(15.0),
                                                child: Column(
                                                  children: [
                                                    Divider(
                                                      thickness: 0.2,
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              top: 10,
                                                              bottom: 10),
                                                      child: Text(
                                                        "Kurum Hakkında",
                                                        style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color: Colors.white,
                                                        ),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              bottom: 25,
                                                              right: 5,
                                                              left: 5),
                                                      child: Text(textAlign: TextAlign.center,
                                              "Kuruluş Tarihi: 2000 \nGenel Merkez: İstanbul, Türkiye \n\nBir Dilek Tut Derneği, ciddi hastalıklara sahip çocukların dileklerini gerçekleştirerek onlara moral ve motivasyon kazandırmayı amaçlayan bir sivil toplum kuruluşudur.",
                                                        style: TextStyle(
                                                          color: Colors.white,
                                                        ),
                                                      ),
                                                    ),
                                                    SizedBox(height: 10),
                                                    Center(
                                                      child: ElevatedButton(
                                                        onPressed: launchUrl35,
                                                        child:
                                                            Text("Bağış Yap",style: TextStyle(color: Colors.blue.shade600)),
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
                                      margin: EdgeInsets.symmetric(
                                          vertical: 0, horizontal: 15),
                                      color: Colors.blue.shade600,
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            top: 12,
                                            bottom: 12,
                                            right: 25,
                                            left: 15),
                                        child: Column(
                                          children: [
                                            Row(
                                              children: [
                                                ClipOval(
                                                  child: Image.network(
                                                    'https://cdnuploads.aa.com.tr/uploads/Contents/2014/09/04/thumbs_b_c_cc9235176ab33a3e4b5db31c2ebbd3f1.jpg',
                                                    height: 45,
                                                    width: 45,
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                                SizedBox(width: 15),
                                                Expanded(
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        "Tarih Vakfı",
                                                        style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color: Colors.white,
                                                        ),
                                                      ),
                                                      Text(
                                                        "Eğitim ve Kültür",
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
                                                      showDetails36 =
                                                          !showDetails36;
                                                    });
                                                  },
                                                  child: Icon(
                                                    showDetails36
                                                        ? Icons.arrow_drop_up
                                                        : Icons.arrow_drop_down,
                                                    color: Colors.white,
                                                    size: 40,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            if (showDetails36)
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(15.0),
                                                child: Column(
                                                  children: [
                                                    Divider(
                                                      thickness: 0.2,
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              top: 10,
                                                              bottom: 10),
                                                      child: Text(
                                                        "Kurum Hakkında",
                                                        style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color: Colors.white,
                                                        ),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              bottom: 25,
                                                              right: 5,
                                                              left: 5),
                                                      child: Text(textAlign: TextAlign.center,
                                              "Kuruluş Tarihi: 1991 \nGenel Merkez: İstanbul, Türkiye \n\nTarih Vakfı, Türkiye'nin tarihini araştırmak, dokümantasyonunu sağlamak ve tarih bilincini toplumda yaygınlaştırmak amacıyla kurulmuş bir sivil toplum kuruluşudur. Vakıf, tarih eğitimi, araştırmaları ve yayınlarıyla, Türkiye'nin tarihini daha iyi anlamak ve tanıtmak için çeşitli projeler ve etkinlikler düzenler.",
                                                        style: TextStyle(
                                                          color: Colors.white,
                                                        ),
                                                      ),
                                                    ),
                                                    SizedBox(height: 10),
                                                    Center(
                                                      child: ElevatedButton(
                                                        onPressed: launchUrl36,
                                                        child:
                                                            Text("Bağış Yap",style: TextStyle(color: Colors.blue.shade600)),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(12.0),
                                      child: Text(
                                        textAlign: TextAlign.center,
                                        "Sivil Toplum Kuruluşu listeletmek için iletisim@saranel.com.tr adresine talebinizi ileterek listeletme yapabilirsiniz.",
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 11),
                                      ),
                                    )
                                  ])
                                ])
                              ])
                            ])
                          ])
                        ])
                      ])
                    ])
                  ])
                ])
              ])
            ])
          ])
        ])])])])])])])])])])])])])])])])])])])])])])])));
  }
}

TextStyle appbarStyle() =>
    GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.w800);
