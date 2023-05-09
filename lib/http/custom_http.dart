import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:newapp/model/news_model.dart';


class CustomeHttpRequest {
  static Future<NewsModel> fetchHomeData(int pageNo,String sortBy) async {
    NewsModel? newsModel;
    try{
      String url = "https://newsapi.org/v2/everything?q=football&sortBy=$sortBy&pageSize=10&page=$pageNo&apiKey=dae4eb4267724b77b9831c0f448decaa";

      var responce = await http.get(Uri.parse(url));
      var data = jsonDecode(responce.body);
      print("our responce is ${data}");
      newsModel = NewsModel.fromJson(data);
      return newsModel!;
    }
    catch(e){
      print("Something is wrong,  $e");
      return newsModel!;
    }
  }


  static Future<NewsModel> fetchSearchData(String query) async {
    NewsModel? newsModel;
    try{
      String url = "https://newsapi.org/v2/everything?q=$query&pageSize=25&apiKey=dae4eb4267724b77b9831c0f448decaa";

      var responce = await http.get(Uri.parse(url));
      var data = jsonDecode(responce.body);
      print("our responce is ${data}");
      newsModel = NewsModel.fromJson(data);
      return newsModel!;
    }
    catch(e){
      print("Something is wrong,  $e");
      return newsModel!;
    }
  }
}
// added a new comment