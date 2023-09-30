import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PlatformKurallari extends StatelessWidget {
 PlatformKurallari({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Platform Kuralları",
            style:
                GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.w800),
          ),
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
        body: Container(
            child: ListView(children: [
          Padding(
            padding:
                const EdgeInsets.only(top: 20, left: 12, right: 12, bottom: 20),
            child: Card(
              color: Colors.blue.shade600,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(15))),
              child: Padding(
                padding: EdgeInsets.only(top: 20, left: 30, right: 30),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Saranel Paylaşım Kuralları",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Color.fromARGB(255, 248, 248, 248),
                          fontSize: 14,
                          fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Text(
                      """Saygılı İletişim: Forumda paylaşılan tüm gönderilerde saygılı bir dil kullanılmalıdır. Küfür, hakaret veya aşağılayıcı ifadeler kesinlikle yasaktır.

İzinsiz Yardım Toplama: İzinsiz yardım toplama veya bağış kampanyaları oluşturma yasaktır. Bu tür talepler için platform yönetimi ile iletişime geçilmelidir.

Müstehcen İçerik: Herhangi bir müstehcen, cinsel içerikli veya uygunsuz görsel ve yazılı içerik paylaşmak yasaktır.

Reklam ve Tanıtım: Ticari amaçlı reklam, tanıtım veya satış yapma amacıyla gönderi paylaşmak yasaktır.

Kişisel Bilgiler: Başkalarının kişisel bilgilerini izinsiz paylaşmak veya dağıtmak kesinlikle yasaktır.

Tartışma ve Kavga: Kişisel anlaşmazlıklar veya tartışmalar forumda yer bulmamalıdır.

Yanıltıcı Bilgiler: Yanıltıcı veya yanlış bilgiler içeren gönderiler paylaşmak yasaktır.

Çift Gönderi: Aynı içeriği birden fazla kez paylaşmak yasaktır.

Telif Hakkı: Başkalarına ait telif hakkı korunan içerikleri izinsiz paylaşmak yasaktır.

Saranel platformunun genel kullanım kuralları ve şartları da forumda geçerlidir.
""",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Color.fromARGB(255, 255, 255, 255),
                          fontSize: 12,
                          fontWeight: FontWeight.w100),
                    ),
                    SizedBox(
                      height: 20,
                    )
                  ],
                ),
              ),
            ),
          ),
        ])));
  }
}

TextStyle appbarStyle() =>
    GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.w800);
