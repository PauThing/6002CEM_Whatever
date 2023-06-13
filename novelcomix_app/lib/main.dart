import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:novelcomix_app/pages/login_page.dart';
import 'package:novelcomix_app/pages/home_page.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();             //ensure Firebase initialised before app run
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'NovelComix',
      theme: ThemeData(
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: Color(0xFF731942),
          selectedItemColor: Color(0xFFFFCDD2),
          unselectedItemColor: Colors.white,
        ),
        appBarTheme: AppBarTheme(backgroundColor: Color(0xFF731942)),
      ),
      home: LoginPage(),
    );
  }
}