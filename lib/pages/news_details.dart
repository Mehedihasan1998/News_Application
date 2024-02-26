import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_share/flutter_share.dart';
import 'package:newapp/constants/constants.dart';
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
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("🄰🄱🄲 🄽🄴🅆🅂", style: TextStyle(color: Colors.white),),
          backgroundColor: newsTitleColor,
          titleTextStyle: TextStyle(
              color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold
          ),
          centerTitle: true,
          leading: IconButton(onPressed: (){
            Navigator.pop(context);
          }, icon: Icon(Icons.arrow_back_rounded)),
          iconTheme: IconThemeData(color: Colors.white),
          actions: [
            IconButton(onPressed: (){
              share();
            }, icon: Icon(Icons.share)),
          ],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("${articles!.title}", style: myStyle(descriptionTitleFontSize,Colors.black, FontWeight.bold),),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  child: Row(
                    children: [
                      Icon(Icons.timer_outlined, color: newsTitleColor,),
                      Text("  ${articles!.publishedAt}", style: myStyle(newsImageDescriptionSize),),
                    ],
                  ),
                ),
                articles!.urlToImage == null? Image.network(
                    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTOmYqa4Vpnd-FA25EGmYMiDSWOl9QV8UN1du_duZC9mQ&s",):
                Image.network('${articles!.urlToImage}'),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Container(color: newsTitleColor, height: MediaQuery.of(context).size.height*0.09,width: 2,),
                          Container(
                            height: MediaQuery.of(context).size.height*0.1,
                              width: MediaQuery.of(context).size.width*0.88,
                              padding: EdgeInsets.all(10),
                              child: Text("${articles!.description}",
                                style: myStyle(newsImageDescriptionSize, Colors.black, FontWeight.w400),
                                maxLines: 3,)),
                        ],
                      ),
                      SizedBox(height: 10,),
                      Text("By ${articles!.author}", style: myStyle(newsDescriptionSize, Colors.black, FontWeight.bold)),
                      Text("ABC News",style: myStyle(14, Colors.black,)),
                      Divider(color: newsTitleColor,thickness: 2,),
                      SizedBox(height: 10,),
                      Text("${articles!.content}",style: myStyle(newsDescriptionSize)),
                      SizedBox(height: 50),
                      Text("${articles!.content} ${articles!.content} ${articles!.content}",style: myStyle(newsDescriptionSize) ),
                      SizedBox(height: 50,),
                      Text("${articles!.content} ${articles!.content}",style: myStyle(newsDescriptionSize)),
                      SizedBox(height: 50,),
                      Text("${articles!.content} ${articles!.content} ${articles!.content}",style: myStyle(newsDescriptionSize)),
                      SizedBox(height: 50,),
                      Text("${articles!.content} ${articles!.content}",style: myStyle(newsDescriptionSize)),

                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
