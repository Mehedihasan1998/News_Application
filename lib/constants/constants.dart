import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

String maleAvaterImage = "https://w7.pngwing.com/pngs/7/618/png-transparent-man-illustration-avatar-icon-fashion-men-avatar-face-fashion-girl-heroes-thumbnail.png";
String newsImage = "https://t4.ftcdn.net/jpg/03/00/85/23/360_F_300852364_qSrtNxY6pokaVR7er7knpb8AyYJSxtUd.jpg";
Color appBarColor = Colors.blueGrey;

Color newsTitleColor = Colors.black;
double newsTitleFontSize = 25;
double appTitleFontSize = 22;


myStyle(double fs, [Color ?clr, FontWeight ?fw]){
  return GoogleFonts.poppins(
    fontSize: fs,
    color: clr,
    fontWeight: fw,
  );
}