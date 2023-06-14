import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:novelcomix_app/font_style.dart';
import 'package:novelcomix_app/pages/login_page.dart';
import 'package:novelcomix_app/pages/user_profile.dart';
import 'package:novelcomix_app/widgets/widgets.dart';

class HomePage extends StatefulWidget {
  static String routeName = '/HomePage';
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int myIndex = 0;
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
          // drawer: Drawer(
          //   child: Column(
          //     children: [
          //       Container(
          //         height: 100,
          //         width: double.infinity,
          //         color: const Color(0xFF731942),
          //         child: Padding(
          //           padding: const EdgeInsets.only(top: 50, left: 20),
          //           child: Text(
          //             "Genre",
          //             style: TextStyle(
          //                 color: Colors.white,
          //                 fontWeight: FontWeight.bold,
          //                 fontSize: 25),
          //           ),
          //         ),
          //       ),
          //     ],
          //   ),
          // ),
          bottomNavigationBar: BottomNavigationBar(
            onTap: (index) {
              setState(() {
                myIndex = index;
              });
            },
            currentIndex: myIndex,
            type: BottomNavigationBarType.fixed,
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.bookmark), label: "Bookmark"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.menu_book), label: "Comics"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.my_library_books), label: "Novels"),
            ],
          ),
          appBar: AppBar(
            automaticallyImplyLeading: false, //disable back button
            title: Text(
              "Home",
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
