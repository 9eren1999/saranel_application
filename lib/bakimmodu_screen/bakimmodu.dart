import 'package:flutter/material.dart';
import 'dart:io';

class BakimModuPage extends StatelessWidget {
  final String mesaj = """Değerli Saranel Kullanıcıları,

Şu anda platformumuz planlanan bakım çalışmaları nedeniyle geçici bir süre için hizmet dışıdır. Bu süre zarfında size daha iyi bir hizmet sunabilmek için sistemlerimizi güncelliyor ve geliştiriyoruz.

Siz değerli üyelerimizin sabrı ve anlayışı için teşekkür ederiz. En kısa sürede, yeni ve daha güçlü özelliklerle yanınızda olacağımızı belirtmek isteriz. 

Görüşmek üzere,

Saranel Ekibi""";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade800,
      body: Center(
        child: Stack(
          children: [
            Positioned(
              top: MediaQuery.of(context).size.height * 0.15,
              left: 20,
              right: 20,
              child: Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize
                      .min, 
                  children: [
                    Image.asset('assets/images/saranellogonew.png',
                        height:
                            100), 
                    SizedBox(height: 20), 
                    Text(
                      mesaj,
                      style: TextStyle(fontSize: 12, color: Colors.black),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: MediaQuery.of(context).size.height * 0.05,
              left: MediaQuery.of(context).size.width * 0.5 -
                  50, 
              child: ElevatedButton(
                onPressed: () {
                  exit(0);
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.white),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                  ),
                ),
                child: Text(
                  "Kapat",
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
