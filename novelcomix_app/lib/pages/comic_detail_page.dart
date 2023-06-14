import 'package:flutter/material.dart';
import 'package:novelcomix_app/models/comic_model.dart';
import 'package:collection/collection.dart';

class ExerciseDetailPage extends StatelessWidget {
  static String routeName = '/comicDetailPage';

  Function() refreshUI;

  ExerciseDetailPage({Key? key, required this.refreshUI}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ComicModel comicModel =
        ModalRoute.of(context)!.settings.arguments as ComicModel;

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          comicModel.isFavourite = !comicModel.isFavourite;
          refreshUI();
        },
        backgroundColor: Colors.white,
        child: Icon(
          comicModel.isFavourite ? Icons.favorite : Icons.favorite_border,
          color: Colors.red,
        ),
      ),
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
        child: ListView(
          children: [
            Image.network(
              comicModel.imageUrl,
              height: 200,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            Text(
              comicModel.title,
              style: const TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Divider(
              color: Colors.black,
            ),
            ...comicModel.chapters
                .mapIndexed(
                  (index, e) => ListTile(
                    title: Text(e),
                    leading: CircleAvatar(
                      child: Text(
                        (index + 1).toString(),
                      ),
                    ),
                  ),
                )
                .toList(),
            const SizedBox(
              height: 20,
            ),
            const Text(
              "Targeted Muscles",
              style: TextStyle(fontWeight: FontWeight.w900),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              "Chapters",
              style: TextStyle(fontWeight: FontWeight.w900),
            ),
            Row(
              children: comicModel.chapters
                  .map((e) => Card(
                        color: Color(0xFF0E2376),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            e,
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ))
                  .toList(),
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
