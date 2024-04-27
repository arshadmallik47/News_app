import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_app/models/news_channel_headlines_model.dart';

class NewsRepository {
  Future<NewsChannelsHeadlinesModel> fetchNewsChannelHeadlinesApi() async {
    var url =
        'https://newsapi.org/v2/top-headlines?sources=bbc-news&apiKey=cc186411735643798befec48f3282536';
    final response = await http.get(
      Uri.parse(url),
    );
    print(response.body);
    if (response.statusCode == 200) {
      final body = jsonDecode(response.body);
      return NewsChannelsHeadlinesModel.fromJson(body);
    }
    throw Exception('ERROR');
  }
}
