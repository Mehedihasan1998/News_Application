import 'package:flutter/material.dart';
import 'package:flutter_share/flutter_share.dart';
import 'package:newapp/model/news_model.dart';

class NewsDetails extends StatelessWidget {
  NewsDetails({Key? key,this.articles}) : super(key: key);

  Articles ?articles;


  Future<void> share() async {
    await FlutterShare.share(
        title: 'Example share',
        text: 'Example share text',
        linkUrl: '${articles!.url}',
        chooserTitle: 'Example Chooser Title'
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${articles!.source!.name ?? ""}"),
        actions: [
          IconButton(onPressed: (){
            share();
          }, icon: Icon(Icons.share))
        ],
      ),
      body: Column(
        children: [
          Text("${articles!.description}"),
          Image.network('${articles!.urlToImage}'),
        ],
      ),
    );
  }
}
