import 'package:flutter/material.dart';
import 'package:novelcomix_app/data/novel.dart';
import 'package:novelcomix_app/models/novel_model.dart';
import 'package:novelcomix_app/models/genre_model.dart';
import 'package:novelcomix_app/pages/novel_list_page.dart';

class NovelGenreWidget extends StatelessWidget {
  final NovelGenreModel nGenreModel;

  const NovelGenreWidget({Key? key, required this.nGenreModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<NovelModel> list;

    return Column(
      children: [
        InkWell(
          onTap: () {
            list = novelList
                .where((element) =>
            element.genre == nGenreModel.novelGenre)
                .toList();

            Navigator.of(context).pushNamed(
              NovelListPage.routeName,
              arguments: {
                'title': nGenreModel.novelGenre,
                'novelList': list,
              },
            );
          },
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: SizedBox(
              child: Stack(
                children: [
                  Image.network(
                    nGenreModel.imageNovel,
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
                            nGenreModel.novelGenre,
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