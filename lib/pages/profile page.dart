import 'package:flutter/material.dart';
import 'package:newapp/constants/constants.dart';
import 'package:newapp/pages/search_page.dart';
class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

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
              Icon(Icons.notifications_none_outlined)
            ],
          ),
          body: Container(
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar(
                  maxRadius: 70,
                  child: ClipOval(
                    child: Image.network("${maleAvaterImage}",),
                  ),
                ),
                RichText(
                  text: TextSpan(
                    text: 'Name: ',
                    style: myStyle(newsDescriptionSize, newsTitleColor, FontWeight.bold), /*defining default style is optional */
                    children: <TextSpan>[
                      TextSpan(
                          text: 'Md. Mehedi Hasan',
                          style: myStyle(newsDescriptionSize, Colors.black)),
                    ],
                  ),
                ),
                RichText(
                  text: TextSpan(
                    text: 'Email: ',
                    style: myStyle(newsDescriptionSize, newsTitleColor, FontWeight.bold), /*defining default style is optional */
                    children: <TextSpan>[
                      TextSpan(
                          text: 'mehedi5477@gmail.com',
                          style: myStyle(newsDescriptionSize, Colors.black)),
                    ],
                  ),
                ),
                const SizedBox(height: 15,),
                MaterialButton(
                  onPressed: (){},
                  color: newsTitleColor,
                  minWidth: MediaQuery.of(context).size.width*0.9,
                  padding: EdgeInsets.all(10),
                  child: Text("Log out", style: myStyle(newsDescriptionSize, Colors.white, FontWeight.bold),),
                )


              ],
            ),
          ),
        ));
  }
}
