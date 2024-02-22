import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:newapp/constants/constants.dart';
import 'package:newapp/model/news_model.dart';
import 'package:newapp/provider/news_provider.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String sortBy = "publishedAt";
  int pageNo = 1;
  int counter = 1;

  @override
  Widget build(BuildContext context) {
    var newsProvider = Provider.of<NewsProvider>(context);
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: Text("First Light News"),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          FutureBuilder<NewsModel>(
            future: newsProvider.getNewsData(pageNo, sortBy),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else if (snapshot.hasError) {
                return Text("Something is wrong");
              } else if (snapshot.data == null) {
                return Text("snapshot data are null");
              }
              return Container(
                height: MediaQuery.of(context).size.height * 0.3,
                width: double.infinity,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: EdgeInsets.all(10),
                      padding: EdgeInsets.all(10),
                      height: MediaQuery.of(context).size.height * 0.29,
                      width: MediaQuery.of(context).size.width * 0.8,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: snapshot.data!.articles![index].urlToImage == null? NetworkImage("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTOmYqa4Vpnd-FA25EGmYMiDSWOl9QV8UN1du_duZC9mQ&s",) :
                              NetworkImage(
                                  "${snapshot.data!.articles![index].urlToImage}"),
                              fit: BoxFit.cover)),
                      child: Align(
                          alignment: Alignment.bottomCenter,
                          child: Text(
                            "${snapshot.data!.articles![index].title}",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: titleFontSize,
                                fontWeight: FontWeight.bold),
                            maxLines: 2,
                          )),
                    );
                  },
                  itemCount: snapshot.data!.articles!.length,
                ),
              );
            },
          ),
          ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return Container(
                margin: EdgeInsets.all(10),
                height: MediaQuery.of(context).size.height * 0.2,
                width: double.infinity,
                color: Colors.tealAccent,
              );
            },
            itemCount: 5,
          ),
        ],
      ),
    ));
  }
}
