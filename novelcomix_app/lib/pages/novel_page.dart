import 'package:flutter/material.dart';
import 'package:novelcomix_app/data/novel_genre_list.dart';
import 'package:novelcomix_app/models/novel_model.dart';
import 'package:novelcomix_app/design/background_image.dart';
import 'package:novelcomix_app/models/genre_model.dart';
import 'package:novelcomix_app/widgets/novel_genre_widget.dart';

class NovelPage extends StatelessWidget {
  static String routeName ='/NovelPage';
  const NovelPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final args =
    // ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    // String title = args["title"];
    //List<NavigationName> ListOfComic = args["comicList"];

    return Stack(
      children: [
        BackgroundImage(),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Novel Genres",
                  style: TextStyle(
                    fontWeight: FontWeight.w900,
                    fontSize: 22,
                    fontStyle: FontStyle.italic,
                  ),
                ),
                Divider(
                  color: Colors.blueGrey,
                ),
                Expanded(
                  child: ListView.builder(
                    itemBuilder: (context, index) => NovelGenreWidget(
                      nGenreModel: novelGenreList[index],
                    ),
                    itemCount: novelGenreList.length,
                  ),
                )
              ],
            ),
          ),
        ),
      ],
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
