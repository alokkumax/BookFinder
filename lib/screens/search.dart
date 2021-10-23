import 'package:challenge/UI/logo.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SearchPage extends StatefulWidget {
  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  TextEditingController _titleController, _authorController, _dateController, _desController;
  DatabaseReference _ref;
  final TextEditingController _search = TextEditingController();



  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title:logo(),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),

      child: Icon(Icons.search,color: Colors.white,),
          )
        ],
      ),
      body: Column(
        children: [
          SizedBox(height: size.height /75,),
          Container(
            height: size.height /14,
            width: size.width,
            alignment: Alignment.center,
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 24),
              padding: EdgeInsets.symmetric(horizontal: 24),
              decoration: BoxDecoration(
              color: Color(0xfff5f8fd),
              borderRadius: BorderRadius.circular(24)
            ),
              height: size.height/14,
              width: size.width/1.15,
              child: Expanded(
                child: TextField(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Search",
                  ),
                  onChanged: (text){
                    SearchMethod(text);
                  },
                ),
              ),
            ),
          ),
          SizedBox(
            height: size.height / 30,
          ),
          ElevatedButton(onPressed: (){},
              child: Text("Find Books"),),

        ],
      ),
    );
  }

  void SearchMethod(String text) {}



}
