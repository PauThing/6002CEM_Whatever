import 'package:flutter/material.dart';
import 'package:novelcomix_app/font_style.dart';
import 'package:novelcomix_app/widgets/widgets.dart';
import 'package:novelcomix_app/widgets/bottom_navigation_bar.dart';

class UserProfile extends StatefulWidget {
  static String routeName = '/UserProfile';
  const UserProfile({Key? key}) : super(key: key);

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  int selectedIndex = 0;

  void onClicked(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        BackgroundImage(),
        Scaffold(
          backgroundColor: Colors.transparent,
          bottomNavigationBar: BottomNavigation(selectedIndex: selectedIndex, onClicked: onClicked,),
          // bottomNavigationBar: BottomNavigationBar(
          //   onTap: (value) {},
          //   type: BottomNavigationBarType.fixed,
          //   items: const [
          //     BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          //     BottomNavigationBarItem(
          //         icon: Icon(Icons.bookmark), label: "Bookmark"),
          //     BottomNavigationBarItem(
          //         icon: Icon(Icons.menu_book), label: "Comics"),
          //     BottomNavigationBarItem(
          //         icon: Icon(Icons.my_library_books), label: "Novels"),
          //   ],
          // ),
          appBar: AppBar(
            title: Text(
              "Profile",
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
