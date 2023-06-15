class NovelModel {
  final String title;
  final String genre;
  final int chapters;
  final String author;
  final String description;
  final String publication;
  final String status;
  final String imageUrl;
  bool isFavourite;

  NovelModel({
    required this.title,
    required this.genre,
    required this.chapters,
    required this.author,
    required this.description,
    required this.publication,
    required this.status,
    required this.imageUrl,
    this.isFavourite = false,
  });
}