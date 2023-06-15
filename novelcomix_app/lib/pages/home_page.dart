import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:novelcomix_app/design/font_style.dart';
import 'package:novelcomix_app/pages/bookmark_page.dart';
import 'package:novelcomix_app/pages/comic_page.dart';
import 'package:novelcomix_app/pages/login_page.dart';
import 'package:novelcomix_app/pages/novel_page.dart';
import 'package:novelcomix_app/pages/user_profile.dart';
import 'package:novelcomix_app/design/widgets.dart';
import 'package:novelcomix_app/widgets/bottom_navigation_bar.dart';

class HomePage extends StatefulWidget {
  static String routeName = '/HomePage';

  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedIndex = 0;

  List screens = [Home(), BookmarkPage(), ComicPage(), NovelPage()];

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
    return Scaffold(
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
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text("You are about to log out!"),
                            content: Text(
                                "Are you sure you want to proceed to Log In Page?"),
                            actions: [
                              TextButton(
                                child: Text("Cancel"),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                              ),
                              TextButton(
                                child: Text("Yes"),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                  signOut();
                                },
                              )
                            ],
                          );
                        });
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
      body: Container(
        child: screens.elementAt(selectedIndex),
      ),
    );
  }
}

//Home
class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        BackgroundImage(),
        Container(
          child: SingleChildScrollView(
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
