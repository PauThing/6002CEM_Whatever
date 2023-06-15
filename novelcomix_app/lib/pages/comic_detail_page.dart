import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:novelcomix_app/models/comic_model.dart';
import 'package:collection/collection.dart';

class ComicDetailPage extends StatelessWidget {
  static String routeName = '/comicDetailPage';

  Function() refreshUI;

  ComicDetailPage({Key? key, required this.refreshUI}) : super(key: key);

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
      appBar: AppBar(
        title: Text(comicModel.title),
      ),
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
            Text(
              "Author : " + comicModel.author,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.normal,
                color: Colors.grey,
                fontStyle: FontStyle.italic,
              ),
            ),
            const Divider(
              color: Colors.black,
            ),
            const Text(
              "Description",
              style: TextStyle(fontWeight: FontWeight.w900),
            ),
            Text(
              comicModel.description,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.normal,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              "Chapters",
              style: TextStyle(fontWeight: FontWeight.w900),
            ),
            Wrap(
              direction: Axis.horizontal,
              children: List.generate(comicModel.chapters, (index) {
                var i = index + 1;
                return Card(
                  color: Color(0xFF0E2376),
                  child: Padding(
                    padding: const EdgeInsets.only(
                        top: 5.0, bottom: 5.0, left: 15.0, right: 15.0),
                    child: Text(
                      "Chapter " + i.toString(),
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                );
              }),
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
