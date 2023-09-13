import 'package:flutter/material.dart';

class DonationPage extends StatefulWidget {
  @override
  State<DonationPage> createState() => _DonationPageState();
}

class _DonationPageState extends State<DonationPage> {
  String? selectedAmount;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.blue.shade800,
        appBar: AppBar(
          title: Text("Saranel'i Destekle"),
          backgroundColor: Colors.white,
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Container(
                width: 360,
                height: 40,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: Material(
                  borderRadius: BorderRadius.circular(50.0),
                  color: Colors.transparent,
                  child: TabBar(
                    labelColor: Colors.white,
                    unselectedLabelColor: Colors.grey,
                    indicator: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.blue.shade800,
                    ),
                    tabs: [
                      Tab(
                        child: Align(
                          alignment: Alignment.center,
                          child:
                              Text('Bağış Yap', style: TextStyle(fontSize: 16)),
                        ),
                      ),
                      Tab(
                        child: Align(
                          alignment: Alignment.center,
                          child: Text('Aylık Saranel Destek Paketi',
                              style: TextStyle(fontSize: 16)),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: TabBarView(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.white,
                          ),
                          height: 150,
                          width: double.infinity,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                            child: Image.asset(
                              'assets/images/ev.jpg',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            child: GridView(
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                childAspectRatio: 2.5,
                                mainAxisSpacing: 25,
                                crossAxisSpacing: 50,
                              ),
                              children: [
                                donationButton('10 ₺'),
                                donationButton('20 ₺'),
                                donationButton('50 ₺'),
                                donationButton('100 ₺'),
                                donationButton('200 ₺'),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                        Container(
                          width: double.infinity,
                          margin: EdgeInsets.only(right: 16),
                          alignment: Alignment.centerRight,
                          child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors
                                  .green, // "primary" özelliği "backgroundColor" ile değiştirildi
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                            ),
                            child: Text(
                              'Bağışta Bulun',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Center(
                    child: Text(
                      'Saranel Aboneliği',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget donationButton(String amount) {
    bool isSelected = selectedAmount == amount;
    return OutlinedButton(
      onPressed: () {
        setState(() {
          if (isSelected) {
            selectedAmount = null; // Eğer buton zaten seçiliyse, seçimi kaldır.
          } else {
            selectedAmount = amount; // Aksi halde, butonu seç.
          }
        });
      },
      style: OutlinedButton.styleFrom(
        side: BorderSide(
            color: isSelected
                ? Colors.blue.shade800
                : Color.fromARGB(255, 8, 8, 8)),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            amount,
            style: TextStyle(color: Colors.black, fontSize: 16),
          ),
          Divider(color: Colors.black),
          Text(
            isSelected ? '✓' : 'Seç',
            style: TextStyle(
                color: isSelected ? Colors.blue.shade800 : Colors.blue.shade800,
                fontSize: 14),
          ),
        ],
      ),
    );
  }
}
