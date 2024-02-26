import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

String maleAvaterImage = "https://static.vecteezy.com/system/resources/previews/024/183/535/original/male-avatar-portrait-of-a-young-man-with-glasses-illustration-of-male-character-in-modern-color-style-vector.jpg";
String newsImage = "https://images.pexels.com/photos/935979/pexels-photo-935979.jpeg?cs=srgb&dl=pexels-nappy-935979.jpg&fm=jpg";
Color appBarColor = Colors.blueGrey;

Color newsTitleColor = Color(0xff003049);
double newsTitleFontSize = 22;
double descriptionTitleFontSize = 25;
double appTitleFontSize = 22;
double newsDescriptionSize = 18;
double newsImageDescriptionSize = 16;



myStyle(double fs, [Color ?clr, FontWeight ?fw]){
  return GoogleFonts.nunito(
    fontSize: fs,
    color: clr,
    fontWeight: fw,
  );
}