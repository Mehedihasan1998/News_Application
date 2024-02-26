import 'package:flutter/material.dart';
import 'package:newapp/constants/constants.dart';
import 'package:newapp/pages/categories.dart';
import 'package:newapp/pages/home.dart';
import 'package:newapp/pages/profile%20page.dart';
import 'package:newapp/pages/search_page.dart';
class HomeStructure extends StatefulWidget {
  const HomeStructure({super.key});

  @override
  State<HomeStructure> createState() => _HomeStructureState();
}

class _HomeStructureState extends State<HomeStructure> {
  int _currentIndex = 0;
  final tabs = [
    HomeScreen(),
    SearchPage(),
    CategoriesPage(),
    ProfilePage(),
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          body: tabs[_currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: _currentIndex,
            backgroundColor: newsTitleColor,
            type: BottomNavigationBarType.fixed,
            selectedItemColor: Colors.white,
            unselectedItemColor: Colors.white60,
            selectedFontSize: 15,
            iconSize: 22,
            elevation: 5,
            // showUnselectedLabels: false,
            items: [
              BottomNavigationBarItem(
                label: "Home",
                icon: Icon(Icons.home),
              ),
              BottomNavigationBarItem(
                label: "Search",
                icon: Icon(Icons.search),
              ),
              BottomNavigationBarItem(
                label: "Categories",
                icon: Icon(Icons.category_outlined),
              ),
              BottomNavigationBarItem(
                label: "Profile",
                icon: Icon(Icons.person),
              ),
            ],
            onTap: (index){
              setState(() {
                _currentIndex = index;
              });
            },

          ),
        ),
    );
  }
}
