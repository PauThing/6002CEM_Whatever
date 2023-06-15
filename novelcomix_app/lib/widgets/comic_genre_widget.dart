import 'package:flutter/material.dart';
import 'package:novelcomix_app/data/comic_genre_list.dart';
import 'package:novelcomix_app/data/comic.dart';
import 'package:novelcomix_app/models/comic_model.dart';
import 'package:novelcomix_app/models/genre_model.dart';
import 'package:novelcomix_app/pages/comic_list_page.dart';
import 'package:novelcomix_app/pages/comic_page.dart';

class ComicGenreWidget extends StatelessWidget {
  final ComicsGenreModel cGenreModel;

  const ComicGenreWidget({Key? key, required this.cGenreModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<ComicModel> list;

    return Column(
      children: [
        InkWell(
          onTap: () {
            list = comicList
                .where((element) =>
            element.genre == cGenreModel.comicGenre)
                .toList();

            Navigator.of(context).pushNamed(
              ComicListPage.routeName,
              arguments: {
                'title': cGenreModel.comicGenre,
                'comicList': list,
              },
            );
          },
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15.0),
            child: SizedBox(
              child: Stack(
                children: [
                  Image.network(
                    cGenreModel.imageComic,
                    height: 200,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                  Positioned(
                    bottom: 0,
                    child: Container(
                      height: 40,
                      width: 440,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                            colors: [Colors.blueGrey, Colors.transparent]),
                      ),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: EdgeInsets.only(left: 25),
                          child: Text(
                            cGenreModel.comicGenre,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        SizedBox(
          height: 30,
        ),
      ],
    );
  }
}
