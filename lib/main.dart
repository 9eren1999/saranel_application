import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:saranel_application/main_screens/main_page.dart';

import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());

  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    systemNavigationBarColor: const Color.fromARGB(255, 218, 50, 64), ),);// Navigasyon çubuğunun rengi
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Saranel',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: GoogleFonts.poppinsTextTheme(
          Theme.of(context).textTheme,
        ),
        scaffoldBackgroundColor: Color.fromRGBO(250, 250, 250, 1),
        appBarTheme: AppBarTheme(
            titleTextStyle: TextStyle(
                fontWeight: FontWeight.w500,
                color: Color.fromARGB(255, 253, 253, 253),
                fontSize: 20),
                centerTitle: true,
               shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(bottomLeft: Radius.circular(0), bottomRight: Radius.circular(100))),
            shadowColor: Colors.black54,
            backgroundColor: Color.fromARGB(255, 218, 50, 64)),
        useMaterial3: true,
      ),
      home: MainPage(),
    );
  }
}
