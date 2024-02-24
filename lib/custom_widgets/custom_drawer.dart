
import 'package:flutter/material.dart';
import 'package:newapp/constants/constants.dart';
class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      // backgroundColor: Color(0xff512DA8),
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
              accountName: const Text("Md. Mehedi Hasan", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),),
              accountEmail: const Text("mehedi5477@gmail.com", style: TextStyle(fontSize: 15, color: Colors.black),),
            currentAccountPicture: CircleAvatar(
              child: ClipOval(
                child: Image.network("${maleAvaterImage}"),
              ),
            ),
            decoration: BoxDecoration(
              color: Color(0xff512DA8),
            image: DecorationImage(image: NetworkImage("${newsImage}",), fit: BoxFit.cover),
            ),
          ),
          ListTile(
            leading: Icon(Icons.person_2_outlined, color: appBarColor,),
            title: Text("Profile",),
          ),
          ListTile(
            leading: Icon(Icons.settings, color: appBarColor,),
            title: Text("Settings",),
          ),
          ListTile(
            leading: Icon(Icons.share, color: appBarColor,),
            title: Text("Share"),
          ),
          ListTile(
            leading: Icon(Icons.notifications_none_outlined, color: appBarColor,),
            title: Text("Notifications"),
          ),
          ListTile(
            leading: Icon(Icons.history, color: appBarColor,),
            title: Text("History"),
          ),
          ListTile(
            leading: Icon(Icons.logout, color: appBarColor,),
            title: Text("Log out"),
          ),
        ],
      ),
    );
  }
}
