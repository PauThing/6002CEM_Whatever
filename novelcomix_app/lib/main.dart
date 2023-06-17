import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:novelcomix_app/pages/bookmark_page.dart';
import 'package:novelcomix_app/pages/comic_detail_page.dart';
import 'package:novelcomix_app/pages/comic_list_page.dart';
import 'package:novelcomix_app/pages/comic_page.dart';
import 'package:novelcomix_app/pages/login_page.dart';
import 'package:novelcomix_app/pages/home_page.dart';
import 'package:novelcomix_app/pages/novel_detail_page.dart';
import 'package:novelcomix_app/pages/novel_list_page.dart';
import 'package:novelcomix_app/pages/novel_page.dart';
import 'package:novelcomix_app/pages/user_profile.dart';
import 'package:novelcomix_app/widgets/comic_bookmark.dart';
import 'package:novelcomix_app/widgets/novel_bookmark.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();             //ensure Firebase initialised before app run
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  refresh() {
    setState(() {});
  }

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
      //home: LoginPage(),
      initialRoute: LoginPage.routeName,
      routes: {
        LoginPage.routeName: (context) => const LoginPage(),
        HomePage.routeName: (context) => HomePage(),
        UserProfile.routeName: (context) => UserProfile(),
        BookmarkPage.routeName: (context) => BookmarkPage(),
        ComicBookmarkPage.routeName: (context) => ComicBookmarkPage(),
        NovelBookmarkPage.routeName: (context) => NovelBookmarkPage(),
        ComicPage.routeName: (context) => ComicPage(),
        ComicListPage.routeName: (context) => ComicListPage(),
        ComicDetailPage.routeName: (context) => ComicDetailPage(refreshUI: refresh,),
        NovelPage.routeName: (context) => NovelPage(),
        NovelListPage.routeName: (context) => NovelListPage(),
        NovelDetailPage.routeName: (context) => NovelDetailPage(refreshUI: refresh,),
      },
    );
  }
}