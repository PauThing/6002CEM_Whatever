import 'package:flutter/material.dart';
import 'package:novelcomix_app/models/comic_model.dart';
import 'package:novelcomix_app/widgets/background_image.dart';
import 'package:novelcomix_app/widgets/comic_card_widget.dart';

class ComicPage extends StatelessWidget {
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
