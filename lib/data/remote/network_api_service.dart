import 'dart:convert';
import 'dart:io';

import 'package:news_app/data/remote/app_exception.dart';
import 'package:news_app/data/remote/base_api_service.dart';
import 'package:http/http.dart' as http;

class NetworkApiService extends BaseApiService {
  @override
  Future getAllNewsResponse(String url, String category) async {
    dynamic responseJson;
    try {
      dynamic query;
      if (category.isEmpty) {
        query = {'access_key': apiKey, 'countries': 'us'};
      } else {
        query = {
          'access_key': apiKey,
          'countries': 'us',
          'categories': category
        };
      }

      var uri = Uri.http(baseUrl, url, query);
      final response = await http.get(uri);
      responseJson = returnResponse(response);
    } catch (e) {
      if (e is AppException) {
        throw FetchDataException(e.toString());
      } else if (e is SocketException) {
        throw FetchDataException("Socket Exception ${e.toString()}");
      } else {
        throw FetchDataException("Something went wrong: ${e.toString()}");
      }
    }

    return responseJson;
  }

  dynamic returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        dynamic responseJson = jsonDecode(response.body);
        responseJson['status'] = response.statusCode == 200 ? 'ok' : 'error';
        return responseJson;
      case 400:
        throw BadRequestException(response.toString());
      case 401:
      case 403:
      case 404:
        dynamic responseJson = jsonDecode(response.body);
        throw UnauthorizedException(responseJson['message']);
      case 500:
      default:
        throw FetchDataException(
            'Error ocurred while communication with server with status code: ${response.statusCode}');
    }
  }
}
