import 'package:news_app/models/categories_news_model.dart';
import 'package:news_app/models/news_channel_headlines_model.dart';
import 'package:news_app/repository/news_repository.dart';

class NewsViewModel {
  final _rep = NewsRepository();

  Future<NewsChannelsHeadlinesModel> fetchNewsChannelHeadlinesApi(
      String newsChannel) async {
    final response = await _rep.fetchNewsChannelHeadlinesApi(newsChannel);
    return response;
  }

  //fetch category
  Future<CategoriesNewsModel> fetchCategoryNewsApi(String category) async {
    final response = await _rep.fetchCategoryNewsApi(category);
    return response;
  }
}
