import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:novelcomix_app/font_style.dart';
import 'package:novelcomix_app/pages/comic_page.dart';
import 'package:novelcomix_app/pages/login_page.dart';
import 'package:novelcomix_app/pages/novel_page.dart';
import 'package:novelcomix_app/pages/user_profile.dart';
import 'package:novelcomix_app/widgets/widgets.dart';
import 'package:novelcomix_app/widgets/bottom_navigation_bar.dart';

class HomePage extends StatefulWidget {
  static String routeName = '/HomePage';

  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedIndex = 0;

  List screens = [HomePage(), ComicPage(), NovelPage()];

  void onClicked(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  final FirebaseAuth auth = FirebaseAuth.instance;

  //signout function
  signOut() async {
    await auth.signOut();
    Navigator.of(context).pushNamed(LoginPage.routeName);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        BackgroundImage(),
        Scaffold(
          backgroundColor: Colors.transparent,
          bottomNavigationBar: BottomNavigation(
            selectedIndex: selectedIndex,
            onClicked: onClicked,
          ),
          appBar: AppBar(
            automaticallyImplyLeading: false, //disable back button
            title: Text(
              "Welcome to NovelComix",
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            actions: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 5.0),
                    child: InkWell(
                      onTap: () {
                        Navigator.of(context).pushNamed(UserProfile.routeName);
                      },
                      child: const CircleAvatar(
                        backgroundImage: AssetImage("assets/profile.png"),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: InkWell(
                      onTap: () {
                        signOut();
                        // Navigator.push(context,
                        //     MaterialPageRoute(builder: (context) => LoginPage()));
                      },
                      child: Icon(
                        Icons.logout,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  Container(
                    child: Text(
                      "Comics",
                      style: homepageText,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Divider(
                    color: Colors.black,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    child: Text(
                      "Novels",
                      style: homepageText,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
