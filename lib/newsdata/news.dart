import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:mi_card/model/model.dart';

class News {
  List<ArticleModel> news = [];

  Future<void> getdata() async {
    const url =
        'https://newsapi.org/v2/top-headlines?country=in&apiKey=e40a1fefab044ee5af5ced06606005d0';
    var urlreal = Uri.parse(url);
    var response = await http.get(urlreal);

    var jsonData = jsonDecode(response.body);
    print(jsonData['articles']);

    if (jsonData['status'] == "ok") {
      jsonData["articles"].forEach((element) {
        if (element['urlToImage'] != null && element['description'] != null) {
          ArticleModel article = ArticleModel(
            headline: element['title'],
            content: element['description'],
            urltoimage: element['urlToImage'],
            source: element['source']['name'],
            published: DateTime.parse(element['publishedAt']),
            url: element['url'],
          );
          news.add(article);
        }
      });
    }
  }
}
