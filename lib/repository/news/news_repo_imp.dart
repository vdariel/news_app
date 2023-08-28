import 'package:news_app/data/remote/api_end_points.dart';
import 'package:news_app/data/remote/base_api_service.dart';
import 'package:news_app/data/remote/network_api_service.dart';
import 'package:news_app/repository/news/news_repo.dart';

class NewsRepoImp extends NewsRepo {
  final BaseApiService _apiService = NetworkApiService();
  static const int _pageSize = 25;

  @override
  Future getNewsData(String category) async {
    try {
      dynamic response = await _apiService.getAllNewsResponse(
          ApiEndPoints().getNewsList, category);
      return response;
    } catch (error) {
      rethrow;
    }
  }
}
