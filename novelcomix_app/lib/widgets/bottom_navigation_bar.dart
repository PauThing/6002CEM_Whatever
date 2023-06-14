import 'package:flutter/material.dart';

class BottomNavigation extends StatelessWidget {
  final selectedIndex;
  ValueChanged<int> onClicked;
  BottomNavigation({Key? key, required this.selectedIndex, required this.onClicked}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
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
      currentIndex: selectedIndex,
      onTap: onClicked,
    );
  }
}