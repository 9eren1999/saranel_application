import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:saranel_application/main_screens/bireyselYardimBasvuru.dart';
import 'package:saranel_application/company_screens/bireyselyardim.dart';
import 'package:saranel_application/company_screens/resmikurum.dart';
import 'package:saranel_application/company_screens/stk.dart';
import 'package:saranel_application/company_screens/sma_kampanyalari.dart';
import 'package:saranel_application/main_screens/bilgi.dart';
import 'package:saranel_application/main_screens/smaekle.dart';

class AnaSayfa extends StatefulWidget {
  const AnaSayfa({super.key});

  @override
  State<AnaSayfa> createState() => _AnaSayfaState();
}

class _AnaSayfaState extends State<AnaSayfa> {
  /* @override                   Burası pop up ekran kısmı!!!!!!!!!!!!!
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _showImagePopup();
    });
  } 

  Future<void> _showImagePopup() async {
    String url =
        'https://firebasestorage.googleapis.com/v0/b/saranelapp.appspot.com/o/mesajjpopup.jpg?alt=media&token=414d0a12-a419-4567-a7cd-0a7f02863090';
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return Dialog(
          insetPadding: EdgeInsets.all(10), // Ekran boyutuna göre ayarlama
          backgroundColor: Colors.transparent, // Şeffaf arka plan
          elevation: 0, // Çerçevesiz
          child: Stack(
            children: [
              Center(
                child: AspectRatio(
                  aspectRatio: 0.7, // Oranı ayarlarsınız
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0),
                      color: Colors.white, // Çerçeve arka planı
                      image: DecorationImage(
                        image: NetworkImage(url),
                        fit: BoxFit.cover, // Resmi kaplama modu
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 80,
                right: 5,
                child: IconButton(
                  icon: Icon(Icons.close, color: Colors.blue.shade800),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  } */
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        toolbarHeight: 0,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(0),
                bottomRight: Radius.circular(0))),
      ),
      body: ListView(children: [
        ClipPath(
          clipper: MyClipper(),
          child: Container(
            color: Colors.white,
            width: double.infinity,
            child: Padding(
                padding: EdgeInsets.only(
                  top: 40,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "Saranel'e Hoşgeldin!",
                      style: GoogleFonts.poppins(
                          fontSize: 16,
                          fontWeight: FontWeight.w800,
                          color: Colors.blue.shade800),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 30, right: 30, top: 7, bottom: 50),
                      child: Text(
                        " Saranel'de resmi kurumlar tarafından onaylanmış vakıf, dernek ve kampanyalara ulaşabilirsin..",
                        style: GoogleFonts.poppins(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: Colors.blue.shade600,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                )),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 15),
          child: Text("Destek Olabileceğin Kategoriler",
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: Colors.white)),
        ),
        Padding(
          padding:
              const EdgeInsets.only(right: 10, left: 10, top: 3, bottom: 4),
          child: Text(
              "Aşağıdaki kategorilerde ihtiyaç sahiplerinin oluşturduğu talepleri görebilir, bireysel kampanyalara ya da kuruluşlara destek olabilirsin.",
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(
                  fontSize: 11,
                  fontWeight: FontWeight.w400,
                  color: Colors.white)),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 15, right: 15, top: 15),
          child: IntrinsicHeight(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: InkWell(
                    splashColor: Colors.blue.shade800,
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => BireyselYardimPage(),
                          ));
                    },
                    child: Container(
                      width: 185,
                      padding: EdgeInsets.only(
                        top: 15,
                        bottom: 15,
                        left: 5,
                        right: 5,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.blue.shade600,
                        boxShadow: [
                          BoxShadow(
                            color: Color.fromARGB(8, 0, 0, 1),
                            spreadRadius: 1,
                            blurRadius: 1,
                          ),
                        ],
                        borderRadius: BorderRadius.all(Radius.circular(25)),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.volunteer_activism_rounded,
                              size: 30, color: Colors.white),
                          SizedBox(height: 10),
                          Text(
                            'Bireysel Yardım \nTalepleri',
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 20), // İki Container arasında boşluk bırakır
                 Expanded(
                  child: InkWell(
                    splashColor: Colors.blue.shade800,
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SmaKampanyalari(),
                          ));
                    },
                    child: Container(
                      width: 185,
                      padding: EdgeInsets.only(
                        left: 5,
                        right: 5,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.blue.shade600,
                        boxShadow: [
                          BoxShadow(
                            color: Color.fromARGB(8, 0, 0, 1),
                            spreadRadius: 1,
                            blurRadius: 1,
                          ),
                        ],
                        borderRadius: BorderRadius.all(Radius.circular(25)),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.stream_rounded,
                              size: 32, color: Colors.white),
                          SizedBox(height: 10),
                          Text(
                            'SMA \nKampanyaları',
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
       Padding(
  padding: const EdgeInsets.only(left: 15, right: 15, top: 15),
  child: IntrinsicHeight(
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: InkWell(
            splashColor: Colors.blue.shade800,
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => dernekler(),
                  ));
            },
            child: Container(
              width: 185,
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 1),
              decoration: BoxDecoration(
                color: Colors.blue.shade600,
                boxShadow: [
                  BoxShadow(
                    color: Color.fromARGB(8, 0, 0, 1),
                    spreadRadius: 1,
                    blurRadius: 1,
                  ),
                ],
                borderRadius: BorderRadius.all(Radius.circular(25)),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center, 
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center, 
                    children: [
                      Icon(Icons.account_balance_rounded, size: 32, color: Colors.white),
                      SizedBox(width: 10),
                      Text(
                        'Sivil Toplum Kuruluşları',
                        textAlign: TextAlign.center, 
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    ),
  ),
),




        Padding(
          padding: const EdgeInsets.only(
            top: 25,
          ),
          child: Text("Yardıma mı ihtiyacın var?",
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: Colors.white)),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 15, right: 15, top: 15),
          child: IntrinsicHeight(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: InkWell(
                    splashColor: Colors.blue.shade800,
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => bireyselbasvuruekle(),
                          ));
                    },
                    child: Container(
                      width: 185,
                      padding: EdgeInsets.only(
                        top: 15,
                        bottom: 15,
                        left: 2,
                        right: 2,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.blue.shade600,
                        boxShadow: [
                          BoxShadow(
                            color: Color.fromARGB(8, 0, 0, 1),
                            spreadRadius: 1,
                            blurRadius: 1,
                          ),
                        ],
                        borderRadius: BorderRadius.all(Radius.circular(25)),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.add_box_rounded,
                              size: 30, color: Colors.white),
                          SizedBox(height: 10),
                          Text(
                            'Yardım Talebi \nOluştur',
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 10), // İki Container arasında boşluk bırakır
                Expanded(
                  child: InkWell(
                    splashColor: Colors.blue.shade800,
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SMAIlanEkle(),
                          ));
                    },
                    child: Container(
                      width: 185,
                      padding: EdgeInsets.only(
                        left: 5,
                        right: 5,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.blue.shade600,
                        boxShadow: [
                          BoxShadow(
                            color: Color.fromARGB(8, 0, 0, 1),
                            spreadRadius: 1,
                            blurRadius: 1,
                          ),
                        ],
                        borderRadius: BorderRadius.all(Radius.circular(25)),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.add_box_rounded,
                              size: 30, color: Colors.white),
                          SizedBox(height: 10),
                          Text(
                            'SMA İlanı \nEkle',
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
            
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 25),
          child: Text("Diğer Alanlara Göz At",
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: Colors.white)),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 15, right: 15, top: 15),
          child: IntrinsicHeight(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: InkWell(
                    splashColor: Colors.blue.shade800,
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => resmikurumpage(),
                          ));
                    },
                    child: Container(
                      width: 185,
                      padding: EdgeInsets.only(
                        top: 15,
                        bottom: 15,
                        left: 5,
                        right: 5,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.blue.shade600,
                        boxShadow: [
                          BoxShadow(
                            color: Color.fromARGB(8, 0, 0, 1),
                            spreadRadius: 1,
                            blurRadius: 1,
                          ),
                        ],
                        borderRadius: BorderRadius.all(Radius.circular(25)),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.verified_rounded,
                              size: 32, color: Colors.white),
                          SizedBox(height: 10),
                          Text(
                            'Sosyal Destek \nProgramları',
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 20), // İki Container arasında boşluk bırakır
                Expanded(
                  child: InkWell(
                    splashColor: Colors.blue.shade800,
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Ayarlar(),
                          ));
                    },
                    child: Container(
                      width: 185,
                      padding: EdgeInsets.only(
                        left: 5,
                        right: 5,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.blue.shade600,
                        boxShadow: [
                          BoxShadow(
                            color: Color.fromARGB(8, 0, 0, 1),
                            spreadRadius: 1,
                            blurRadius: 1,
                          ),
                        ],
                        borderRadius: BorderRadius.all(Radius.circular(25)),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.info, size: 32, color: Colors.white),
                          SizedBox(height: 10),
                          Text(
                            'Bilgi',
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
          ),
          margin: EdgeInsets.all(15),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.amber.shade700,
              borderRadius: BorderRadius.all(Radius.circular(25)),
            ),
            child: ListTile(
              contentPadding:
                  EdgeInsets.only(right: 12, left: 12, top: 7, bottom: 7),
              title: Text(
                "Saranel, bağış kampanyaları için ödeme aracılığı yapmaz veya herhangi bir komisyon almaz. Bağış işlemleri, ilgili organizasyonlar tarafından doğrudan yürütülür. Platform, yalnızca resmi kurumlar tarafından onaylanmış vakıf, dernek, topluluk ve kampanyalar hakkında bilgi sunar. Bağış yapılan yerlerle ilgili yaşanabilecek sorunlardan Saranel sorumlu değildir.",
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
        )
      ]),
    );
  }
}

class MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height);
    path.quadraticBezierTo(
        size.width / 2, size.height - 35, size.width, size.height);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
