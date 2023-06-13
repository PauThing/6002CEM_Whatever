import 'package:flutter/material.dart';
import 'package:novelcomix_app/sign_in.dart';
import 'package:novelcomix_app/home_page.dart';

void main() {
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
          backgroundColor: Color(0xFFB71C1C),
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.grey,
        ),
        appBarTheme: AppBarTheme(backgroundColor: Color(0xFFB71C1C)),
        primarySwatch: Colors.red,
      ),
      home: SignIn(),
    );
  }
}