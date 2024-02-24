import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:newapp/constants/constants.dart';
import 'package:newapp/custom_widgets/custom_drawer.dart';
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
      drawer: CustomDrawer(),
      appBar: AppBar(
        title: Text("📰 News Paper"),
        titleTextStyle: TextStyle(
            color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold),
        elevation: 5,
        backgroundColor: Colors.blueGrey,
        centerTitle: true,
      ),
      body: ListView(
        children: [
          SizedBox(
            height: 10,
          ),
          Text(
            "🔹 BREAKING NEWS",
            style: myStyle(appTitleFontSize, newsTitleColor, FontWeight.bold),
          ),
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
                              image: snapshot
                                          .data!.articles![index].urlToImage ==
                                      null
                                  ? NetworkImage(
                                      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTOmYqa4Vpnd-FA25EGmYMiDSWOl9QV8UN1du_duZC9mQ&s",
                                    )
                                  : NetworkImage(
                                      "${snapshot.data!.articles![index].urlToImage}"),
                              fit: BoxFit.cover)),
                      child: Align(
                          alignment: Alignment.bottomCenter,
                          child: Text(
                            "${snapshot.data!.articles![index].title}",
                            style: myStyle(newsTitleFontSize, Colors.white,
                                FontWeight.bold),
                            maxLines: 4,
                          )),
                    );
                  },
                  itemCount: snapshot.data!.articles!.length,
                ),
              );
            },
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            "🔹 TECHNOLOGY",
            style: myStyle(appTitleFontSize, newsTitleColor, FontWeight.bold),
          ),
          FutureBuilder<NewsModel>(
            future: newsProvider.getTechnoData(pageNo, sortBy),
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
              return ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return Container(
                      margin: EdgeInsets.all(10),
                      padding: EdgeInsets.all(10),
                      height: MediaQuery.of(context).size.height * 0.4,
                      width: double.infinity,
                      color: Colors.white,
                      child: Column(
                        children: [
                          CachedNetworkImage(
                            imageUrl:
                                "${snapshot.data!.articles![index].urlToImage}",
                            errorWidget: (context, url, error) => Image.network(
                                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTOmYqa4Vpnd-FA25EGmYMiDSWOl9QV8UN1du_duZC9mQ&s"),
                            fit: BoxFit.cover,
                            width: double.infinity,
                            height: MediaQuery.of(context).size.height * 0.30,
                          ),
                          Text(
                            "${snapshot.data!.articles![index].title}",
                            style: myStyle(22, Colors.black, FontWeight.bold),
                            maxLines: 2,
                          )
                        ],
                      ));
                },
                itemCount: snapshot.data!.articles!.length,
              );
            },
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            "🔹 Sports",
            style: myStyle(appTitleFontSize, newsTitleColor, FontWeight.bold),
          ),
          FutureBuilder<NewsModel>(
            future: newsProvider.getGameData(pageNo, sortBy),
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
              return ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return Container(
                      margin: EdgeInsets.all(10),
                      padding: EdgeInsets.all(10),
                      height: MediaQuery.of(context).size.height * 0.4,
                      width: double.infinity,
                      color: Colors.white,
                      child: Column(
                        children: [
                          CachedNetworkImage(
                            imageUrl:
                                "${snapshot.data!.articles![index].urlToImage}",
                            errorWidget: (context, url, error) => Image.network(
                                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTOmYqa4Vpnd-FA25EGmYMiDSWOl9QV8UN1du_duZC9mQ&s"),
                            fit: BoxFit.cover,
                            width: double.infinity,
                            height: MediaQuery.of(context).size.height * 0.30,
                          ),
                          Text(
                            "${snapshot.data!.articles![index].title}",
                            style: myStyle(22, Colors.black, FontWeight.bold),
                            maxLines: 2,
                          )
                        ],
                      ));
                },
                itemCount: snapshot.data!.articles!.length,
              );
            },
          ),
        ],
      ),
    ));
  }
}
