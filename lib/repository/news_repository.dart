import 'package:http/http.dart' as http;

class NewsRepository {
  Future<void> fetchNewsChannelHeadlinesApi() async {
    var url =
        'https://newsapi.org/v2/top-headlines?sources=bbc-news&apiKey=cc186411735643798befec48f3282536';
    http.get(
      Uri.parse(url),
    );
  }
}
