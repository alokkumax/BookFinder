import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:like_button/like_button.dart';

class Like extends StatefulWidget {
  @override
  State<Like> createState() => _LikeState();
}

class _LikeState extends State<Like> {
  bool isLiked =false;
  int likeCount = 0;


  @override
  Widget build(BuildContext context) {
    final double size= 26;
    return LikeButton(

      size: size,
      isLiked: isLiked,
      // likeCount: likeCount,

      likeBuilder: (isLiked){

        final color = isLiked ? Colors.red : Colors.white70;
        return Icon(Icons.favorite,color: color,size: size,);
      },
      // likeCountPadding: EdgeInsets.only(left: 9),
      // countBuilder: (count, isLiked, text){
      //   final color = isLiked ? Colors.white : Colors.white60;
        // return Text(
        //   text,
        //   style: GoogleFonts.inter(color: color,fontSize: 20,fontWeight: FontWeight.bold),
        // );
      // },


    );
  }
}
