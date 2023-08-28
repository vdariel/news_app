abstract class BaseApiService {
  final String baseUrl = '';
  final String apiKey = '';

  Future<dynamic> getAllNewsResponse(String url, String category);
}
