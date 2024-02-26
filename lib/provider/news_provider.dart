import 'package:flutter/material.dart';
import 'package:newapp/http/custom_http.dart';
import 'package:newapp/model/news_model.dart';
import 'package:provider/provider.dart';

class NewsProvider with ChangeNotifier{

  NewsModel? newsModel;
  Future<NewsModel> getNewsData(int pageNo,String sortBy)async{
    newsModel=await CustomeHttpRequest.fetchHomeData(pageNo,sortBy);
    return newsModel!;
  }
  Future<NewsModel> getTechnoData(int pageNo,String sortBy)async{
    newsModel=await CustomeHttpRequest.fetchTechData(pageNo,sortBy);
    return newsModel!;
  }
  Future<NewsModel> getGameData(int pageNo,String sortBy)async{
    newsModel=await CustomeHttpRequest.fetchSportsData(pageNo,sortBy);
    return newsModel!;
  }
  Future<NewsModel> getPoliticData(int pageNo,String sortBy)async{
    newsModel=await CustomeHttpRequest.fetchPoliticsData(pageNo,sortBy);
    return newsModel!;
  }
  Future<NewsModel> getHealthRelatedData(int pageNo,String sortBy)async{
    newsModel=await CustomeHttpRequest.fetchHealthData(pageNo,sortBy);
    return newsModel!;
  }
  Future<NewsModel> getScienceData(int pageNo,String sortBy)async{
    newsModel=await CustomeHttpRequest.fetchScientificData(pageNo,sortBy);
    return newsModel!;
  }

}

