import 'dart:convert';
import 'package:http/http.dart' as http;

import '../models/article_model.dart';

class APIService {
  final String _baseUrl = 'api.nytimes.com';
  static const String API_KEY = 'Avzl9UST9rGOVNN2uPggnLZfPyZFqdz7';

  Future<List<Article>> fetchArticlesBySection(String section) async {
    Map<String, dynamic> parameters = {
      'api-key': API_KEY,
    };
    var uri = Uri.https(
      _baseUrl,
      '/svc/topstories/v2/$section.json',
      parameters,
    );
    try {
      var response = await http.get(uri);
      Map<String, dynamic> data = json.decode(response.body);
      List<Article> articles = [];
      data['results'].forEach(
        (articleMap) => articles.add(Article.fromMap(articleMap)),
      );
      return articles;
    } catch (err) {
      throw err.toString();
    }
  }
}
