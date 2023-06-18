import 'package:flutter/material.dart';
import 'package:novelcomix_app/data/novel_genre_list.dart';
import 'package:novelcomix_app/design/background_image.dart';
import 'package:novelcomix_app/widgets/novel_genre_widget.dart';

class NovelPage extends StatelessWidget {
  static String routeName = '/NovelPage';

  const NovelPage({Key? key}) : super(key: key);

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
                    physics: BouncingScrollPhysics(),
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
    );
  }
}
