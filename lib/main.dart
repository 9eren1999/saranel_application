import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:saranel_application/firebase_options.dart';
import 'package:saranel_application/main_screens/anasayfa.dart';
import 'package:saranel_application/main_screens/forum.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(MyApp());

  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      systemNavigationBarColor: Colors.white,
      statusBarIconBrightness: Brightness.dark,
      systemNavigationBarIconBrightness: Brightness.dark));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;

  @override
  void initState() {
    super.initState();
    _setupFirebaseNotifications();
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      if (message.data['tag'] == 'forumbildirim') {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ForumPage(),
          ),
        );
      }
    });
  }

  Future<void> _setupFirebaseNotifications() async {
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      print("onMessage: $message");
    });

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      print("onMessageOpenedApp: $message");
    });

    // Uygulama kapalıyken tıklanılan bildirim
    FirebaseMessaging.instance
        .getInitialMessage()
        .then((RemoteMessage? message) {
      if (message != null && message.data['tag'] == 'forumbildirim') {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ForumPage(),
          ),
        );
      }
    });

    // iOS için bildirim izinleri
    await _firebaseMessaging.requestPermission(
      alert: true,
      badge: true,
      sound: true,
      provisional: false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Saranel Platformu',
      locale: Locale('tr', 'TR'),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        /* pageTransitionsTheme: PageTransitionsTheme(builders: {
          TargetPlatform.android: CustomPageTransitionBuilder(),
          TargetPlatform.iOS: CustomPageTransitionBuilder(),
        }), */
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
      home: /*  bakimModu ? BakimModuPage() :  */ AnaSayfa(),
    );
  }
}
