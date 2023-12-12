import 'package:flutter/material.dart';
import 'package:flutter_share/flutter_share.dart';
import 'package:newapp/model/news_model.dart';
import 'package:newapp/pages/web_view_page.dart';

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
          // IconButton(onPressed: (){
          //   share();
          // }, icon: Icon(Icons.share))
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text("${articles!.title}", style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
          ),
          Image.network('${articles!.urlToImage}'),
          // Row(
          //   children: [
          //     Text("${articles!.author}"),
          //     SizedBox(width: 20,),
          //     Text("${articles!.publishedAt}"),
          //   ],
          // ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("${articles!.publishedAt}"),
                Text("${articles!.description}", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),),
                SizedBox(height: 10,),
                Text("${articles!.content}"),
                InkWell(

                    child: Text("see more", style: TextStyle(color: Colors.blue,),)),
              ],
            ),
          )
        ],
      ),
    );
  }
}
