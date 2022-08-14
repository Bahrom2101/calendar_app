import 'package:calendar/src/data/api/api_client.dart';
import 'package:flutter/foundation.dart';

class HomeRepository {
  HomeRepository._();

  static HomeRepository get instance => HomeRepository._();

  final ApiClient _apiClient = ApiClient.instance;

  Future<dynamic> getColors() async {
    try {
      return await _apiClient.getColors();
    } catch(e, s) {
      debugPrint('e: $e');
      debugPrint('s: $s');
      return e;
    }
  }
}