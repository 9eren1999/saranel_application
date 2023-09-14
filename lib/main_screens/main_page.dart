// import 'package:flutter/material.dart';
// import 'package:google_nav_bar/google_nav_bar.dart';
// import 'package:saranel_application/main_screens/anasayfa.dart';
// import 'package:saranel_application/main_screens/bilgi.dart';
// import 'package:saranel_application/main_screens/smaekle.dart';

// class MainPage extends StatefulWidget {
//   const MainPage({super.key});

//   @override
//   State<MainPage> createState() => _MainPageState();
// }

// class _MainPageState extends State<MainPage> {
//   int _selectedIndex = 1; // Şu anda seçili olan sekmenin endeksi

//   final List<Widget> pages = [
//     IlanEkle(),
//     AnaSayfa(),
//     Ayarlar(),
//   ];
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         body: pages[_selectedIndex],
//         bottomNavigationBar: _selectedIndex == 3
//     ? null
//     : Container(
//         height: MediaQuery.of(context).size.height * 0.08, // Ekranın %8'i
//         // decoration kısmı isteğe bağlı olarak eklenebilir
//         child: GNav(
//           gap: 7,
//           padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
//           iconSize: 25,
//           tabBackgroundColor: Color.fromARGB(14, 24, 24, 51),
//           backgroundColor: Color.fromARGB(255, 250, 250, 250),
//           color: Colors.blue.shade800,
//           textSize: 15,
//           activeColor: Colors.blue.shade800,
//           tabs: const [
//             GButton(icon: Icons.add_box, text: "İlan Ekle"),
//             GButton(icon: Icons.home, text: "AnaSayfa"),
//             GButton(icon: Icons.info, text: "Bilgi"),
//           ],
//           selectedIndex: _selectedIndex,
//           onTabChange: (index) {
//             setState(() {
//               _selectedIndex = index;
//             });
//           },
//         ),
//       ), );

//   }
// }
