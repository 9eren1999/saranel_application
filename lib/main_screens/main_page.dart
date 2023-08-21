import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:saranel_application/main_screens/anasayfa.dart';
import 'package:saranel_application/main_screens/ayarlar.dart';
import 'package:saranel_application/main_screens/ekle.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 1; // Şu anda seçili olan sekmenin endeksi

  final List<Widget> pages = [
    IlanEkle(),
    AnaSayfa(),
    Ayarlar(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: pages[_selectedIndex],
        bottomNavigationBar: _selectedIndex == 3
            ? null
            : Container(
                //         decoration: BoxDecoration(
                // boxShadow: [
                //   BoxShadow(
                //     color: Color.fromARGB(82, 202, 201, 201).withOpacity(0.5),
                //     spreadRadius: 3,
                //     blurRadius: 9,
                //     offset: Offset(1, 0), // Gölgelendirmenin pozisyonunu ayarlar
                //         )]),
                child: GNav(
                  gap: 7,
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                  iconSize: 25,
                  tabBackgroundColor: Color.fromARGB(14, 24, 24, 51),
                  backgroundColor: Color.fromARGB(255, 250, 250, 250),
                  color: Colors.blue.shade800,
                  textSize: 15,
                  activeColor: Colors.blue.shade800,
                  tabs: const [
                    GButton(
                        icon: Icons.add_circle_outline_sharp,
                        text: "İlan Ekle"),
                    GButton(
                      icon: Icons.home,
                      text: "AnaSayfa",
                    ),
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
