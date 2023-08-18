
import 'package:flutter/material.dart';
import 'package:saranel_application/screens/main_page.dart';

class Ayarlar extends StatefulWidget {
  const Ayarlar({super.key});

  @override
  State<Ayarlar> createState() => _AyarlarState();
}

class _AyarlarState extends State<Ayarlar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column( 
        children: [
        Card(
          elevation: 1,
        color: Colors.white,
        shadowColor: Colors.black54,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20))),
        margin: EdgeInsets.only(left: 30, top: 20),
        child: SizedBox(width: 350, height: 285,
          child: Padding(
            padding: EdgeInsets.only(top:20, left: 22, right: 22),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "Saraneli Desteklemek İster Misiniz?",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Color.fromARGB(255, 23, 190, 219), fontSize: 16, fontWeight: FontWeight.w600),                 
                ),
                SizedBox(height: 15,),
                Text(
                  "Saranel, yardım ve bağışların etkin bir şekilde derlenip yönlendirilmesi amacıyla kurulmuş ücretsiz bir platformdur. Fakat, sunucu giderleri ve diğer operasyonel alanlarda faaliyetlerimizi sürdürebilmek için siz değerli bağışçılarımızın desteğine ihtiyaç duyuyoruz. Saranel'e yapacağınız destek, tüm bu önemli faaliyetlerin devamlılığını sağlayacaktır. Siz de Saranel'i destekleyerek, toplumsal dayanışma ve yardımlaşma misyonumuzun bir parçası olabilirsiniz.",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Color.fromARGB(255, 23, 190, 219), fontSize: 12, fontWeight: FontWeight.w400),
                ),
                SizedBox(height: 15,),
                ElevatedButton(onPressed: () {
                  
                }, child: Text("Saranel'i Destekle!", style: TextStyle(color: Colors.white,),),style: ButtonStyle(backgroundColor: MaterialStatePropertyAll(Color.fromARGB(255, 23, 190, 219))), )
              ],
            ),
          ),
        ),
      ),
    ],
  ),

      appBar: AppBar(title: Text("Ayarlar"),        
      leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Color.fromARGB(255, 23, 190, 219)),
          onPressed: () {
        Navigator.pushReplacement(context,
        PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => MainPage(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        var begin = Offset(0.0, 0.0);
        var end = Offset.zero;
        var tween = Tween(begin: begin, end: end);
        var offsetAnimation = animation.drive(tween);

        return SlideTransition(
          position: offsetAnimation,
          child: child,
          );
      },
    ),
  );
})));}}