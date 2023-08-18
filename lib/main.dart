import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:saranel_application/main_screens/main_page.dart';

import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
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
        appBarTheme: const AppBarTheme(
            titleTextStyle: TextStyle(
                fontWeight: FontWeight.w600,
                color: Color.fromARGB(255, 23, 190, 219),
                fontSize: 22),
            centerTitle: true,
            elevation: 0.80,
            shadowColor: Colors.black54,
            backgroundColor: Colors.white),
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(255, 255, 255, 255)),
        useMaterial3: true,
      ),
      home: MainPage(),
    );
  }
}
