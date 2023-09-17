import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Kosullar extends StatelessWidget {
  const Kosullar({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Kullanım Koşulları",
          style: GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.w800),
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
                      "Kullanım Şartları Sözleşmesi",
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
                      """İşbu "Kullanım Şartları Sözleşmesi" ("Sözleşme"), Saranel Platformu ("Platform") üzerindeki tüm kullanıcıların ("Kullanıcı" veya "Siz"), Platformu kullanırken uymaları gereken hüküm ve koşulları içermektedir. Platformu kullanarak, işbu Sözleşmenin şartlarını kabul etmiş sayılmaktasınız.

1. Genel Kullanım Koşulları
Platform kullanıcıları, Platform üzerinde yürütülen tüm işlemler ve etkinlikler için işbu sözleşmedeki şartlara uymakla yükümlüdürler. Platform, hizmet şartlarını herhangi bir zaman değiştirme hakkını saklı tutar.

2. Bilgi Toplama ve Kullanımı
Platform, ilan verme aşamasında kullanıcılar tarafından sağlanan bilgileri toplayabilir ve işleyebilir. Bu bilgiler şunları içerebilir:

İletişim bilgileri
İban bilgileri
Ad ve soyad
Fotografik görüntüler
Diğer ilgili kişisel detaylar

Kullanıcılar, bu bilgileri Platform ile paylaşmayı kabul ederler.

3. Bilgi Paylaşımı ve İşlenmesi
Platform, kullanıcıların paylaştığı bilgileri, Platformda ilanın doğru bir şekilde görüntülenmesini sağlamak veya kullanıcı deneyimini geliştirmek amacıyla işleyebilir ve diğer kullanıcılara gösterebilir. Platform, üçüncü şahıslarla herhangi bir kişisel bilgi paylaşımı yapmaz, ancak ilanın amacına uygun olarak diğer kullanıcılara gösterilebilir.

4. İçeriklerin Doğruluğu ve Sorumluluk Reddi
Kullanıcılar, Platforma yükledikleri içeriklerin doğru ve güncel olduğunu beyan ederler. Platform, kullanıcılar tarafından sağlanan içeriklerin doğruluğunu garanti etmez ve bu bilgiler üzerinden gerçekleşebilecek herhangi bir işlem ya da olası zararlar için sorumluluk kabul etmez.

5. Telif Hakları ve İçerik Kullanımı
Kullanıcılar, Platforma yükledikleri içeriklerin telif haklarını ihlal etmediğini beyan ederler. Kullanıcılar aynı zamanda, yükledikleri içeriklerin Platform tarafından sergilenebilmesi için gerekli lisansları Platforma vermiş olurlar.

6. Sorumluluk Limitleri
Platform, herhangi bir zaman, hiçbir neden göstermeksizin bir ilanı kaldırma veya düzenleme hakkını saklı tutar. Platform, kullanıcıların ilanlarında sağladıkları bilgiler veya kullanıcıların diğer kullanıcılarla olan etkileşimleri üzerinden oluşabilecek herhangi bir problemde sorumlu tutulamaz.

7. Gizlilik Politikası
Kullanıcılar, Platformun gizlilik politikasını kabul ederler. Gizlilik politikası, Platformun kullanıcı bilgilerini nasıl topladığı, kullandığı ve paylaştığı hakkında detaylı bilgi içerir.

8. Kabul ve Onay
Platforma ilan verirken veya Platformu kullanırken, kullanıcılar yukarıda belirtilen şartları ve koşulları kabul etmiş sayılırlar.""",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Color.fromARGB(255, 255, 255, 255),
                          fontSize: 12,
                          fontWeight: FontWeight.w100),
                    ),
                    SizedBox(
                      height: 20,

                )],
                ),
              ),
            ),
          ),
    ])));
  }
}

TextStyle appbarStyle() =>
    GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.w800);
