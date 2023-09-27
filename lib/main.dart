import 'package:firebase_core/firebase_core.dart';
// import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
/* import 'package:saranel_application/bakimmodu_screen/bakimmodu.dart'; */
import 'package:saranel_application/firebase_options.dart';
/* import 'package:saranel_application/genelayarlar/custompageGecis.dart'; */
import 'package:saranel_application/main_screens/anasayfa.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  /*
  final FirebaseRemoteConfig remoteConfig = FirebaseRemoteConfig.instance;

  await remoteConfig.setConfigSettings(RemoteConfigSettings(
    fetchTimeout: Duration(seconds: 1),
    minimumFetchInterval: Duration(seconds: 1),
  ));

  await remoteConfig.fetchAndActivate();

  bool bakimModu = remoteConfig.getBool('bakim_modu');

  print('Bakım Modu: $bakimModu');
  */

  runApp(MyApp(/* bakimModu: bakimModu */));

  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      systemNavigationBarColor: Colors.white,
      statusBarIconBrightness: Brightness.dark,
      systemNavigationBarIconBrightness: Brightness.dark));
}

class MyApp extends StatelessWidget {
  // final bool bakimModu;

  // MyApp({required this.bakimModu});

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
