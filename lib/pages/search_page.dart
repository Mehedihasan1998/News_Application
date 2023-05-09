import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
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
        body: Container(
          padding: EdgeInsets.all(20),
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
                  height: 19,
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
                  itemCount: newsModel!.articles!.length,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context,index){
                    return InkWell(
                      onTap: (){
                        Navigator.of(context).push(MaterialPageRoute(builder: (context)=>NewsDetails(
                          articles: newsModel!.articles![index],
                        )));
                      },
                      child: Container(
                        color: Colors.white,
                        height: 130,
                        padding: const EdgeInsets.all(8.0),
                        child: Stack(
                          children: [
                            Container(
                              height: 60,
                              width: 60,
                              color: Colors.blueGrey,
                            ),
                            Positioned(
                              right: 0,
                              bottom: 0,
                              child: Container(
                                height: 50,
                                width: 50,
                                color: Colors.blueGrey,
                              ),
                            ),
                            Container(
                              color: Colors.white,
                              padding: EdgeInsets.all(14),
                              margin: EdgeInsets.all(14),
                              child: Row(
                                children: [
                                  Expanded(
                                    flex: 3,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(6),
                                      child: CachedNetworkImage(
                                        imageUrl:
                                        "${newsModel!.articles![index].urlToImage}",
                                        placeholder: (context, url) =>
                                            CircularProgressIndicator(),
                                        errorWidget: (context, url, error) =>
                                            Image.network(
                                                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTOmYqa4Vpnd-FA25EGmYMiDSWOl9QV8UN1du_duZC9mQ&s"),
                                      ),
                                      //Image(image: NetworkImage("${newsModel!.articles![index].urlToImage}",))
                                    ),
                                  ),
                                  SizedBox(
                                    width: 8,
                                  ),
                                  Expanded(
                                      flex: 10,
                                      child: Column(
                                        children: [
                                          Text(
                                            "${newsModel!.articles![index].title}",
                                            maxLines: 2,
                                          ),
                                          Text(
                                              "${newsModel!.articles![index].publishedAt}")
                                        ],
                                      ))
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  },
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
    "Bitcoin",
    "Football",
    "Cricket",
    "Sports",
    "Politics",
    "Pepsi"
  ];
}
