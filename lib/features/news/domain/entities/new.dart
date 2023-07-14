class New {
  final String? author;
  final String title;
  final String description;
  final String url;
  final String imageUrl;
  final DateTime? publishedAt;
  final String content;

  const New(
      {this.author = "",
      this.title = "",
      this.description = "",
      this.url = "",
      this.imageUrl = "",
      this.publishedAt,
      this.content = ""});

  factory New.fromJson(Map<String, dynamic> json) {
    return New(
        author: json.containsKey('author') ? json['author'] ?? '' : '',
        title: json['title'] ?? '',
        description: json['description'] ?? '',
        url: json['url'] ?? '',
        imageUrl: json['urlToImage'] ?? '',
        publishedAt: DateTime.tryParse(json['publishedAt']),
        content: json['content'] ?? '');
  }
}
