import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:saranel_application/screens/anasayfa.dart';
import 'package:saranel_application/screens/ayarlar.dart';
import 'package:saranel_application/screens/kampanyalar.dart';
import 'package:saranel_application/screens/kuruluslar.dart';

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
     Kurusluslar(),
     Ayarlar(),
  ]; 
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: pages[_selectedIndex], 
      bottomNavigationBar: _selectedIndex == 3
          ? null
          : GNav (gap: 10,
        backgroundColor: Colors.white,
        color: Colors.black,
        activeColor: const Color.fromARGB(255, 23, 190, 219),
        tabs: const [
          GButton(icon: Icons.home, text: "AnaSayfa"),
          GButton(icon: Icons.fact_check_outlined, text: "Kampanyalar"),
          GButton(icon: Icons.travel_explore_sharp, text: "Kuruluşlar"),
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
    );
  }
}
