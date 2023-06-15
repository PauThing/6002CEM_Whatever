import 'package:flutter/material.dart';
import 'package:novelcomix_app/design/background_image.dart';

class BookmarkPage extends StatelessWidget {
  static String routeName ='/BookmarkPage';
  const BookmarkPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final args =
    // ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    // String title = args["Bookmark"];
    // List<ComicModel> ListOfComic = args["comicList"];

    return Stack(children: [
      BackgroundImage(),
      Scaffold(
        backgroundColor: Colors.transparent,
      ),
    ]);
  }
}
