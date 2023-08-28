abstract class BaseApiService {
  final String baseUrl = 'http://api.mediastack.com/';
  final String apiKey = '';

  Future<dynamic> getAllNewsResponse(String url, String category);
}
