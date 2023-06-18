import 'package:flutter/material.dart';
import 'package:novelcomix_app/data/comic_genre_list.dart';
import 'package:novelcomix_app/design/background_image.dart';
import 'package:novelcomix_app/widgets/comic_genre_widget.dart';

class ComicPage extends StatelessWidget {
  static String routeName = '/ComicPage';

  const ComicPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                  "Comic Genres",
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
                    physics: BouncingScrollPhysics(),
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
    );
  }
}
