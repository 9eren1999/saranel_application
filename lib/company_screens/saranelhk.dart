import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SaranelPage extends StatefulWidget {
  const SaranelPage({super.key});

  @override
  State<SaranelPage> createState() => _SaranelPageState();
}

class _SaranelPageState extends State<SaranelPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
          title: Text("Saranel Hakkında", style: appbarStyle()),
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.arrow_back_ios_sharp,
                color: Colors.blue.shade800,
                size: 19,
              )),
              
        ), body: Container(
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
                      "Saranel Platformu Hakkında",
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
                      "Saranel Platformu, yardımın en saf ve en etkin halini yaşatmayı hedefleyen bir dijital köprüdür. Bu inovatif girişim, çağımızın getirdiği yenilikleri kullanarak iyiliği ve yardımlaşmayı teşvik etmek amacıyla hayata geçirilmiştir. İnsanların güvenli bir şekilde bağış yapabileceği, yardıma muhtaç bireylerle yardımseverleri buluşturmayı hedefleyen platform, toplumda pozitif bir etki yaratmayı amaçlar.",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Color.fromARGB(255, 255, 255, 255),
                          fontSize: 12,
                          fontWeight: FontWeight.w100),
                    ),
                    SizedBox(
                      height: 20,
                    ),Text(
                      "Neden Saranel?",
                      textAlign: TextAlign.start,
                      style: TextStyle(
                          color: Color.fromARGB(255, 248, 248, 248),
                          fontSize: 14,
                          fontWeight: FontWeight.w600),
                    ),SizedBox(
                      height: 8,
                    ),
                    Text(
                      "Modern dünya, teknolojik olanaklar sayesinde birçok alanda olduğu gibi yardımlaşma ve dayanışma alanında da yeni kapılar açıyor. Saranel, bu kapıların en önemlilerinden biri olmayı hedefliyor. Bir yanda yardıma muhtaç bireyler, diğer yanda yardım etme aşkıyla yanıp tutuşan yardımseverler... Saranel, bu iki grubu bir araya getirerek güvenli, şeffaf ve etkili bir yardımlaşma ortamı sunar.",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Color.fromARGB(255, 255, 255, 255),
                          fontSize: 12,
                          fontWeight: FontWeight.w100),
                    ),
                    SizedBox(
                      height: 20,
                    ),Text(
                      "Kimler Yaptı?",
                      textAlign: TextAlign.start,
                      style: TextStyle(
                          color: Color.fromARGB(255, 248, 248, 248),
                          fontSize: 14,
                          fontWeight: FontWeight.w600),
                    ),SizedBox(
                      height: 8,
                    ),
                    Text(
                      "Bu proje, iki üniversite öğrencisinin vizyoner bakış açıları ve teknolojiye olan hakimiyetleri sayesinde hayata geçmiştir. Öğrenciler, akademik bilgilerini ve genç dinamizmlerini kullanarak, toplumda olumlu bir değişim yaratma hedefiyle yola çıkmışlardır. Saranel, onların bu çabasının bir ürünü olarak karşımıza çıkar.",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Color.fromARGB(255, 255, 255, 255),
                          fontSize: 12,
                          fontWeight: FontWeight.w100),
                    ),
                    SizedBox(
                      height: 20,
                    ),Text(
                      "Amacımız",
                      textAlign: TextAlign.start,
                      style: TextStyle(
                          color: Color.fromARGB(255, 248, 248, 248),
                          fontSize: 14,
                          fontWeight: FontWeight.w600),
                    ),SizedBox(
                      height: 8,
                    ),
                    Text(
                      "Saranel Platformu, yardıma ihtiyaç duyanlar ile yardımcı olmak isteyenleri bir araya getirerek, daha adil ve dayanışmacı bir toplum inşa etmeyi amaçlar. Bu platform, iyilik yapmanın ve almanın güvende olduğu bir ortam sunmayı taahhüt eder, böylece yardımlaşma kültürü daha geniş kitlelere ulaşabilir.Saranel, bir yardımlaşma ve dayanışma hareketini tetikleyerek, toplumda iyiliğin ve empatinin yaygınlaşmasına öncülük etmeyi hedefler. Bu vizyon doğrultusunda, platformumuz, güvenli ve şeffaf bir bağış ortamı oluşturarak, yardımların doğru yerlere ulaşmasını sağlar.",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Color.fromARGB(255, 255, 255, 255),
                          fontSize: 12,
                          fontWeight: FontWeight.w100),
                    ),SizedBox(height: 25,)
                  
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