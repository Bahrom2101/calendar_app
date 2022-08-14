import 'dart:convert';

import 'package:calendar/src/core/constants/constants.dart';
import 'package:calendar/src/data/models/Colors_response.dart';
import 'package:calendar/src/data/models/news.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ApiClient {

  ApiClient._();

  static ApiClient get instance => ApiClient._();

  Future<dynamic> getPosts(int limit, int page) async {
    String url = '${Constants.baseUrl}/posts?_limit=$limit&_page=$page';
    debugPrint(url);
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      var rest = data as List;
      return rest.map<News>((json) => News.fromJson(json)).toList();
    } else {
      return Exception('Failed to load posts');
    }
  }

  Future<dynamic> getColors() async {
    String url = '${Constants.baseUrlColor}/b/JZON';
    debugPrint(url);
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      var rest = ColorsResponse.fromJson(data);
      return rest;
    } else {
      return Exception('Failed to load posts');
    }
  }
}