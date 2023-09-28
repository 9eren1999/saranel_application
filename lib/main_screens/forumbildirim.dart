import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

class bildirimekrani extends StatefulWidget {
  const bildirimekrani({super.key});

  @override
  State<bildirimekrani> createState() => _bildirimekraniState();
}

class _bildirimekraniState extends State<bildirimekrani> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class NotificationService {
  final FirebaseMessaging _fcm = FirebaseMessaging.instance;

  Future initialize() async {
    // Uygulama arka planda çalışırken bildirimleri dinleme
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      print('A new onMessageOpenedApp event was published!');
      // Burada bildirime tıklanınca yapılacak işlemleri tanımlayabilirsiniz.
    });

    // Uygulama açıkken bildirimleri dinleme
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      print('A new onMessage event was published!');
      // Burada uygulama açıkken alınan bildirimleri işleyebilirsiniz.
    });
  }

  // Kullanıcının FCM tokenini al
  Future<String?> getToken() async {
    return await _fcm.getToken();
  }
}
