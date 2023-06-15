import 'package:flutter/material.dart';

class BookmarkFilter extends StatelessWidget {
  final selectedIndex;
  ValueChanged<int> onClicked;

  BookmarkFilter(
      {Key? key, required this.selectedIndex, required this.onClicked})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      backgroundColor: Color(0xFFE57373),
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.menu_book), label: "Comics"),
        BottomNavigationBarItem(
            icon: Icon(Icons.my_library_books), label: "Novels"),
      ],
      currentIndex: selectedIndex,
      onTap: onClicked,
    );
  }
}
