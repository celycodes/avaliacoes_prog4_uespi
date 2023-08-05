class MovieModel {
  final String imageUrl;
  final String titleType;
  final List<String> genres;
  final String titleText;
  final int releaseYear;
  final double ratingsSummary;
  final String plot;

  MovieModel({
    required this.imageUrl,
    required this.titleType,
    required this.genres,
    required this.titleText,
    required this.releaseYear,
    required this.ratingsSummary,
    required this.plot,
  });

  factory MovieModel.fromJson(Map<String, dynamic> json) {
    final primaryImage = json['primaryImage'] ??
        'https://www.salonlfc.com/wp-content/uploads/2018/01/image-not-found-scaled.png';
    final titleType = json['titleType']['text'] ?? '';
    final genres = List<String>.from(
        json['genres']['genres'].map((genre) => genre['text']) ?? []);
    final titleText = json['titleText']['text'] ?? '';
    final releaseYear = json['releaseYear']['year'] ?? 0;
    final ratingsSummary = (json['ratingsSummary'] != null &&
            json['ratingsSummary']['aggregateRating'] != null)
        ? json['ratingsSummary']['aggregateRating']
        : 0.0;
    final plot = (json['plot'] != null &&
            json['plot']['plotText'] != null &&
            json['plot']['plotText']['plainText'] != null)
        ? json['plot']['plotText']['plainText']
        : 'Synopsis is not found';

    return MovieModel(
      imageUrl: primaryImage['url'],
      titleType: titleType,
      genres: genres,
      titleText: titleText,
      releaseYear: releaseYear,
      plot: plot,
      ratingsSummary: ratingsSummary,
    );
  }
}