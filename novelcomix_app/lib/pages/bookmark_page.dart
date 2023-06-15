import 'package:flutter/material.dart';
import 'package:novelcomix_app/design/background_image.dart';
import 'package:novelcomix_app/widgets/comic_bookmark.dart';
import 'package:novelcomix_app/widgets/novel_bookmark.dart';
import 'package:novelcomix_app/widgets/bookmark_bar.dart';

class BookmarkPage extends StatefulWidget {
  static String routeName = '/BookmarkPage';
  const BookmarkPage({Key? key}) : super(key: key);

  @override
  State<BookmarkPage> createState() => _BookmarkPageState();
}

class _BookmarkPageState extends State<BookmarkPage> {
  int selectedIndex = 0;

  List screens = [ComicBookmarkPage(), NovelBookmarkPage()];

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
          bottomNavigationBar: BookmarkFilter(
            selectedIndex: selectedIndex,
            onClicked: onClicked,
          ),
          body: Container(
            child: screens.elementAt(selectedIndex),
          ),
        ),
      ],
    );
  }
}
