import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Sss extends StatefulWidget {
  const Sss({super.key});

  @override
  State<Sss> createState() => _SssState();
}

class _SssState extends State<Sss> {
  Future<void>? _loadData;

  @override
  void initState() {
    super.initState();
    _loadData = _loadDataAsync();
  }

  Future<void> _loadDataAsync() async {
    await Future.delayed(Duration(milliseconds: 150));
  }

  List<bool> isExpandedList = [
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false
  ];

  Widget buildQuestionTile(String soru, String cevap, int index) {
    return Theme(
      data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
      child: ExpansionTile(
        maintainState: true,
        tilePadding: EdgeInsets.all(0),
        title: Container(
          padding: const EdgeInsets.all(9.0),
          child: Text(
            soru,
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 13),
          ),
        ),
        trailing: Icon(
          isExpandedList[index] ? Icons.arrow_drop_up : Icons.arrow_drop_down,
          color: Colors.white,
        ),
        onExpansionChanged: (expanded) {
          setState(() {
            isExpandedList[index] = expanded;
          });
        },
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              cevap,
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _loadData,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Scaffold(
              body: Center(
                child: CircularProgressIndicator(color: Colors.blue.shade800),
              ),
            );
          } else {
            return Scaffold(
              appBar: AppBar(
                title: Text(
                  "Sıkça Sorulan Sorular",
                  style: GoogleFonts.poppins(
                      fontSize: 18, fontWeight: FontWeight.w800),
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
                  color: Colors.blue.shade600,
                  shadowColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: ListView(
                    padding: EdgeInsets.all(10),
                    children: [
                      buildQuestionTile(
                          "Saranel uygulaması nedir?",
                          "Saranel, resmi kurumlarca onaylanmış SMA bağışlarını, resmi belgelere sahip vakıf, dernek ve sivil toplum kuruluşlarını ve acil ihtiyaç gerektiren duyuruları listeler. Bağış yapmak isteyen kullanıcılara güvenilir bir adres sunar.",
                          0),
                      buildQuestionTile(
                          "Uygulama üzerinden bağış yapabilir miyim?",
                          "Hayır, Saranel uygulaması bağışları kendine almaz. İlgili kurumların adreslerini paylaşır, böylece kullanıcılar doğrudan bu kurumlarla iletişime geçebilir.",
                          1),
                      buildQuestionTile(
                          "Hesap oluşturmam gerekir mi?",
                          "Hayır, Saranel uygulamasında hesap oluşturmanız gerekmez. İlanları doğrudan görüntüleyebilir ya da ilan ekleme talebinde bulunabilirsiniz.",
                          2),
                      buildQuestionTile(
                          "İlan eklemek istiyorum, nasıl ekleyebilirim?",
                          "İlan eklemek için uygulama içindeki ilan ekleme bölümünü kullanabilirsiniz. İlgili bilgileri doldurduktan kısa bir süre sonra ilanınız incelenip yayına alınacaktır.",
                          3),
                      buildQuestionTile(
                          "Uygulamada listelenen kurumlar nasıl seçiliyor?",
                          "Saranel, yalnızca resmi kurumlar tarafından onaylanmış ve güvenilir olduğu kanıtlanmış kurumları listeler.",
                          4),
                      buildQuestionTile(
                          "Uygulama içindeki bilgilerin doğruluğu nasıl sağlanıyor?",
                          "Saranel, listelenen kurumların resmi belgelerini ve bilgilerini dikkatlice inceler ve yalnızca doğrulanmış bilgileri yayınlar.",
                          5),
                      buildQuestionTile(
                          "Uygulama içindeki bağış linkleri güvenli mi?",
                          "Evet, Saranel yalnızca resmi ve güvenilir bağış linklerini paylaşır.",
                          6),
                      buildQuestionTile(
                          "Uygulama giderleri nasıl karşılanıyor?",
                          "Uygulama giderleri yalnızca bilgi sekmesinde bulunan saraneli destekle bölümünden sağlanan maddi gelirler ile sağlanmaktadır.",
                          7),
                      buildQuestionTile(
                          "Vakıf,dernek ya da kuruluşumu listeletmek istiyorum, bunu nasıl yapabilirim?",
                          "Herhangi bir kuruluşu listeletmek için kurum bilgilerini iletisim@saranel.com.tr adresine göndererek listeletme sağlayabilirsiniz",
                          8),
                          
                    ],
                  ),
                ),
              ),
            );
          }
        });
  }
}
