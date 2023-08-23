import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Sss extends StatelessWidget {
  const Sss({super.key});

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
              Padding(
                padding: const EdgeInsets.all(30.0),
                child: Text(
                  "Saranel uygulaması nedir? \n\n- Saranel, resmi kurumlarca onaylanmış SMA bağışlarını, resmi belgelere sahip vakıf, dernek ve sivil toplum kuruluşlarını ve acil ihtiyaç gerektiren duyuruları listeler. Bağış yapmak isteyen kullanıcılara güvenilir bir adres sunar.\n\n\nUygulama üzerinden bağış yapabilir miyim?\n\n- Hayır, Saranel uygulaması bağışları kendine almaz. İlgili kurumların adreslerini paylaşır, böylece kullanıcılar doğrudan bu kurumlarla iletişime geçebilir.\n\n\nHesap oluşturmam gerekir mi?\n\n- Hayır, Saranel uygulamasında hesap oluşturmanız gerekmez. İlanları doğrudan görüntüleyebilir ya da ilan ekleme talebinde bulunabilirsiniz.\n\n\nİlan eklemek istiyorum, nasıl ekleyebilirim?\n\n-İlan eklemek için uygulama içindeki ilan ekleme bölümünü kullanabilirsiniz. İlgili bilgileri doldurduktan kısa bir süre sonra ilanınız incelenip yayına alınacaktır.Şimdilik sadece SMA kampanyası için ilan ekleyebilirsiniz.\n\n\nUygulamada listelenen kurumlar nasıl seçiliyor?\n\n- Saranel, yalnızca resmi kurumlar tarafından onaylanmış ve güvenilir olduğu kanıtlanmış kurumları listeler.\n\n\nUygulama içindeki bilgilerin doğruluğu nasıl sağlanıyor?\n\nSaranel, listelenen kurumların resmi belgelerini ve bilgilerini dikkatlice inceler ve yalnızca doğrulanmış bilgileri yayınlar.\n\n\nUygulama içindeki bağış linkleri güvenli mi?\n\n- Evet, Saranel yalnızca resmi ve güvenilir bağış linklerini paylaşır.\n\n\nUygulama giderleri nasıl karşılanıyor?\n\n-Uygulama giderleri yanlızca bilgi sekmesinde bulunan saraneli destekle bölümünden sağlanan maddi gelirler ile sağlanmaktadır.\n\n\nVakıf,dernek ya da kuruluşumu listeletmek istiyorum, bunu nasıl yapabilirim?\n\n- Herhangi bir kuruluşu listeletmek için kurum bilgilerini iletisim@saranel.com.tr adresine göndererek listeletme sağlayabilirsiniz.",
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
