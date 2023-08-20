import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:saranel_application/main_screens/anasayfa.dart';
import 'package:saranel_application/main_screens/ayarlar.dart';
import 'package:saranel_application/main_screens/ekle.dart';
import 'package:saranel_application/main_screens/kampanyalar.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0; // Şu anda seçili olan sekmenin endeksi

  final List<Widget> pages = [
    AnaSayfa(),
    Kampanyalar(),
    IlanEkle(),
    Ayarlar(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[_selectedIndex],
      bottomNavigationBar: _selectedIndex == 4
          ? null
          : 
          Container(
            decoration: BoxDecoration(
    boxShadow: [
      BoxShadow(
        color: Color.fromARGB(82, 202, 201, 201).withOpacity(0.5),
        spreadRadius: 3,
        blurRadius: 9,
        offset: Offset(1, 0), // Gölgelendirmenin pozisyonunu ayarlar
            )]),
          child: GNav(
              gap: 7,
              padding: EdgeInsets.symmetric(horizontal: 26, vertical: 15),
iconSize: 23, 
              tabBackgroundColor: Color.fromARGB(20, 48, 44, 44),
              backgroundColor: Color.fromARGB(255, 218, 50, 64),
              color: Color.fromARGB(255, 245, 245, 245),
              textSize: 15,
              activeColor: Color.fromARGB(255, 255, 255, 255),
              tabs: const [
                GButton(icon: Icons.home, text: "AnaSayfa", ),
                GButton(icon: Icons.content_paste_search_sharp, text: "Kampanyalar"),
                GButton(icon: Icons.add_circle_outline_sharp, text: "İlan Ekle"),
                GButton(icon: Icons.settings, text: "Ayarlar")
              ],
              selectedIndex: _selectedIndex, // Şu anda seçili olan sekme
              onTabChange: (index) {
                // Sekme değiştiğinde, yeni endeksi ayarla ve yeniden oluştur
                setState(() {
                  _selectedIndex = index;
                });
              },
            ),
    ));
  }
}

          

           