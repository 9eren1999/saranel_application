import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DonationPage extends StatefulWidget {
  @override
  State<DonationPage> createState() => _DonationPageState();
}

class _DonationPageState extends State<DonationPage> {
  bool isButtonActive = false;
  String? selectedAmount;
  List<int> amounts = [20, 50, 100, 200, 500, 1000];
  Map<int, String> amountLinks = {
    20: "playstore_link_for_20TL",
    50: "playstore_link_for_50TL",
    100: "playstore_link_for_100TL",
    200: "playstore_link_for_200TL",
    500: "playstore_link_for_500TL",
    1000: "playstore_link_for_1000TL",
  };

  void onAmountSelected(int amount) {
    setState(() {
      selectedAmount = amount.toString();
      isButtonActive = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade800,
      appBar: AppBar(
        title: Text(
          "Saranel'i Destekle",
          style: appbarStyle(),
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
      body: Container(
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  top: 15, left: 10, right: 10, bottom: 15),
              child: Card(
                color: Colors.amber.shade600,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15))),
                child: Padding(
                  padding: EdgeInsets.only(top: 20, left: 15, right: 15),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "Saranel Platformu, yardıma ihtiyacı olan vatandaşları yardımsever insanlarla bir araya getiren tamamen ücretsiz bir platformdur. Fakat platformun işleyişini sürdürebilmek için değerli bağışçılarımıza ihtiyacımız var. Yapacağınız bağışlarla, Saranel platformunun sunucu ve operasyonel giderlerine destek sağlayabilir, toplumsal yardımlaşma ve dayanışma misyonumuzun bir parçası olabilirsiniz.",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color.fromARGB(255, 255, 255, 255),
                          fontSize: 12,
                          fontWeight: FontWeight.w100,
                        ),
                      ),
                      SizedBox(height: 20),
                      Text(
                        "Bağış yapmak istediğiniz miktarı seçin:",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 10),
                      Row(
                        
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: amounts.sublist(0, 3).map((amount) {
                          return ChoiceChip(
                            label: Text(
                              '$amount TL',
                              style: TextStyle(color: Colors.blue.shade900),
                            ),
                            selected: selectedAmount == amount.toString(),
                            onSelected: (selected) {
                              if (selected) {
                                onAmountSelected(amount);
                              }
                            },
                            backgroundColor: Colors.white,
                            selectedColor: Colors.green,
                            shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(10),
    side: BorderSide(color: Colors.white, width: 0),)
                          );
                        }).toList(),
                      ),
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: amounts.sublist(3, 6).map((amount) {
                          return ChoiceChip(
                            label: Text(
                              '$amount TL',
                              style: TextStyle(color: Colors.blue.shade900),
                            ),
                            selected: selectedAmount == amount.toString(),
                            onSelected: (selected) {
                              if (selected) {
                                onAmountSelected(amount);
                              }
                            },
                            backgroundColor: Colors.white,
                            selectedColor: Colors.green,
                            shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(10),
    side: BorderSide(color: Colors.white, width: 0),)
                          );
                        }).toList(),
                      ),
                      SizedBox(height: 20),
                      if (isButtonActive && selectedAmount != null)
                        ElevatedButton(
                          onPressed: () {
                            String? link =
                                amountLinks[int.parse(selectedAmount!)];
                            if (link != null) {
                              // TODO: Navigate to the link using a suitable method
                            }
                          },
                          child: Text(
                            "Bağış Yap",
                            style: TextStyle(color: Colors.blue.shade900, fontWeight: FontWeight.w400),
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                          ),
                        ),
                      SizedBox(height: 20),
                      Text(
                        "Yapacağınız bağış tek seferliktir. Tekrar etmez.",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 11,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                      SizedBox(height: 20)
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  TextStyle appbarStyle() =>
      GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.w800);
}
