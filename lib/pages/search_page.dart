import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:newapp/constants/constants.dart';
import 'package:newapp/http/custom_http.dart';
import 'package:newapp/model/news_model.dart';
import 'package:newapp/pages/news_details.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  TextEditingController searchController = TextEditingController();
  NewsModel? newsModel;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("🄰🄱🄲 🄽🄴🅆🅂", style: TextStyle(color: Colors.white),),
          titleTextStyle: TextStyle(
              color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
          elevation: 5,
          backgroundColor: newsTitleColor,
          centerTitle: true,
          iconTheme: IconThemeData(color: Colors.white),
          actions: [
            Icon(Icons.person_2_outlined, size: 28,),
          ],
        ),
        body: Container(
          padding: EdgeInsets.all(15),
          child: SingleChildScrollView(
            child: Column(
              children: [
                TextFormField(
                  controller: searchController,
                  onEditingComplete:()async{
                    newsModel=await CustomeHttpRequest.fetchSearchData(searchController.text);
                    setState(() {

                    });
                  } ,
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.search),
                      hintText: "Search",
                      suffix: IconButton(
                        onPressed: () {
                          searchController.clear();
                          newsModel!.articles!.clear();
                          setState(() {
                          });

                        },
                        icon: Icon(Icons.cancel_outlined),
                      )),
                ),
                SizedBox(
                  height: 15,
                ),
                MasonryGridView.count(
                  shrinkWrap: true,
                  itemCount: searchKeyword.length,
                  crossAxisCount: 4,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: ()async{
                        searchController.text=searchKeyword[index];
                        newsModel=await CustomeHttpRequest.fetchSearchData(searchKeyword[index]);
                        setState(() {

                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all()),
                        padding:
                        EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                        child: Text("${searchKeyword[index]}"),
                      ),
                    );
                  },
                ),
                SizedBox(height: 20,),

                newsModel?.articles ==null? SizedBox(height: 0,):   ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: (){
                        Navigator.of(context).push(MaterialPageRoute(builder: (context)=>NewsDetails(
                          articles: newsModel!.articles![index],
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
                                "${newsModel!.articles![index].urlToImage}",
                                errorWidget: (context, url, error) => Image.network(
                              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTOmYqa4Vpnd-FA25EGmYMiDSWOl9QV8UN1du_duZC9mQ&s"),
                                fit: BoxFit.cover,
                                width: double.infinity,
                                height: MediaQuery.of(context).size.height * 0.30,
                              ),
                              Text(
                                "${newsModel!.articles![index].title}",
                                style: myStyle(22, Colors.black, FontWeight.bold),
                                maxLines: 2,
                              ),
                              Divider(thickness: 2, color: newsTitleColor,)
                            ],
                          )),
                    );
                  },
                  itemCount: newsModel!.articles!.length,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  List<String> searchKeyword = [
    "World",
    "Health",
    "Finance",
    "Football",
    "Cricket",
    "Sports",
    "Politics",
    "Pepsi"
  ];
}
