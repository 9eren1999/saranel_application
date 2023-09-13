import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


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
      String subtitle, String details, void Function() onTap) {
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
                    child: Image.asset(
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
                          "Kampanya Kapsamı",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            bottom: 0, right: 5, left: 5, top: 5),
                        child: Text(details,
                            style: TextStyle(
                              fontSize: 13,
                              color: Colors.white,
                            ),
                            textAlign: TextAlign.center),
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
              'assets/images/tcbakn.png',
              'Aile Destek Programı',
              'T.C. Aile ve Sosyal Hizmetler Bakanlığı',
              """Aile Destek Programı, ihtiyaç sahibi ailelerin temel ihtiyaçlarının karşılanmasına yardımcı olmak amacıyla 1 Temmuz 2022 tarihinde yürürlüğe giren bir sosyal yardım programıdır.
Program kapsamında, hane içindeki kişi başına düşen geliri, asgari ücretin üçte birinden az olan ailelere (2023 yılı için 3.800,78 TL) , çocukların temel ihtiyaçlarının karşılanması için aylık ödeme yapılmaktadır. Yardım, hak sahibi hanelerin adına açılan banka hesabına yatırılmaktadır.

Programdan faydalanmak için aşağıdaki şartların sağlanması gerekmektedir:

•Hane içindeki kişi başına düşen gelirin, asgari ücretin üçte birinden az olması
•Hanede 18 yaşından küçük en az bir çocuk bulunması
•Hanenin, sosyal güvenlik kuruluşlarından aylık ve gelir almaması\n
Başvuru, e-Devlet Kapısı üzerinden veya doğrudan ikamet edilen il/ilçedeki Sosyal Yardımlaşma ve Dayanışma Vakfına yapılmaktadır.""",
              () => toggleDetail(0),
            ),
            infoCard(
              showDetails[1],
              'assets/images/tcbakn.png',
              'Eşi Vefat Etmiş Kadınlara Yönelik Düzenli Nakit Yardım Programı',
              'T.C. Aile ve Sosyal Hizmetler Bakanlığı',
              """Eşi Vefat Etmiş Kadınlara Yönelik Düzenli Nakit Yardım Programı, eşi vefat etmiş, muhtaç durumda bulunan, kanunla kurulu sosyal güvenlik kuruluşlarına tabi olmayan ve bu kuruluşlardan aylık ve gelir almayan kadınlara yönelik düzenli nakit yardım programıdır.
Program kapsamında, hak sahibi kadınlara iki ayda bir yardım yapılmaktadır. Yardım, hak sahibinin adına açılan banka hesabına yatırılmaktadır.

Programdan faydalanmak için aşağıdaki şartların sağlanması gerekmektedir:

•Eşinin vefat etmiş olması
•Muhtaç durumda bulunması
•Kanunla kurulu sosyal güvenlik kuruluşlarına tabi olmaması
•Bu kuruluşlardan aylık ve gelir almaması\n
Başvuru, ikamet edilen il/ilçedeki Sosyal Yardımlaşma ve Dayanışma Vakfına yapılmaktadır.
""",
              () => toggleDetail(1),
            ),
            infoCard(
              showDetails[2],
              'assets/images/tcbakn.png',
              'Doğum Yardımı ',
              'T.C. Aile ve Sosyal Hizmetler Bakanlığı',
              """Doğum Yardımı programı, doğum yapan annelere maddi destek sağlamak amacıyla 2012 yılında yürürlüğe giren bir sosyal yardım programıdır. Program kapsamında, her çocuk için bir defaya mahsus olmak üzere ödeme yapılmaktadır.

Programdan faydalanmak için aşağıdaki şartların sağlanması gerekmektedir:

•Doğumun Türkiye'de gerçekleşmesi
•Annenin veya babanın, Sosyal Güvenlik Kurumu'ndan aylık ve gelir almaması\n
Başvuru, çocuğun doğumundan itibaren 1 ay içinde ikamet edilen il/ilçedeki Sosyal Yardımlaşma ve Dayanışma Vakfına yapılmaktadır.""",
              () => toggleDetail(2),
            ),
            infoCard(
              showDetails[3],
              'assets/images/tcbakn.png',
              'Öksüz ve Yetim Yardımı ',
              'T.C. Aile ve Sosyal Hizmetler Bakanlığı',
              """Öksüz ve Yetim Yardımı programı, her iki ebeveyni de vefat etmiş veya ölümü resmen kabul edilmiş, muhtaç durumda bulunan çocuklara yönelik düzenli nakit yardım programıdır.Program kapsamında, hak sahibi çocuklara çocuk başına iki ayda bir yardım yapılmaktadır. Yardım, hak sahibinin adına açılan banka hesabına yatırılmaktadır.

Programdan faydalanmak için aşağıdaki şartların sağlanması gerekmektedir:

•Her iki ebeveynin de vefat etmiş veya ölümü resmen kabul edilmiş olması
•Muhtaç durumda bulunması
•Kanunla kurulu sosyal güvenlik kuruluşlarına tabi olmaması
•Bu kuruluşlardan aylık ve gelir almaması\n
Başvuru, ikamet edilen il/ilçedeki Sosyal Yardımlaşma ve Dayanışma Vakfına yapılmaktadır.""",
              () => toggleDetail(3),
            ),
            infoCard(
              showDetails[4],
              'assets/images/tcbakn.png',
              'Asker Ailelerine Yönelik Düzenli Nakit Yardım Programı',
              'T.C. Aile ve Sosyal Hizmetler Bakanlığı',
              """
Muhtaç Asker Ailelerine Yönelik Düzenli Nakit Yardım Programı, askerlik görevini yerine getiren kişinin eşine veya anne-babasına yönelik düzenli nakit yardım programıdır.
Program kapsamında, hak sahibi kişilere aylık 250 TL olmak üzere iki ayda bir 500 TL tutarında yardım yapılmaktadır. Yardım, hak sahibinin adına açılan banka hesabına yatırılmaktadır.

Programdan faydalanmak için aşağıdaki şartların sağlanması gerekmektedir:

•Askere giden kişinin eşinin veya anne-babasının sosyal güvencesi olmaması
•Fakir ve muhtaç durumda olması
•Mütevelli heyeti kararıyla tespit edilmesi

Başvuru, ikamet edilen il/ilçedeki Sosyal Yardımlaşma ve Dayanışma Vakfına yapılmaktadır.""",
              () => toggleDetail(4),
            ),
            infoCard(
              showDetails[6],
              'assets/images/tcbakn.png',
              'Vefat Yardımı',
              'T.C. Aile ve Sosyal Hizmetler Bakanlığı',
              """
Vefat Yardımı, bir kişinin vefatı halinde, yakınlarına maddi destek sağlamak amacıyla yapılan bir yardımdır. Bu yardım, cenaze masraflarının karşılanmasına yardımcı olmak amacıyla yapılmaktadır. Cenaze ödeneği tutarı, 2023 yılı için 2.054 TL'dir.

Cenaze ödeneği, vefat eden kişinin hak sahibi yakınlarına aşağıdaki kişilerden verilir:

•Eşi
•Çocukları
•Annesi ve babası
•Kardeşleri

Cenaze ödeneğinden faydalanmak için, hak sahibi kişilerin ikamet ettikleri il/ilçedeki Sosyal Güvenlik Kurumu (SGK) il müdürlüğüne veya Sosyal Güvenlik Merkezine başvurmaları gerekmektedir.""",
              () => toggleDetail(6),
            ),
            infoCard(
              showDetails[8],
              'assets/images/tcbakn.png',
              'Öğrenci Öğle Yemeği Yardımı',
              'T.C. Aile ve Sosyal Hizmetler Bakanlığı',
              """
T.C. Aile ve Sosyal Hizmetler Bakanlığı Öğle Yemeği Yardımı, taşımalı eğitim uygulaması kapsamında okulların bulunduğu merkezlere taşınan ihtiyaç sahibi hanelerde yaşayan öğrencilere öğle yemeği verilmesini içeren bir sosyal yardım programıdır. Her öğrenciye günlük 1 öğün yemek okul kantininde veya yemekhanede verilmektedir.Yemek hizmeti, Milli Eğitim Bakanlığı ile işbirliği içerisinde yapılmaktadır.

Programdan faydalanmak için aşağıdaki şartların sağlanması gerekmektedir:

•Öğrencinin taşımalı eğitim uygulaması kapsamında okulların bulunduğu merkezlere taşınması
•Hanenin gelir durumunun, asgari ücretin üçte birinden az olması

Başvuru, ikamet edilen il/ilçedeki Sosyal Yardımlaşma ve Dayanışma Vakfına yapılmaktadır.""",
              () => toggleDetail(8),
            ),
            infoCard(
              showDetails[9],
              'assets/images/tcbakn.png',
              'Hane Tadilat, Büyük Onarım ve Yapım Programı',
              'T.C. Aile ve Sosyal Hizmetler Bakanlığı',
              """T.C. Aile ve Sosyal Hizmetler Bakanlığı Hane Tadilat, Büyük Onarım ve Yapım Programı, ihtiyaç sahibi hanelerde bulunan konutların tadilat, büyük onarım ve yapımlarının yapılmasını içeren bir sosyal yardım programıdır. Program kapsamında, hane içinde kişi başına düşen aylık gelirin net asgari ücretin üçte birinden az olması şartı ile aşağıdaki yardımlar verilmektedir:

•Ev tadilat yardımı: Evde yapılan tadilatlar için hane başına 100.000 TL'ye kadar yardım yapılmaktadır.
•Betonarme ev yapımı yardımı: Betonarme ev yapımı için hane başına 500.000 TL'ye kadar yardım yapılmaktadır.
•Prefabrik ev yapımı yardımı: Prefabrik ev yapımı için hane başına 300.000 TL'ye kadar yardım yapılmaktadır. (2023 verileri)

Programdan faydalanmak için aşağıdaki şartların sağlanması gerekmektedir:

•Hane içinde kişi başına düşen aylık gelirin net asgari ücretin üçte birinden az olması
•Konutun oturulamayacak derecede eski, bakımsız ve sağlıksız olması

Başvuru, ikamet edilen il/ilçedeki Sosyal Yardımlaşma ve Dayanışma Vakfına yapılmaktadır. """,
              () => toggleDetail(9),
            ),
            infoCard(
              showDetails[10],
              'assets/images/tcbakn.png',
              'Eşi Vefat Etmiş Kadınlara Yönelik Konut Destek Programı ',
              'T.C. Aile ve Sosyal Hizmetler Bakanlığı',
              """Eşi Vefat Etmiş Kadınlara Yönelik Konut Destek Programı, eşi vefat etmiş ve 18 yaş altında en az üç çocuğu olan ihtiyaç sahibi kadınlara konut desteği sağlanmasını içeren bir sosyal yardım programıdır.

Programdan faydalanmak için aşağıdaki şartların sağlanması gerekmektedir:

•Eşin vefatı
•18 yaş altında en az üç çocuk
•Hane içinde kişi başına düşen aylık gelirin net asgari ücretin üçte birinden az olması
•Mütevelli heyeti kararıyla tespit edilmesi

Başvuru, ikamet edilen il/ilçedeki Sosyal Yardımlaşma ve Dayanışma Vakfına yapılmaktadır.""",
              () => toggleDetail(10),
            ),
            infoCard(
              showDetails[11],
              'assets/images/tcbakn.png',
              'Yakacak Yardımları',
              'T.C. Aile ve Sosyal Hizmetler Bakanlığı',
              """
T.C. Aile ve Sosyal Hizmetler Bakanlığı Yakacak Yardımları, ısınma ihtiyacı olan ihtiyaç sahibi hanelere yakacak desteği sağlanmasını içeren bir sosyal yardım programıdır.

Program kapsamında, hane içinde kişi başına düşen aylık gelirin net asgari ücretin üçte birinden az olması şartı ile aşağıdaki yardımlar verilmektedir:

•Odun yardımı: Haneye, ihtiyaçlarına göre odun veya odun kömürü yardımı yapılmaktadır.
•Katı yakıt yardımı: Haneye, ihtiyaçlarına göre kömür, fuel oil, propan veya LPG yardımı yapılmaktadır.

Programdan faydalanmak için aşağıdaki şartların sağlanması gerekmektedir:

•Hane içinde kişi başına düşen aylık gelirin net asgari ücretin üçte birinden az olması
•Yakacak ihtiyacının olması

Başvuru, ikamet edilen il/ilçedeki Sosyal Yardımlaşma ve Dayanışma Vakfına yapılmaktadır. """,
              () => toggleDetail(11),
            ),
            infoCard(
              showDetails[12],
              'assets/images/tcbakn.png',
              'Doğal Gaz Tüketim Desteği',
              'T.C. Aile ve Sosyal Hizmetler Bakanlığı',
              """T.C. Aile ve Sosyal Hizmetler Bakanlığı Doğalgaz Tüketim Desteği, ısınma ihtiyacı olan ihtiyaç sahibi hanelere doğalgaz desteği sağlanmasını içeren bir sosyal yardım programıdır.

Program kapsamında, hane içinde kişi başına düşen aylık gelirin net asgari ücretin üçte birinden az olması şartı ile aşağıdaki yardımlar verilmektedir:

•Doğalgaz desteği: Haneye, ihtiyaçlarına göre 900-2.500 TL arasında doğalgaz desteği yapılmaktadır.

Programdan faydalanmak için aşağıdaki şartların sağlanması gerekmektedir:

•Hane içinde kişi başına düşen aylık gelirin net asgari ücretin üçte birinden az olması
•Doğalgaz ihtiyacının olması
•İkamet adresinde doğal gaz aboneliği bulunması

Başvuru, ikamet edilen il/ilçedeki Sosyal Yardımlaşma ve Dayanışma Vakfına yapılmaktadır.""",
              () => toggleDetail(12),
            ),
            infoCard(
              showDetails[13],
              'assets/images/tcbakn.png',
              'Elektrik Tüketim Desteği',
              'T.C. Aile ve Sosyal Hizmetler Bakanlığı',
              """T.C. Aile ve Sosyal Hizmetler Bakanlığı Elektrik Tüketim Desteği, elektrik tüketimi için ihtiyaç sahibi hanelere destek sağlanmasını içeren bir sosyal yardım programıdır.Haneye, ihtiyaçlarına göre aylık 75 kWh ile 125 kWh tutarı karşılığı elektrik desteği yapılmaktadır. 

Programdan faydalanmak için aşağıdaki şartların sağlanması gerekmektedir:

•Hane içinde kişi başına düşen aylık gelirin net asgari ücretin üçte birinden az olması
•Elektrik tüketim ihtiyacının olması
•İkamet adresinde elektrik aboneliği bulunması

Başvuru, 3294 ve 2022 sayılı Kanunlar kapsamında düzenli sosyal yardım almaya ilişkin verilmiş hak sahipliği kararı devam eden haneler herhangi bir kuruma başvuru yapılmasına gerek olmadan, Kimlik Belgesi ve elektrik faturası ile PTT şubesine gitmeleri yeterlidir.
• Tıbbi cihaz elektrik sarf desteği bileşeni için hak sahibi ya da fayda sahibinin Sosyal Yardımlaşma ve Dayanışma Vakfına başvurusu gerekmektedir.""",
              () => toggleDetail(13),
            ),
            infoCard(
              showDetails[14],
              'assets/images/tcbakn.png',
              'Yaşlı Aylığı',
              'T.C. Aile ve Sosyal Hizmetler Bakanlığı',
              """Yaşlı aylığı, 65 yaşını doldurmuş, herhangi bir sigorta kurumundan emekliliği bulunmayan, sosyal güvenlik kurumlarından (SSK, Bağ-Kur, Emekli Sandığı) gelir ve aylık hakkından yararlanmayan, nafaka bağlanmamış veya bağlanması mümkün olmayan, mahkeme kararıyla veya doğrudan doğruya kanunla bağlanmış herhangi bir devamlı gelire sahip bulunmayan ve muhtaçlığını Valiliklerce/Kaymakamlıklarca tespit edilen Türk vatandaşlarına her ay ödenmektedir. 2023 yılı itibarıyla, yaşlı aylığı 2.348 TL olarak belirlenmiştir.

Yaşlı Aylığı Başvuru Şartları;

•65 yaşını doldurmuş olmak
•Sosyal güvenlik kurumlarından (SSK, Bağ-Kur, Emekli Sandığı) emekliliği bulunmamak
•Sosyal güvenlik kurumlarından gelir ve aylık hakkından yararlanmamak
•Nafaka bağlanmamış veya bağlanması mümkün olmayan olmak
•Mahkeme kararıyla veya doğrudan doğruya kanunla bağlanmış herhangi bir devamlı gelire sahip bulunmamak
•Muhtaçlığını Valiliklerce/Kaymakamlıklarca tespit edilmiş olmak

Yaşlı aylığı için başvurular, ikamet edilen il/ilçedeki Sosyal Yardımlaşma ve Dayanışma Vakfına yapılmaktadır. """,
              () => toggleDetail(14),
            ),
            infoCard(
              showDetails[15],
              'assets/images/tcbakn.png',
              'Engelli Aylığı ',
              'T.C. Aile ve Sosyal Hizmetler Bakanlığı',
              """T.C. Aile ve Sosyal Hizmetler Bakanlığı tarafından, engelli bireylerin ekonomik ve sosyal destek ihtiyaçlarının karşılanması amacıyla 2022 sayılı Kanun kapsamında engelli ve engelli yakını aylığı verilmektedir. Engelli aylığı, 18 yaşından büyük ve sosyal güvenlik kurumlarından (SSK, Bağ-Kur, Emekli Sandığı) hiçbirine tabi olmayan, muhtaçlığı ilgili Sosyal Yardımlaşma ve Dayanışma Vakfı tarafından belgelenen, %40 ve üzeri engelli oranına sahip bireylere verilen bir aylıktır.
              
2023 yılı itibarıyla, engelli aylığı %40-69 oranında engelli olanlar için 1.874 TL, %70 ve üzeri engelli olanlar için 2.811 TL olarak belirlenmiştir. 
              
Engelli aylığı için başvurular, ikamet edilen il/ilçedeki Sosyal Yardımlaşma ve Dayanışma Vakfına yapılmaktadır.""",
              () => toggleDetail(15),
            ),
            infoCard(
              showDetails[16],
              'assets/images/tcbakn.png',
              'Engelli Yakını Aylığı',
              'T.C. Aile ve Sosyal Hizmetler Bakanlığı',
              """Engelli yakını aylığı, 18 yaşından büyük ve sosyal güvenlik kurumlarından (SSK, Bağ-Kur, Emekli Sandığı) hiçbirine tabi olmayan, muhtaçlığı ilgili Sosyal Yardımlaşma ve Dayanışma Vakfı tarafından belgelenen, %70 ve üzeri engelli oranına sahip bireylerin bakımını üstlenen kişilere verilen aylık çeşididir.Engelli yakını aylığı 2023 yılı itibariyle 1.874 TL olarak belirlenmiştir.
              
Engelli Yakını Aylığı Başvuru Şartları:

•18 yaşından büyük olmak
•Sosyal güvenlik kurumlarından (SSK, Bağ-Kur, Emekli Sandığı) hiçbirine tabi olmamak
•Muhtaçlık durumu bulunmak
•%70 ve üzeri engelli oranına sahip bir bireyin bakımını üstlenmek 

Engelli yakını aylığı için başvurular, ikamet edilen il/ilçedeki Sosyal Yardımlaşma ve Dayanışma Vakfına yapılmaktadır.""",
              () => toggleDetail(16),
            ),
            infoCard(
              showDetails[20],
              'assets/images/tcbakn.png',
              'Engelli Öğrencilerin Ücretsiz Taşınması',
              'T.C. Aile ve Sosyal Hizmetler Bakanlığı',
              """T.C. Aile ve Sosyal Hizmetler Bakanlığı tarafından, engelli bireylerin eğitime erişimini kolaylaştırmak amacıyla engelli öğrencilerin ücretsiz taşınması desteği verilmektedir.

Engelli öğrenci ücretsiz taşınması desteği, örgün eğitime kayıtlı olup, %40 ve üzeri engelli raporuna sahip olan öğrencilerin, okula gidiş-dönüş ulaşımlarını ücretsiz olarak sağlamaktadır.

Engelli Öğrenci Ücretsiz Taşınması Desteği Başvuru Şartları

•Örgün eğitime kayıtlı olmak
•%40 ve üzeri engelli raporuna sahip olmak

Engelli öğrenci ücretsiz taşınması desteği için başvurular, ikamet edilen il/ilçedeki Sosyal Yardımlaşma ve Dayanışma Vakfına yapılmaktadır.""",
              () => toggleDetail(20),),
          ],
        ),
      ),
    );
  }
}
