import 'package:flutter/material.dart';
import 'package:saranel_application/main_screens/anasayfa.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _navigateToNextPage();
    });
  }

  void _navigateToNextPage() async {
    // Burada, bir bekleme süresi ekleyerek uygulamanın yükleme süresini simüle ediyoruz.
    // Gerçek bir uygulamada, bu süre uygulamanın yüklenmesi için gereken gerçek süreye bağlı olarak değişebilir.
    await Future.delayed(Duration(seconds: 3));
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) => AnaSayfa(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/saranelLOGO2.png', width: 225),  // Logo resminizin yolu
            SizedBox(height: 20),
            CircularProgressIndicator(
              color: Colors.blue.shade800,  // Yüklenme animasyonunun rengi
            ),
          ],
        ),
      ),
      backgroundColor: Colors.white,
    );
  }
}
