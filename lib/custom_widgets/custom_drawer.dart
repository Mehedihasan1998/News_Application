import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:newapp/constants/constants.dart';
import 'package:newapp/pages/categories.dart';
import 'package:newapp/pages/profile%20page.dart';
import 'package:newapp/pages/search_page.dart';
class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: newsTitleColor,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
              accountName: const Text("Md. Mehedi Hasan", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),),
              accountEmail: const Text("mehedi5477@gmail.com", style: TextStyle(fontSize: 15, color: Colors.white, fontWeight: FontWeight.bold),),
            currentAccountPicture: CircleAvatar(
              child: ClipOval(
                child: Image.network("${maleAvaterImage}",),
              ),
            ),
            decoration: BoxDecoration(
              color: Color(0xff512DA8),
            image: DecorationImage(image: NetworkImage("${newsImage}",), fit: BoxFit.cover),
            ),
          ),
          ListTile(
            leading: Icon(Icons.person_2_outlined, color: Colors.white,),
            title: Text("Profile", style: TextStyle(color: Colors.white),),
            onTap: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (builder)=>ProfilePage()));
            },
          ),
          ListTile(
            leading: Icon(Icons.settings, color: Colors.white,),
            title: Text("Settings", style: TextStyle(color: Colors.white)),
          ),
          ListTile(
            leading: Icon(Icons.search, color: Colors.white,),
            title: Text("Search", style: TextStyle(color: Colors.white)),
            onTap: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (builder)=>SearchPage()));
            },
          ),
          ListTile(
            leading: Icon(Icons.share, color: Colors.white,),
            title: Text("Share", style: TextStyle(color: Colors.white)),
          ),
          ListTile(
            leading: Icon(Icons.notifications_none_outlined, color: Colors.white,),
            title: Text("Notifications", style: TextStyle(color: Colors.white)),
          ),
          ListTile(
            leading: Icon(Icons.history, color: Colors.white,),
            title: Text("History" ,style: TextStyle(color: Colors.white)),
          ),
          ListTile(
            leading: Icon(Icons.category_outlined, color: Colors.white,),
            title: Text("Category" ,style: TextStyle(color: Colors.white)),
            onTap: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (builder)=>CategoriesPage()));
            },
          ),
          ListTile(
            leading: Icon(Icons.logout, color: Colors.white,),
            title: Text("Log out", style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }
}
