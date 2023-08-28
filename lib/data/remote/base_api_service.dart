abstract class BaseApiService {
  final String baseUrl = 'api.mediastack.com';
  final String apiKey = '';

  Future<dynamic> getAllNewsResponse(String url, String category);
}
