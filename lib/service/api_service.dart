import 'dart:convert';
import 'dart:developer';

import 'package:bharat_nxt_assignment/model/article_model.dart';
import 'package:http/http.dart' as http;

class ApiService {
  Future<List<ArticleModel>> fetchArtciles() async {
    try {
      final url = "https://jsonplaceholder.typicode.com/posts";
      final response = await http.get(Uri.parse(url));
      var decodedResponse = jsonDecode(response.body);
      if (response.statusCode == 200) {
        return List.from(decodedResponse.map((e) => ArticleModel.fromMap(e)));
      }
    } catch (e) {
      log(e.toString());
    }
    return [];
  }
}
