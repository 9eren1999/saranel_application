import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Sss extends StatelessWidget {
  const Sss({super.key});

  Widget buildQuestionTile(String soru, String cevap) {
    return ExpansionTile(
      tilePadding: EdgeInsets.all(0),
      title: Container(
        padding: const EdgeInsets.all(9.0),
        child: Text(
          soru,
          style: TextStyle(color: Colors.blue.shade800),
        ),
      ),
      trailing: Icon(
        Icons.arrow_drop_down,
        color: Colors.blue.shade800,
      ),
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(cevap),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Sıkça Sorulan Sorular",
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
      body: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Card(
          elevation: 1,
          color: Color.fromARGB(255, 255, 255, 251),
          shadowColor: Color.fromARGB(55, 0, 0, 0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: ListView(
            padding: EdgeInsets.all(10),
            children: [
              Center(
                child: Text(
                  "Sıkça Sorulan Sorular",
                  style: TextStyle(
                    color: Colors.blue.shade800,
                    fontSize: 14,
                    fontWeight: FontWeight.w800,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              buildQuestionTile(
                "Saranel uygulaması nedir?",
                "Saranel, resmi kurumlarca onaylanmış SMA bağışlarını, resmi belgelere sahip vakıf, dernek ve sivil toplum kuruluşlarını ve acil ihtiyaç gerektiren duyuruları listeler. Bağış yapmak isteyen kullanıcılara güvenilir bir adres sunar.",
              ),
              buildQuestionTile(
                "Uygulama üzerinden bağış yapabilir miyim?",
                "ayır, Saranel uygulaması bağışları kendine almaz. İlgili kurumların adreslerini paylaşır, böylece kullanıcılar doğrudan bu kurumlarla iletişime geçebilir.",
              ),
              buildQuestionTile(
                "Hesap oluşturmam gerekir mi?",
                "Hayır, Saranel uygulamasında hesap oluşturmanız gerekmez. İlanları doğrudan görüntüleyebilir ya da ilan ekleme talebinde bulunabilirsiniz.",
              ),
              buildQuestionTile(
                "İlan eklemek istiyorum, nasıl ekleyebilirim?",
                "İlan eklemek için uygulama içindeki ilan ekleme bölümünü kullanabilirsiniz. İlgili bilgileri doldurduktan kısa bir süre sonra ilanınız incelenip yayına alınacaktır.Şimdilik sadece SMA kampanyası için ilan ekleyebilirsiniz.",
              ),
              buildQuestionTile(
                "Uygulamada listelenen kurumlar nasıl seçiliyor?",
                "Saranel, yalnızca resmi kurumlar tarafından onaylanmış ve güvenilir olduğu kanıtlanmış kurumları listeler.",
              ),
              buildQuestionTile(
                "Uygulama içindeki bilgilerin doğruluğu nasıl sağlanıyor?",
                "Saranel, listelenen kurumların resmi belgelerini ve bilgilerini dikkatlice inceler ve yalnızca doğrulanmış bilgileri yayınlar.",
              ),
              buildQuestionTile(
                "Uygulama içindeki bağış linkleri güvenli mi?",
                "Evet, Saranel yalnızca resmi ve güvenilir bağış linklerini paylaşır.",
              ),
              buildQuestionTile(
                "Uygulama giderleri nasıl karşılanıyor?",
                "Uygulama giderleri yalnızca bilgi sekmesinde bulunan saraneli destekle bölümünden sağlanan maddi gelirler ile sağlanmaktadır.",
              ),
              buildQuestionTile(
                "Vakıf,dernek ya da kuruluşumu listeletmek istiyorum, bunu nasıl yapabilirim?",
                "Herhangi bir kuruluşu listeletmek için kurum bilgilerini iletisim@saranel.com.tr adresine göndererek listeletme sağlayabilirsiniz",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
