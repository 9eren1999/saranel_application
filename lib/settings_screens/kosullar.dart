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
                  "Kullanım Şartları",
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
                  "1. Kabul ve Değişiklikler\nSaranel uygulamasını kullanarak, bu kullanım şartlarını kabul etmiş olursunuz.\n\n2. Hizmetler\nSaranel, kullanıcılarına bağış ve yardım kampanyaları hakkında bilgi sunar. Saranel, bağış işlemleri için aracılık yapmaz, komisyon almaz.\n\n3. Sorumluluklar\nKullanıcılar, bağış işlemleri konusunda dikkatli olmalı ve gerekli durumlarda bağımsız profesyonel bir görüş almalıdır. Saranel, bağış yapılan yerlerle ilgili herhangi bir sorun yaşanması durumunda sorumlu tutulamaz.\n\n4. Fikri Mülkiyet\nUygulama içeriği, Saranel'in fikri mülkiyetidir. İçeriğin izinsiz kullanımı yasaktır.\n\n5. Yasaklanmış Kullanım\nUygulamanın yasadışı, zararlı veya kötü niyetli kullanımı yasaktır.",
                ),
              
              ), Divider(indent: 1,),
              Padding(
                padding: const EdgeInsets.only(top: 15),
                child: Text( "Gizlilik Sözleşmesi",
                    style: TextStyle(
                      color: Colors.blue.shade800,
                      fontSize: 14,
                      fontWeight: FontWeight.w800,
                    ),
                    textAlign: TextAlign.center,
                  ),
              ), Padding(
                padding: const EdgeInsets.all(30),
                child: Text("Bu Gizlilik Sözleşmesi, Saranel uygulamasının kullanıcılarına uygulanır. Bu Sözleşme, Uygulama tarafından toplanan, kullanılan, paylaşılan ve saklanan kişisel verilerin nasıl işlendiğini açıklar.\n\n1. Toplanan Bilgiler\nUygulama, işlevselliğini sağlamak ve kullanıcı deneyimini geliştirmek amacıyla belirli kişisel ve anonim bilgiler toplar. Bu bilgiler şunları içerebilir:\n-Cihaz Bilgileri: Cihaz modeli, işletim sistemi, tarayıcı türü, dil tercihleri vb.\n-Kullanım Bilgileri: Uygulamanın hangi bölümlerinin kullanıldığı, ne kadar süre geçirildiği vb.\n\n2. Bilgilerin Kullanımı\nToplanan bilgiler aşağıdaki amaçlarla kullanılabilir:\n-Uygulamanın işlevselliğini sağlamak ve geliştirmek.\n-Kullanıcı deneyimini kişiselleştirmek.\n-Hataları düzeltmek ve performansı optimize etmek.\n-Yasal yükümlülüklerin yerine getirilmesi.\n\n3. Bilgilerin Paylaşımı\nUygulama, kişisel bilgilerinizi üçüncü taraf şirketlerle paylaşmaz, satmaz veya kiralamaz. Ancak, yasal yükümlülükler veya yasal süreçler gerektirdiğinde bu bilgiler yetkili mercilerle paylaşılabilir.\n\n4. Güvenlik\nUygulama, kişisel bilgilerinizin güvenliğini sağlamak için endüstri standardı güvenlik önlemleri kullanır. Ancak, hiçbir iletim yönteminin veya elektronik depolama yönteminin %100 güvenli olmadığını unutmamanız önemlidir.\n\n5. İletişim\nBu Gizlilik Sözleşmesi hakkında sorularınız, yorumlarınız veya endişeleriniz varsa, lütfen iletisim@saranel.com.tr adresine e-posta gönderin.\n\n\nBu Gizlilik Sözleşmesi'nin son güncellenme tarihi: (23.08.2023)"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
