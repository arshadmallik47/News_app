import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_app/models/categories_news_model.dart';
import 'package:news_app/models/news_channel_headlines_model.dart';

class NewsRepository {
  Future<NewsChannelsHeadlinesModel> fetchNewsChannelHeadlinesApi(
      String newsChannel) async {
    var url =
        'https://newsapi.org/v2/top-headlines?sources=$newsChannel&apiKey=cc186411735643798befec48f3282536';
    final response = await http.get(
      Uri.parse(url),
    );
    // print(response.body);
    if (response.statusCode == 200) {
      final body = jsonDecode(response.body);
      return NewsChannelsHeadlinesModel.fromJson(body);
    }
    throw Exception('ERROR');
  }

  // Fetch category
  Future<CategoriesNewsModel> fetchCategoryNewsApi(String category) async {
    var url =
        'https://newsapi.org/v2/everything?q=${category}&apiKey=cc186411735643798befec48f3282536';
    final response = await http.get(
      Uri.parse(url),
    );
    print(response.body);
    if (response.statusCode == 200) {
      final body = jsonDecode(response.body);
      return CategoriesNewsModel.fromJson(body);
    }
    throw Exception('ERROR');

    //https://newsapi.org/v2/everything?q=bitcoin&apiKey=cc186411735643798befec48f3282536
  }
}
