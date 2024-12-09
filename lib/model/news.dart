class ArticleModel {
  //from news api
  final String title;
  final String description;
  final String author;
  final String url;
  final String date;
  final String image;

  ArticleModel({
    required this.title,
    required this.description,
    required this.author,
    required this.url,
    required this.date,
    required this.image,
  });

  factory ArticleModel.fromJson(Map<String, dynamic> json) {
    return ArticleModel(
      title: json['title'] ?? 'No Title', // Default if null
      description: json['description'] ?? 'No Description',
      author: json['author'] ?? 'Anonymous',
      url: json['url'] ?? '',
      date: json['publishedAt'] ?? '',
      image: json['urlToImage'] ?? '', // Default to empty string
    );
  }
}
