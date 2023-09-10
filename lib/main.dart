import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:saranel_application/main_screens/anasayfa.dart';

import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());

  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      systemNavigationBarColor: Colors.white, // Gezinme çubuğu rengi
      statusBarIconBrightness:
          Brightness.dark, // Durum çubuğu simgeleri için dark
      systemNavigationBarIconBrightness:
          Brightness.dark)); // Gezinme çubuğu simgeleri için dark
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
        textSelectionTheme: TextSelectionThemeData(
          selectionHandleColor: Colors.blue.shade600,
        ),
        textTheme: GoogleFonts.poppinsTextTheme(
          Theme.of(context).textTheme,
        ),
        scaffoldBackgroundColor: Colors.blue.shade800,
        appBarTheme: AppBarTheme(
            titleTextStyle: TextStyle(
                fontWeight: FontWeight.w500,
                color: Colors.blue.shade800,
                fontSize: 20),
            centerTitle: true,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(0),
                    bottomRight: Radius.circular(100))),
            shadowColor: Colors.black54,
            backgroundColor: Colors.white),
        useMaterial3: true,
      ),
      home: AnaSayfa(),
    );
  }
}
