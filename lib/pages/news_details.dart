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
          backgroundColor: Colors.red,
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
        // body: SingleChildScrollView(
        //   child: Stack(
        //     clipBehavior: Clip.none,
        //     children: [
        //       CachedNetworkImage(
        //         imageUrl: "${articles!.urlToImage}",
        //         fit: BoxFit.cover,
        //         height: MediaQuery.of(context).size.height * 0.5,
        //         width: double.infinity,
        //       ),
        //       Positioned(
        //         bottom: -MediaQuery.of(context).size.height * .49,
        //         child: Container(
        //           height: MediaQuery.of(context).size.height * 0.5,
        //           width: MediaQuery.of(context).size.width * 1,
        //           padding: EdgeInsets.all(10),
        //           decoration: BoxDecoration(
        //               color: Colors.white,
        //               borderRadius: BorderRadius.only(topRight: Radius.circular(15), topLeft: Radius.circular(15)),
        //           ),
        //           child: Column(
        //             children: [
        //               Text("${articles!.title}", style: TextStyle(fontSize: newsTitleFontSize,fontWeight: FontWeight.bold),),
        //               Divider(color: Colors.red,),
        //               Text("${articles!.description}", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),),
        //               Text("${articles!.description}", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),),
        //               Text("${articles!.description}", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),),
        //               Text("${articles!.description}", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),),
        //             ],
        //           ),
        //         ),
        //       ),
        //     ],
        //   ),
        // ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text("${articles!.title}", style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
              ),
              Image.network('${articles!.urlToImage}'),
          
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("${articles!.author}"),
                        SizedBox(width: 20,),
                        Text("${articles!.publishedAt}"),
                      ],
                    ),
                    Text("${articles!.description}", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),),
                    SizedBox(height: 10,),
                    Text("${articles!.content}"),
                    Text("${articles!.content}"),
                    Text("${articles!.content}"),
                    Text("${articles!.content}"),
                    Text("${articles!.content}"),
                    Text("${articles!.content}"),
                    InkWell(
                      onTap: (){},
                        child: Text("see more", style: TextStyle(color: Colors.blue,),)),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
