import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DonationPage extends StatefulWidget {
  @override
  State<DonationPage> createState() => _DonationPageState();
}

class _DonationPageState extends State<DonationPage> {
  bool isButtonActive = false;
  String? selectedAmount;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.blue.shade800,
        appBar: AppBar(
          title: Text(
            "Saranel'i Destekle",
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
            ),
          ),
          backgroundColor: Colors.white,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 30),
                child: Container(
                  width: 320,
                  height: 40,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(
                        15.0), // Daha az oval olması için burayı düzenledik
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(
                        15.0), // Daha az oval olması için burayı düzenledik
                    child: Material(
                      color: Colors.transparent,
                      child: TabBar(
                        indicator: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                              14), // Daha az oval olması için burayı düzenledik
                          color: Colors.blue.shade800,
                        ),
                        labelColor: Colors.white,
                        unselectedLabelColor: Color.fromARGB(255, 88, 86, 86),
                        labelStyle: TextStyle(fontWeight: FontWeight.bold),
                        unselectedLabelStyle:
                            TextStyle(fontWeight: FontWeight.bold),
                        tabs: [
                          Container(
                            width: 160, // Tabların genişliğini ayarladık
                            child: Center(
                              child: Text(
                                'Tek Seferlik Bağış',
                                style: TextStyle(fontSize: 12),
                              ),
                            ),
                          ),
                          Container(
                            width: 160, // Tabların genişliğini ayarladık
                            child: Center(
                              child: Text(
                                'Aylık Düzenli Bağış',
                                style: TextStyle(fontSize: 12),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 80,
              ),
              Container(
                height: MediaQuery.of(context).size.height,
                child: Container(
                  height: 500,
                  child: TabBarView(
                    children: [
                      ilkSayfa(),
                      ikinciSayfa(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget ilkSayfa() {
    return Padding(
      padding: const EdgeInsets.only(right: 20, left: 20, top: 30, bottom: 20),
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "Aylık bağış miktarını seçin",
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              expandedButton("20 TL"),
              expandedButton("50 TL"),
              expandedButton("100 TL"),
              expandedButton("200 TL"),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.person),
                    hintText: "Ad*",
                    fillColor: Colors.white,
                    filled: true,
                  ),
                ),
              ),
              SizedBox(width: 10),
              Expanded(
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: "Soyad*",
                    fillColor: Colors.white,
                    filled: true,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 10),
          TextFormField(
            decoration: InputDecoration(
              hintText: "E-posta adresi",
              fillColor: Colors.white,
              filled: true,
            ),
          ),
          SizedBox(height: 20),
          Container(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                // Devam işlemini burada yönet
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue.shade800,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              child: Text('Devam ->', style: TextStyle(color: Colors.white)),
            ),
          ),
        ],
      ),
    );
  }

  Widget expandedButton(String text) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: OutlinedButton(
          onPressed: () {
            // Buton işlemleri
          },
          style: OutlinedButton.styleFrom(
            backgroundColor: Colors.white, // Tıklanmadığında beyaz
            side: BorderSide(color: Colors.blue.shade800, width: 2),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0), // Hafif oval
            ),
          ),
          child: Text(
            text,
            style: TextStyle(color: Colors.black), // Siyah metin
          ),
        ),
      ),
    );
  }

  Widget ikinciSayfa() {
    return Padding(
      padding: const EdgeInsets.only(right: 20, left: 20, top: 20, bottom: 20),
      child: Column(
        children: [
          Text(
            "Düzenli bağış yapmak istediğin tutarı seçiniz.\n",
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          SizedBox(
            height: 130,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15.0),
                border: Border.all(color: Colors.transparent),
              ),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: GridView(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 3.5,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 15,
                  ),
                  children: [
                    donationButton('19,90 TL/Ay'),
                    donationButton('49,90 TL/Ay'),
                    donationButton('99,90 TL/Ay'),
                    donationButton('199,90 TL/Ay'),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(height: 10),
          if (isButtonActive)
            Center(
              child: Container(
                width: double.infinity,
                margin: EdgeInsets.only(right: 100, left: 100),
                child: ElevatedButton(
                  onPressed: () {
                    // Bağış işlemini burada yönet
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  child: Text(
                    'Saranel Bağış Abonesi Ol',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget donationButton(String amount) {
    bool isSelected = selectedAmount == amount;
    return AnimatedContainer(
      duration: Duration(milliseconds: 300),
      decoration: BoxDecoration(
        border: Border.all(
          color: isSelected ? Colors.blue.shade800 : Colors.blue.shade900,
          width: isSelected ? 2.0 : 1.0,
        ),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: OutlinedButton(
        onPressed: () {
          setState(() {
            if (isSelected) {
              selectedAmount = null;
              isButtonActive = false;
            } else {
              selectedAmount = amount;
              isButtonActive = true;
            }
          });
        },
        style: OutlinedButton.styleFrom(
          side: BorderSide(color: const Color.fromARGB(0, 241, 26, 26)),
          backgroundColor: Colors.transparent,
          padding: EdgeInsets.all(2.0), // Padding'i biraz azalttım
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              amount,
              style: TextStyle(
                color: isSelected ? Colors.blue.shade900 : Colors.blue.shade800,
                fontSize: 14, // Font boyutunu biraz küçülttüm
              ),
            ),
            Divider(
              color: Colors.blue.shade800,
              thickness: 1,
            ),
            Expanded(
              child: Container(
                color: isSelected
                    ? Colors.blue.shade800.withOpacity(0.5)
                    : Colors.transparent,
                child: Center(
                  child: isSelected
                      ? Icon(
                          Icons.check,
                          color: Colors.blue.shade800,
                          size: 18,
                        ) // İkon boyutunu biraz küçülttüm
                      : Text('Seç',
                          style: TextStyle(
                              color: Colors.blue.shade800,
                              fontSize: 14)), // Font boyutunu biraz küçülttüm
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
