import 'package:flutter/material.dart';
import 'package:novelcomix_app/data/comic.dart';
import 'package:novelcomix_app/design/background_image.dart';
import 'package:novelcomix_app/models/novel_model.dart';
import 'package:novelcomix_app/widgets/novelcomix_card_widget.dart';

class NovelListPage extends StatelessWidget {
  static String routeName = '/novelListPage';

  const NovelListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    String title = args["title"];
    List<NovelModel> listOfNovel = args["novelList"];

    return Stack(
      children: [
        BackgroundImage(),
        Scaffold(
          appBar: AppBar(
            title: Text(title),
          ),
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView.separated(
              physics: BouncingScrollPhysics(),
              itemBuilder: (context, index) => NovelCardWidget(
                novelModel: listOfNovel[index],
              ),
              itemCount: listOfNovel.length,
              separatorBuilder: (context, index) => SizedBox(
                height: 20,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
