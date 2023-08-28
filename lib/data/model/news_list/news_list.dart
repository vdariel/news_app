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

  @override
  String toString() {
    return "{\"total\": $totalResults, \"status\": \"$status\", \"articles\": [${articles.map((e) => e.toString())}}]}";
  }
}

class Article {
  String author;
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

  @override
  String toString() {
    return "{\"author\": \"$author\", \"title\": \"$title\", \"published_at\": \"$publishedAt\"}";
  }

  factory Article.fromJson(dynamic json) {
    return Article(
      author: json['author'] ?? '',
      title: json['title'],
      description: json['description'],
      url: json['url'],
      publishedAt: json['published_at'] != null
          ? DateTime.parse(json['published_at'])
          : null,
    );
  }
}
