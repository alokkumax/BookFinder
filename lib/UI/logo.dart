import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shimmer/shimmer.dart';


Widget logo() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[
      Shimmer.fromColors(
        baseColor: Color(0xff7f00ff),
        highlightColor: Color(0xffe100ff),
        child: Center(
          child: Container(
            child: Center(
              child: Text(
                "BookFinder",
                style: GoogleFonts.inter(fontSize: 25,fontWeight: FontWeight.w500)
              ),
            ),

          ),
        ),),
    ],);
}