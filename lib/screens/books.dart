
import 'package:challenge/UI/logo.dart';
import 'package:challenge/screens/add_books.dart';
import '../UI/like.dart';
import 'dart:math';

import 'package:challenge/screens/search.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:ui' as ui;
class books extends StatefulWidget {
  @override
  _bookState createState() => _bookState();
}

class _bookState extends State<books> {
  TextEditingController _searchController = TextEditingController();
  //ui gradient Index
  var items = [
    PlaceInfo( Color(0xff6DC8F3), Color(0xff73A1F9),),
    PlaceInfo( Color(0xffFF5B95), Color(0xffF8556D),),
    PlaceInfo(  Color(0xff8F7AFE),Color(0xffD76EF5),),
    PlaceInfo( Color(0xff42E695), Color(0xff3BB2B8),),
  ];
  main() {
    var rng = new Random();
    var l = new List.generate(5, (_) => rng.nextInt(5));
  }



  //ref.....
  Query _ref;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _ref = FirebaseDatabase.instance.reference().child('Books').orderByChild('title');

  }

  _onSearchChanged(){
    print(_searchController.text);
  }
  @override
  void dispose(){
    _searchController.removeListener(_onSearchChanged);
    _searchController.dispose();
    super.dispose();
  }

  //....
  Widget _buildBookItem({Map book}){
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [items[2].startColor,items[2].endColor],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.purple,
            blurRadius: 12,
            offset: Offset(0,5)
          )
        ],
        borderRadius: BorderRadius.circular(16),


      ),
      margin: EdgeInsets.symmetric(vertical: 10,horizontal: 10),
      padding: EdgeInsets.all(10),
      height: 130,
      width: 100,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Row(children: [

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4),
              child: Text(book['title'],style:GoogleFonts.inter(fontWeight: FontWeight.w700,color: Colors.white,fontSize: 22) ),
            ),


          ],

          ),

          Row(children: [
            // Icon(Icons.drive_file_rename_outline,color: Theme.of(context).primaryColor,
            //   size: 20,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4.0),
              child: Text(book['des'],style:GoogleFonts.inter(fontWeight: FontWeight.w500,color: Colors.white,fontSize: 15) ),
            ),

          ],

          ),
          SizedBox(height: 30,),

          Row(children: [

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4.0),
              child: Icon(Icons.person,color: Theme.of(context).primaryColor,
                size: 20,),
            ),
            SizedBox(width: 0,),

            Text(book['author'],style:GoogleFonts.inter(fontWeight: FontWeight.w400,color: Colors.white,fontSize: 18) ),
            SizedBox(width: 10,),
            Text(book['date'],style:GoogleFonts.inter(fontWeight: FontWeight.w400,color: Colors.white,fontSize: 12) ),
            SizedBox(width: 60,),
            Like(),

            // Icon(Icons.read_more,color: Colors.white,),

          ],

          ),

        ],
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: logo(),
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          actions: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child:GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SearchPage()),
                    );
                  },child: Icon(Icons.search,color: Color(0xff7f00ff),size: 30,)),
            )
          ],
        ),

        body: Container(
          height: double.infinity,
          child: FirebaseAnimatedList(
            query: _ref,
            itemBuilder:(BuildContext context,
                DataSnapshot snapshot,
                Animation<double>animation,
                int index){
              Map name = snapshot.value;
              name['key'] = snapshot.key;
              return _buildBookItem(book: name);
            },),
        ),
        floatingActionButton:Container(
          padding: EdgeInsets.symmetric(vertical: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              FloatingActionButton(
                backgroundColor:Colors.white,
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> add()));
                },
                child:Icon(Icons.add,color:  Color(0xff7f00ff),),)
            ],
          ),
        ),
      ),
    );
  }
}

class PlaceInfo {
  final Color startColor;
  final Color endColor;

  PlaceInfo( this.startColor, this.endColor,);
}
// Widget _buildBookItem({Map book}){
//   return Container(
//     decoration: BoxDecoration(
//       gradient: LinearGradient(
//         colors: [items[1].startColor,items[1].endColor],
//         begin: Alignment.topLeft,
//         end: Alignment.bottomRight,
//       ),
//       boxShadow: [
//         BoxShadow(
//             color: Colors.purple,
//             blurRadius: 12,
//             offset: Offset(0,5)
//         )
//       ],
//       borderRadius: BorderRadius.circular(16),
//
//
//     ),
//     margin: EdgeInsets.symmetric(vertical: 10,horizontal: 10),
//     padding: EdgeInsets.all(10),
//     height: 130,
//     width: 100,
//     child: Column(
//       mainAxisAlignment: MainAxisAlignment.center,
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Row(children: [
//
//           Text(book['title'],style:GoogleFonts.inter(fontWeight: FontWeight.w700,color: Colors.white,fontSize: 22) ),
//
//         ],
//
//         ),
//         Row(children: [
//           // Icon(Icons.drive_file_rename_outline,color: Theme.of(context).primaryColor,
//           //   size: 20,),
//           Text(book['des'],style:GoogleFonts.inter(fontWeight: FontWeight.w500,color: Colors.white,fontSize: 15) ),
//
//         ],
//
//         ),
//         SizedBox(height: 30,),
//
//         Row(children: [
//
//           Icon(Icons.person,color: Theme.of(context).primaryColor,
//             size: 20,),
//           SizedBox(width: 5,),
//
//           Text(book['author'],style:GoogleFonts.inter(fontWeight: FontWeight.w400,color: Colors.white,fontSize: 18) ),
//           SizedBox(width: 10,),
//           Text(book['date'],style:GoogleFonts.inter(fontWeight: FontWeight.w400,color: Colors.white,fontSize: 12) ),
//           SizedBox(width: 50,),
//           Like(),
//
//           // Icon(Icons.read_more,color: Colors.white,),
//
//         ],
//
//         ),
//
//       ],
//     ),
//   );
// }