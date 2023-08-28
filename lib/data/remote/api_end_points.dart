class ApiEndPoints {
  final String getNewsList = 'v1/news';

  static final ApiEndPoints _singleton = ApiEndPoints._internal();

  factory ApiEndPoints() => _singleton;

  ApiEndPoints._internal();
}
