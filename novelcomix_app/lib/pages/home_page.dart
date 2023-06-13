import 'package:flutter/material.dart';
import 'package:novelcomix_app/font_style.dart';
import 'package:novelcomix_app/pages/user_profile.dart';
import 'package:novelcomix_app/widgets/widgets.dart';

class HomePage extends StatefulWidget {
  static String routeName = '/myHomePage';
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int myIndex = 0;

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
              BottomNavigationBarItem(
                  icon: Icon(Icons.home), label: "Home"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.bookmark), label: "Bookmark"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.menu_book), label: "Comics"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.my_library_books), label: "Novels"),
            ],
          ),
          appBar: AppBar(
            title: Text(
              "Home",
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 12.0),
                child: InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => UserProfile()));
                  },
                  child: CircleAvatar(
                    backgroundImage: AssetImage("assets/profile.png"),
                  ),
                ),
              ),
            ],
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Divider(
                    color: Colors.black,
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
