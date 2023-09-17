import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Acikriza extends StatelessWidget {
  const Acikriza({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Açık Rıza Sözleşmesi",
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
                      """İşbu sözleşme, Saranel Platformu ("Platform") kullanıcılarının ("Kullanıcı"), ilan verme aşamasında kabul etmeleri gereken hüküm ve koşulları içermektedir.

1. Bilgi Toplama ve Kullanımı
Platform, Kullanıcıların ilanlarında sağladığı kişisel bilgileri toplayabilir ve saklayabilir. Bu bilgiler şunları içerebilir, ancak bunlarla sınırlı olmamak üzere:

İletişim bilgileri
İban bilgileri
Ad ve soyad
Fotografik görüntüler
Diğer ilgili kişisel detaylar
Kullanıcılar, ilan verirken bu bilgileri Platform ile paylaşmayı kabul eder.

2. Bilgi Paylaşımı
Platform, Kullanıcılar tarafından sağlanan bilgileri, ilanın amacına uygun bir şekilde diğer Platform kullanıcılarına gösterebilir. Bu, ilanın daha geniş bir kitleye ulaşmasına yardımcı olabilir.

3. Sorumluluk Reddi
Platform, Kullanıcılar tarafından paylaşılan bilgilerin doğruluğunu garanti etmez ve bu bilgiler üzerinden gerçekleşebilecek herhangi bir işlem ya da olası zararlar için sorumluluk kabul etmez. Kullanıcılar, Platform aracılığıyla sağladıkları bilgilerin doğru ve güncel olduğunu beyan ve taahhüt ederler.

4. Sorumluluk Limitleri
Platform, herhangi bir zaman, hiçbir neden göstermeksizin bir ilanı kaldırma hakkını saklı tutar. Ayrıca, Platform, Kullanıcıların ilanlarında sağladıkları bilgiler üzerinden oluşabilecek herhangi bir problemde sorumlu tutulamaz.

5. Kabul ve Onay
Kullanıcılar, ilan verme işlemini tamamlamak üzere bu sözleşmeyi kabul ettiklerinde, yukarıda belirtilen şartları ve koşulları kabul etmiş olurlar.

""",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Color.fromARGB(255, 255, 255, 255),
                          fontSize: 12,
                          fontWeight: FontWeight.w100),
                    ),SizedBox(height: 20,)],
                ),
              ),
            ),
          ),
    ])));
  }
}

TextStyle appbarStyle() =>
    GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.w800);
