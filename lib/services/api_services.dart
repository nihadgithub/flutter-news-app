import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:news_app/model/model.dart';


class ApiService{
  Future<List<Article>> getArticle() async{
    final url = "https://newsapi.org/v2/everything?q=bitcoin&apiKey=ca10a072e8dd446cb29f67d45a6e4721";
    var response = await http.get(Uri.parse(url));
    if(response.statusCode == 200){

      var body = json.decode(response.body);
      List<Article> _data = List<Article>.from(
        body['articles'].map((e) => Article.fromJson(e)).toList()
      );
      return _data;
    }else{
      List<Article> _data = [];
      return _data;
    }
  }
}