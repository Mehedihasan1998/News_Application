import 'package:flutter/material.dart';
import 'package:newapp/pages/home.dart';
import 'package:newapp/pages/home_page.dart';
import 'package:newapp/pages/home_structure.dart';
import 'package:newapp/provider/news_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_)=>NewsProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blueGrey,
          scaffoldBackgroundColor: Colors.white
        ),
        home: HomeStructure(),
      ),
    );
  }
}