import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:newapp/constants/constants.dart';
import 'package:newapp/custom_widgets/custom_drawer.dart';
import 'package:newapp/model/news_model.dart';
import 'package:newapp/pages/news_details.dart';
import 'package:newapp/provider/news_provider.dart';
import 'package:provider/provider.dart';
class CategoriesPage extends StatefulWidget {
  const CategoriesPage({super.key});

  @override
  State<CategoriesPage> createState() => _CategoriesPageState();
}

class _CategoriesPageState extends State<CategoriesPage> {
  String sortBy = "publishedAt";
  int pageNo = 1;
  int counter = 1;

  @override
  Widget build(BuildContext context) {
    var newsProvider = Provider.of<NewsProvider>(context);
    return SafeArea(
        child: DefaultTabController(
          length: 6,
          initialIndex: 0,
          child: Scaffold(
            drawer: CustomDrawer(),
            appBar: AppBar(
              title: Text("🄰🄱🄲 🄽🄴🅆🅂", style: TextStyle(color: Colors.white),),
              titleTextStyle: TextStyle(
                  color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
              elevation: 5,
              backgroundColor: newsTitleColor,
              centerTitle: true,
              iconTheme: IconThemeData(color: Colors.white),
              actions: [
                Icon(Icons.notifications_none_outlined)
              ],
            ),
            body: Column(
              children: [
                TabBar(
                  isScrollable: true,
                    indicatorColor: Colors.purple,
                    tabs: [
                      Tab(
                        // icon: Icon(Icons.home, color: Colors.deepPurple,),
                        child: Text("Breaking News"),
                      ),
                      Tab(
                        // icon: Icon(Icons.search, color: Colors.deepPurple,),
                        child: Text("Technology"),
                      ),
                      Tab(
                        // icon: Icon(Icons.category, color: Colors.deepPurple,),
                        child: Text("Sports"),
                      ),
                      Tab(
                        // icon: Icon(Icons.category, color: Colors.deepPurple,),
                        child: Text("Politics"),
                      ),
                      Tab(
                        // icon: Icon(Icons.category, color: Colors.deepPurple,),
                        child: Text("Health"),
                      ),
                      Tab(
                        // icon: Icon(Icons.category, color: Colors.deepPurple,),
                        child: Text("Science"),
                      ),
                    ]
                ),
                Expanded(
                    child: TabBarView(
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
                              return ListView.builder(
                                shrinkWrap: true,
                                itemBuilder: (context, index) {
                                  return InkWell(
                                    onTap: (){
                                      Navigator.of(context).push(MaterialPageRoute(builder: (context)=>NewsDetails(
                                        articles: snapshot.data!.articles![index],
                                      )));
                                    },
                                    child: Container(
                                        margin: EdgeInsets.all(10),
                                        padding: EdgeInsets.all(10),
                                        height: MediaQuery.of(context).size.height * 0.45,
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
                                            ),
                                            Divider(thickness: 2, color: newsTitleColor,)
                                          ],
                                        )),
                                  );
                                },
                                itemCount: snapshot.data!.articles!.length,
                              );
                            },
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
                                shrinkWrap: true,
                                itemBuilder: (context, index) {
                                  return InkWell(
                                    onTap: (){
                                      Navigator.of(context).push(MaterialPageRoute(builder: (context)=>NewsDetails(
                                        articles: snapshot.data!.articles![index],
                                      )));
                                    },
                                    child: Container(
                                        margin: EdgeInsets.all(10),
                                        padding: EdgeInsets.all(10),
                                        height: MediaQuery.of(context).size.height * 0.45,
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
                                            ),
                                            Divider(thickness: 2, color: newsTitleColor,)
                                          ],
                                        )),
                                  );
                                },
                                itemCount: snapshot.data!.articles!.length,
                              );
                            },
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
                                shrinkWrap: true,
                                itemBuilder: (context, index) {
                                  return InkWell(
                                    onTap: (){
                                      Navigator.of(context).push(MaterialPageRoute(builder: (context)=>NewsDetails(
                                        articles: snapshot.data!.articles![index],
                                      )));
                                    },
                                    child: Container(
                                        margin: EdgeInsets.all(10),
                                        padding: EdgeInsets.all(10),
                                        height: MediaQuery.of(context).size.height * 0.45,
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
                                            ),
                                            Divider(thickness: 2, color: newsTitleColor,)
                                          ],
                                        )),
                                  );
                                },
                                itemCount: snapshot.data!.articles!.length,
                              );
                            },
                          ),
                          FutureBuilder<NewsModel>(
                            future: newsProvider.getPoliticData(pageNo, sortBy),
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
                                shrinkWrap: true,
                                itemBuilder: (context, index) {
                                  return InkWell(
                                    onTap: (){
                                      Navigator.of(context).push(MaterialPageRoute(builder: (context)=>NewsDetails(
                                        articles: snapshot.data!.articles![index],
                                      )));
                                    },
                                    child: Container(
                                        margin: EdgeInsets.all(10),
                                        padding: EdgeInsets.all(10),
                                        height: MediaQuery.of(context).size.height * 0.45,
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
                                            ),
                                            Divider(thickness: 2, color: newsTitleColor,)
                                          ],
                                        )),
                                  );
                                },
                                itemCount: snapshot.data!.articles!.length,
                              );
                            },
                          ),
                          FutureBuilder<NewsModel>(
                            future: newsProvider.getHealthRelatedData(pageNo, sortBy),
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
                                shrinkWrap: true,
                                itemBuilder: (context, index) {
                                  return InkWell(
                                    onTap: (){
                                      Navigator.of(context).push(MaterialPageRoute(builder: (context)=>NewsDetails(
                                        articles: snapshot.data!.articles![index],
                                      )));
                                    },
                                    child: Container(
                                        margin: EdgeInsets.all(10),
                                        padding: EdgeInsets.all(10),
                                        height: MediaQuery.of(context).size.height * 0.45,
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
                                            ),
                                            Divider(thickness: 2, color: newsTitleColor,)
                                          ],
                                        )),
                                  );
                                },
                                itemCount: snapshot.data!.articles!.length,
                              );
                            },
                          ),
                          FutureBuilder<NewsModel>(
                            future: newsProvider.getScienceData(pageNo, sortBy),
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
                                shrinkWrap: true,
                                itemBuilder: (context, index) {
                                  return InkWell(
                                    onTap: (){
                                      Navigator.of(context).push(MaterialPageRoute(builder: (context)=>NewsDetails(
                                        articles: snapshot.data!.articles![index],
                                      )));
                                    },
                                    child: Container(
                                        margin: EdgeInsets.all(10),
                                        padding: EdgeInsets.all(10),
                                        height: MediaQuery.of(context).size.height * 0.45,
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
                                            ),
                                            Divider(thickness: 2, color: newsTitleColor,)
                                          ],
                                        )),
                                  );
                                },
                                itemCount: snapshot.data!.articles!.length,
                              );
                            },
                          ),
                        ]))
              ],
            ),
          ),
        )
    );
  }
}
