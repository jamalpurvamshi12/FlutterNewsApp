import 'dart:convert';
import 'package:news_app1/Articles.dart';
import 'package:http/http.dart' as http;

class GetArticles {
  List<Article> listofarticles = [];
  final String category;
  GetArticles({this.category});

  Future<void> getNews() async
  {

    String url = "https://newsapi.org/v2/top-headlines?country=in&apiKey=9e89d724887046ad8aedaa06d4b4bf23";
    String url2 = "http://newsapi.org/v2/top-headlines?country=in&category=$category&apiKey=9e89d724887046ad8aedaa06d4b4bf23";

    var response;

    if (category == null) {
      response = await http.get(url);
    }
    else{
      response = await http.get(url2);
   }

    print("printing category");
    print(category);

    var jsonData = jsonDecode(response.body);

    if (jsonData['status'] == "ok") {
      jsonData["articles"].forEach((element) {
        if (element['urlToImage'] != null && element['description'] != null) {
          Article article = Article(
            title: element['title'],
            author: element['author'],
            description: element['description'],
            urlToImage: element['urlToImage'],
            content: element["content"],
            url: element["url"],
          );
          listofarticles.add(article);
        }
      });
    }
  }
}

