import 'package:flutter/material.dart';
import 'package:novelcomix_app/data/comics_genre_list.dart';
import 'package:novelcomix_app/models/comic_model.dart';
import 'package:novelcomix_app/design/background_image.dart';
import 'package:novelcomix_app/widgets/comic_genre_widget.dart';

class ComicPage extends StatelessWidget {
  static String routeName ='/ComicPage';
  const ComicPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final args =
    // ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    // String title = args["Comic"];
    // List<ComicModel> ListOfComic = args["comicList"];

    return Stack(
      children: [
        BackgroundImage(),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Comics Genre",
                  style: TextStyle(
                    fontWeight: FontWeight.w900,
                    fontSize: 20,
                    fontStyle: FontStyle.italic,
                  ),
                ),
                Divider(
                  color: Colors.blueGrey,
                ),
                Expanded(
                  child: ListView.builder(
                    itemBuilder: (context, index) => ComicGenreWidget(
                      cGenreModel: comicGenreList[index],
                    ),
                    itemCount: comicGenreList.length,
                  ),
                )
              ],
            ),
          ),
        ),
      ],
      // appBar: AppBar(
      //   title: Text(title),
      // ),
      // body: Padding(
      //   padding: const EdgeInsets.all(8.0),
      //   child: ListView.separated(
      //     itemCount: ListOfComic.length,
      //     separatorBuilder: (context, index) => SizedBox(
      //       height: 20.0,
      //     ),
      //     physics: BouncingScrollPhysics(),
      //     itemBuilder: (context, index) => ComicCardWidget(
      //       comicModel: ListOfComic[index],
      //     ),
      //
      //   ),
      // ),
    );
  }
}
