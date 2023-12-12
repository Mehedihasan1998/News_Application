import 'package:flutter/material.dart';
import 'package:newapp/http/custom_http.dart';
import 'package:newapp/model/news_model.dart';

class NewsProvider with ChangeNotifier{

  NewsModel? newsModel;
  Future<NewsModel> getNewsData(int pageNo)async{
    newsModel=await CustomeHttpRequest.fetchHomeData(pageNo);
    return newsModel!;
  }

}

