import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Gizlilik extends StatelessWidget {
  const Gizlilik({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Gizlilik Sözleşmesi",
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
                      "Gizlilik Sözleşmesi",
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
                      """Bu Gizlilik Sözleşmesi, Saranel uygulamasının kullanıcılarına uygulanır ve kullanıcıların kişisel verilerinin nasıl toplandığı, kullanıldığı, paylaşıldığı ve saklandığı konusunda bilgi verir.

1. Toplanan Bilgiler
Saranel uygulaması, işlevselliği artırmak ve kullanıcı deneyimini geliştirmek amacıyla aşağıda belirtilen bilgileri toplar:

Cihaz Bilgileri: Cihaz modeli, işletim sistemi, tarayıcı türü, dil tercihleri vb.

Kullanım Bilgileri: Kullanıcıların uygulamada hangi bölümleri kullandığı, ne kadar süre geçirdiği vb.

Kişisel Bilgiler: Kullanıcıların adı, soyadı, iletişim bilgileri, IBAN numaraları, yüklediği resimler vb. (Sadece ilan verenler için geçerlidir.)

2. Bilgilerin Kullanımı
Toplanan bilgiler aşağıdaki amaçlar için kullanılabilir:

Uygulamanın işlevselliğini sağlamak ve geliştirmek.
Kullanıcı deneyimini kişiselleştirmek ve kullanıcılara özelleştirilmiş içerik ve hizmetler sunmak.
Teknik hataları düzeltmek ve performansı optimize etmek.
Yasal yükümlülüklerin yerine getirilmesi ve yasal süreçlere uymak.

3. Bilgilerin Paylaşımı
Saranel uygulaması, kişisel bilgilerinizi üçüncü taraf şirketlerle paylaşmaz, satmaz veya kiralamaz. Ancak, yasal yükümlülükler veya yasal süreçler gerektirdiğinde bu bilgiler yetkili mercilerle paylaşılabilir. Ayrıca, kullanıcıların açık rızası alındığında ilanlarda belirtilen bilgiler diğer kullanıcılara gösterilebilir.

4. Güvenlik
Uygulama, kullanıcıların kişisel bilgilerini korumak için endüstri standardı güvenlik önlemleri kullanır. Ancak, hiçbir iletim yönteminin veya elektronik depolama yönteminin %100 güvenli olmadığını unutmamanız önemlidir. Kullanıcılar, bilgilerini paylaşırken bu riski kabul eder.

5. İletişim
Bu Gizlilik Sözleşmesi hakkında sorularınız, yorumlarınız veya endişeleriniz varsa, lütfen iletisim@saranel.com.tr adresine e-posta gönderin.

6. Değişiklikler
Saranel, bu gizlilik politikasını zaman zaman güncelleme hakkını saklı tutar. Güncellemeler bu sayfada yayınlanacak ve yürürlüğe girecektir.

Son Güncellenme Tarihi: 23.08.2023""",
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
