import 'package:flutter/material.dart';
import 'package:novelcomix_app/data/comic.dart';
import 'package:novelcomix_app/design/background_image.dart';
import 'package:novelcomix_app/widgets/novelcomix_card_widget.dart';

import '../models/comic_model.dart';

class ComicBookmarkPage extends StatelessWidget {
  static String routeName = '/ComicBookmarkPage';

  const ComicBookmarkPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<ComicModel> favoriteComics =
        comicList.where((element) => element.isFavourite == true).toList();

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
                  "Favourite Comics",
                  style: TextStyle(
                    fontWeight: FontWeight.w900,
                    fontSize: 22,
                    fontStyle: FontStyle.italic,
                  ),
                ),
                Divider(
                  color: Colors.blueGrey,
                ),
                favoriteComics.isEmpty
                    ? Center(
                        child: Text("No bookmarked comics"),
                      )
                    : Expanded(
                        child: ListView.separated(
                          separatorBuilder: (context, index) =>
                              SizedBox(height: 15),
                          physics: const BouncingScrollPhysics(),
                          itemBuilder: (context, index) {
                            if (index >= 0 && index < favoriteComics.length) {
                              return ComicCardWidget(
                                comicModel: favoriteComics[index],
                              );
                            } else {
                              // Handle the case when the index is out of range
                              return SizedBox();
                            }
                          },
                          itemCount: favoriteComics.length,
                        ),
                      ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
