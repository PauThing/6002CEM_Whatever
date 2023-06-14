class NovelModel {
  final String title;
  final String genre;
  final List<String> chapters;
  final String author;
  final String imageUrl;
  bool isFavourite;

  NovelModel({
    required this.genre,
    required this.imageUrl,
    required this.title,
    required this.chapters,
    required this.author,
    this.isFavourite = false,
  });
}