import 'package:flutter/material.dart';
import 'package:novelcomix_app/data/comic.dart';
import 'package:novelcomix_app/data/novel.dart';
import 'package:novelcomix_app/design/background_image.dart';
import 'package:novelcomix_app/widgets/novelcomix_card_widget.dart';

class NovelBookmarkPage extends StatelessWidget {
  static String routeName ='/NovelBookmarkPage';
  const NovelBookmarkPage({Key? key}) : super(key: key);

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
                  "Favourite Novels",
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
                  child: ListView.separated(
                    separatorBuilder: (context, index) {
                      return SizedBox(height: 15);
                    },
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (context, index) => NovelCardWidget(
                        novelModel: novelList
                            .where((element) => element.isFavourite == true)
                            .toList()[index]),
                    itemCount: comicList
                        .where((element) => element.isFavourite == true)
                        .toList()
                        .length,
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