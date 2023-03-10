import 'package:flutter/material.dart';
import 'feautres/home/screen/Login.dart';
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
      initialRoute: "home",
      routes: {
        "Login": (context) => Login(),
        "home": (context) => SplashScreen()
      },
    );
  }
}
