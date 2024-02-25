import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

String maleAvaterImage = "https://static.vecteezy.com/system/resources/previews/024/183/535/original/male-avatar-portrait-of-a-young-man-with-glasses-illustration-of-male-character-in-modern-color-style-vector.jpg";
String newsImage = "https://images.pexels.com/photos/935979/pexels-photo-935979.jpeg?cs=srgb&dl=pexels-nappy-935979.jpg&fm=jpg";
Color appBarColor = Colors.blueGrey;

Color newsTitleColor = Colors.redAccent;
double newsTitleFontSize = 25;
double appTitleFontSize = 22;


myStyle(double fs, [Color ?clr, FontWeight ?fw]){
  return GoogleFonts.poppins(
    fontSize: fs,
    color: clr,
    fontWeight: fw,
  );
}