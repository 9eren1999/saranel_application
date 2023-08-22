import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Kosullar extends StatelessWidget {
  const Kosullar({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Kullanım Şartları",
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
