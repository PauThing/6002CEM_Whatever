import 'package:flutter/material.dart';
import 'package:novelcomix_app/data/comic.dart';
import 'package:novelcomix_app/design/background_image.dart';
import 'package:novelcomix_app/models/comic_model.dart';
import 'package:novelcomix_app/widgets/comic_card_widget.dart';

class ComicListPage extends StatelessWidget {
  static String routeName = '/comicListPage';

  const ComicListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    String title = args["title"];
    List<ComicModel> listOfComic = args["comicList"];

    return Stack(
      children: [
        BackgroundImage(),
        Scaffold(
          appBar: AppBar(
            title: Text(title),
          ),
          body: Padding(
            padding: const EdgeInsets.all(15.0),
            child: ListView.separated(
              physics: BouncingScrollPhysics(),
              itemBuilder: (context, index) => ComicCardWidget(
                comicModel: listOfComic[index],
              ),
              itemCount: listOfComic.length,
              separatorBuilder: (context, index) => SizedBox(
                height: 25,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
