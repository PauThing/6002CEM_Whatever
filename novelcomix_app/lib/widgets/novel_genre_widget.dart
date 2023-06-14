import 'package:flutter/material.dart';
import 'package:novelcomix_app/data/novel_genre_list.dart';
import 'package:novelcomix_app/models/novel_model.dart';
import 'package:novelcomix_app/models/genre_model.dart';
import 'package:novelcomix_app/pages/novel_page.dart';

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
          // onTap: () {
          //   list = exerciseList
          //       .where((element) =>
          //   element.category == wCategoryModel.categoryName)
          //       .toList()
          //       .where(
          //           (element) => element.difficulty <= AppState.difficultyLevel)
          //       .toList();
          //
          //   if (AppState.selectedEquipment == Equipment.equipment) {
          //     list = list
          //         .where((element) => element.equipment.isNotEmpty)
          //         .toList();
          //   } else if (AppState.selectedEquipment == Equipment.noEquipment) {
          //     list =
          //         list.where((element) => element.equipment.isEmpty).toList();
          //   }
          //
          //   Navigator.of(context).pushNamed(
          //     ActivityListPage.routeName,
          //     arguments: {
          //       'title': wCategoryModel.categoryName,
          //       'exerciseList': list,
          //     },
          //   );
          // },
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