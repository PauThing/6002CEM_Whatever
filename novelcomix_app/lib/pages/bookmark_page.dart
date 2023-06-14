import 'package:flutter/material.dart';

class BookmarkPage extends StatelessWidget {
  const BookmarkPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final args =
    // ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    // String title = args["Bookmark"];
    // List<ComicModel> ListOfComic = args["comicList"];

    return Scaffold(
      appBar: AppBar(
        title: Text("Bookmark"),
        automaticallyImplyLeading: false,
      ),

    );
  }
}
