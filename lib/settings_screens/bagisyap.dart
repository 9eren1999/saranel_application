import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
          title: Text("Saranel'i Destekle", style: GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.w800),)
          , leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.arrow_back_ios_sharp,
                color: Colors.blue.shade800,
                size: 19,
              )),
          backgroundColor: Colors.white,
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 30),
              child: Container(
                width: 320,
                height: 40,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(21.0),
                ),
                child: Material(
                  borderRadius: BorderRadius.circular(50.0),
                  color: Color.fromARGB(0, 209, 6, 6), 
                  child: TabBar( indicatorSize: TabBarIndicatorSize.tab ,
                    labelColor: Colors.white,
                    
                    unselectedLabelColor: Colors.blue.shade800,   
                    indicatorColor: Colors.transparent,         
                    indicator: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.blue.shade900,
                    ),
                    tabs: [
                      Tab(
                        child: Align(
                          alignment: Alignment.center,
                          child:
                              Text('Tek Seferlik Bağış', style: TextStyle(fontSize: 12)),
                        ),
                      ),
                      Tab(
                        child: Align(
                          alignment: Alignment.center,
                          child: Text('Aylık Düzenli Bağış', textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 12)),
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
            padding: const EdgeInsets.only(right: 20, left: 20, top: 20, bottom: 20),
            child: Column(  
              children: [ Text("Bağış yapmak istediğin tutarı seçiniz.\n",style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.white), ),
                
                SizedBox(height: 120,
                  child: Expanded(  
                    child: Container(  
                      decoration: BoxDecoration(
                        color: Colors.white, 
                        borderRadius: BorderRadius.circular(15.0),
                        
                      ),
                      child: Padding( 
                        padding: const EdgeInsets.all(10.0),
                        child: GridView( 
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            childAspectRatio: 2.5,
                            mainAxisSpacing: 10,
                            crossAxisSpacing: 15,
                          ), 
                          children: [ 
                            donationButton('10 TL'),
                            donationButton('20 TL'),
                            donationButton('50 TL'),
                            donationButton('100 TL'),
                            donationButton('200 TL'),
                            donationButton('500 TL'),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                        SizedBox(height:10),
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
                   Expanded( 
      child: TabBarView(
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 20, left: 20, top: 20, bottom: 20),
            child: Column(  
              children: [ Text("Düzenli bağış yapmak istediğin tutarı seçiniz.\n",style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.white), ),
                
                SizedBox(height: 130,
                  child: Expanded(  
                    child: Container(  
                      decoration: BoxDecoration(
                        color: Colors.white, 
                        borderRadius: BorderRadius.circular(15.0),
                        
                      ),
                      child: Padding( 
                        padding: const EdgeInsets.all(10.0),
                        child: GridView( 
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
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
                ),
                        SizedBox(height:10),
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
        ]),
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
  return AnimatedContainer(
    duration: Duration(milliseconds: 300), 
    decoration: BoxDecoration(
      color: isSelected ? Colors.blue.shade800 : Colors.white, 
      border: Border.all(color: isSelected ? Colors.white : Colors.blue.shade900), 
      borderRadius: BorderRadius.circular(15.0), 
    ),
    child: OutlinedButton(
      onPressed: () {
        setState(() {
          if (isSelected) {
            selectedAmount = null; 
          } else {
            selectedAmount = amount; 
          }
        });
      },
      style: OutlinedButton.styleFrom(
        side: BorderSide(color: const Color.fromARGB(0, 241, 26, 26)), 
        backgroundColor: Colors.transparent, 
        padding: EdgeInsets.all(5.0), 
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            amount,
            style: TextStyle(color: isSelected ? Colors.white : Colors.blue.shade800, fontSize: 16),
          ),
        ],
      ),
    ),
  );
}
}