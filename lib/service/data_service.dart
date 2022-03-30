import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_app_flutter/model/articles.dart';

String apikey = 'b72fc2747e40422399924ccb118f0fc4';
String baseUrl = 'https://newsapi.org/v2/top-headlines';


//https://newsapi.org/v2/top-headlines?country=us&apiKey=b72fc2747e40422399924ccb118f0fc4

class News {
  Future<List<Article>?> getNews() async{
    List<Article>? list ;
    String url = '$baseUrl?country=id&apiKey=$apikey';
    var response = await http.get(Uri.parse(url));
    if (response.statusCode == 200){
      var data = jsonDecode(response.body);
      var result = data ['articles'] as List ;
      list = result.map<Article>((json) => Article.fromJson(json)).toList();
      print(response.body);
      return list;
    }else {
      throw Exception("Error can't acces this web");
    }
  }

  Future<List<Article>?> getNewsByCategory(String category) async{
    List<Article>? list ;
    String url = '$baseUrl?country=id&apiKey=$apikey&category=$category';
    var response = await http.get(Uri.parse(url));
    if (response.statusCode == 200){
      var data = jsonDecode(response.body);
      var result = data ['articles'] as List ;
      list = result.map<Article>((json) => Article.fromJson(json)).toList();
      print(response.body);
      return list;
    }else {
      throw Exception("Error can't acces this web");
    }
  }
  
}