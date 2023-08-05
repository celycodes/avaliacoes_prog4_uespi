class ApodModel {
  final String? copyright;
  final String? date;
  final String? explanation;
  final String? mediaType;
  final String? title;
  final String? url;

  ApodModel({
    this.copyright,
    this.date,
    this.explanation,
    this.mediaType,
    this.title,
    this.url,
  });

  factory ApodModel.fromJson(Map<String, dynamic> json) {
    return ApodModel(
      copyright: json["copyright"] ?? "© Nasa",
      date: json["date"] ?? "",
      explanation: json["explanation"] ?? "",
      mediaType: json["media_type"] ?? "",
      title: json["title"] ?? "",
      url: (json["url"] as String).contains('.jpg')
            ? json["url"]
            : 'https://www.salonlfc.com/wp-content/uploads/2018/01/image-not-found-scaled.png',
    );
  }
}