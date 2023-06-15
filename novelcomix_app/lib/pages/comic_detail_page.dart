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
              alignment: Alignment.center,
              height: 220,
              width: 160,
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              comicModel.title,
              style: const TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              "Author : ${comicModel.author}",
              style: const TextStyle(
                fontSize: 18,
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
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w900),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              comicModel.description,
              textAlign: TextAlign.justify,
              style: const TextStyle(
                fontSize: 16,
                color: Colors.black54,
                fontWeight: FontWeight.normal,
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            const Text(
              "Chapters",
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w900),
            ),
            const SizedBox(
              height: 10,
            ),
            Wrap(
              direction: Axis.horizontal,
              children: List.generate(comicModel.chapters, (index) {
                var i = index + 1;
                return Card(
                  color: Color(0xFF731942),
                  child: Padding(
                    padding: const EdgeInsets.only(
                        top: 10.0, bottom: 10.0, left: 15.0, right: 15.0),
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
