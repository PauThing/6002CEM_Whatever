import 'package:flutter/material.dart';
import 'package:novelcomix_app/font_style.dart';
import 'package:novelcomix_app/widgets/widgets.dart';

class UserProfile extends StatelessWidget {
  const UserProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        BackgroundImage(),
        Scaffold(
          backgroundColor: Colors.transparent,
          bottomNavigationBar: BottomNavigationBar(
            onTap: (value) {},
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
