import 'package:creativa_app/feautres/home/screen/HomeReg.dart';
import 'package:flutter/material.dart';
import 'feautres/home/screen/navbar.dart';
import 'feautres/home/screen/splashScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: "SplashS",
      routes: {
        "HomeReg": (context) => LoginPage(),
        "SplashS": (context) => SplashScreen(),
        "Navpage": (context) => NavigatorScreen()
      },
    );
  }
}
