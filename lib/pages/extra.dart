import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;
import 'package:newapp/model/article_model.dart';
class Extra extends StatefulWidget {
  const Extra({Key? key}) : super(key: key);

  @override
  State<Extra> createState() => _ExtraState();
}

class _ExtraState extends State<Extra> {

  List<ArticleModel> myList=[];
  ArticleModel ?articleModel;
  fetchData()async{
    try{
      var uri="https://newsapi.org/v2/top-headlines?country=us&apiKey=dae4eb4267724b77b9831c0f448decaa";
      var responce=await http.get(Uri.parse(uri));
      var data=jsonDecode(responce.body);
      for(var i in data["articles"]){
        articleModel=ArticleModel.fromJson(i);
        setState(() {
          myList.add(articleModel!);
        });
      }
    }catch(e){
      print("ahdfjkshdbkfbsdkjbv$e");
    }
  }
  @override
  void initState() {
    // TODO: implement initState
    fetchData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: ListView.builder(itemBuilder: (context,index){
          return Container(
            color: Colors.red,
            margin: EdgeInsets.only(bottom: 8),
            child: Text("${myList[index].source!.name}",style: TextStyle(fontSize: 25),),
          );
        },itemCount: myList.length,
          shrinkWrap: true,
        ),
      ),
    );
  }
}
