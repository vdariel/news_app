class NewsListMain {
  final String status;
  final String message;
  final int totalResults;

  NewsListMain(
      {required this.status,
      required this.message,
      required this.totalResults});

  factory NewsListMain.fromJson(Map<String, dynamic> json) {
    return NewsListMain(
      status: json['status'] ?? '',
      message: json['message'] ?? '',
      totalResults: json['pagination']['total'] ?? 0,
    );
  }
}

class Article {}
