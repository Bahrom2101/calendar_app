import 'package:calendar/src/data/api/api_client.dart';
import 'package:flutter/foundation.dart';

class NewsRepository {
  NewsRepository._();

  static NewsRepository get instance => NewsRepository._();

  final ApiClient _apiClient = ApiClient.instance;

  Future<dynamic> getNews(int limit, int page) async {
    try {
      return await _apiClient.getPosts(limit, page);
    } catch(e, s) {
      debugPrint('e: $e');
      debugPrint('s: $s');
      return e;
    }
  }
}