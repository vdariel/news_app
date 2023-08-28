class NewsListMain {
  final String status;
  final String message;
  final int totalResults;
  final List<Article> articles;

  NewsListMain({
    required this.status,
    required this.message,
    required this.totalResults,
    required this.articles,
  });

  factory NewsListMain.fromJson(Map<String, dynamic> json) {
    final dataArticles = ((json['data'] ?? []) as List<dynamic>)
        .map((item) => Article.fromJson(item))
        .toList();

    return NewsListMain(
      status: json['status'] ?? '',
      message: json['message'] ?? '',
      totalResults: json['pagination']['total'] ?? 0,
      articles: dataArticles,
    );
  }
}

class Article {
  final String author;
  final String title;
  final String description;
  final String url;
  final DateTime? publishedAt;

  Article({
    required this.author,
    required this.title,
    required this.description,
    required this.url,
    this.publishedAt,
  });

  factory Article.fromJson(dynamic json) {
    return Article(
      author: json['author'] ?? '',
      title: json['title'],
      description: json['description'],
      url: json['url'],
      publishedAt:
          json['published_at'] ? DateTime.tryParse(json['published_at']) : null,
    );
  }
}
