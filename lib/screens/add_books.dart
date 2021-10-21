import 'dart:io';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:firebase_storage/firebase_storage.dart';

import 'package:random_string/random_string.dart';
class add extends StatefulWidget {
  @override
  _addState createState() => _addState();
}

class _addState extends State<add> {
  TextEditingController _titleController, _authorController, _dateController, _desController;
  DatabaseReference _ref;
  File image;





  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _titleController= TextEditingController();
    _authorController = TextEditingController();
    _dateController = TextEditingController();
    _desController = TextEditingController();
    _ref = FirebaseDatabase.instance.reference().child('Books');

  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(child: Text('Publish Your Book')),
          ],
        ),
        backgroundColor: Colors.transparent,
        elevation: 0.0,

      ),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 10,),

            SizedBox(height: 8,),
            Container(
              margin:EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: <Widget>[
                  TextFormField(
                    controller: _titleController,
                    decoration:
                    InputDecoration(
                        hintText: "Title of the Book",
                        prefixIcon: Icon(Icons.drive_file_rename_outline,size: 30,color: Colors.white,),
                        filled: true
                    ),
                  ),
                  SizedBox(height: 10,),
                  TextFormField(
                    controller: _authorController,
                    decoration:
                    InputDecoration(
                        hintText: "Author Name",
                        prefixIcon: Icon(Icons.person,size: 30,color: Colors.white,),
                        filled: true
                    ),
                  ),
                  SizedBox(height: 10,),
                  TextFormField(
                    controller: _desController,
                    decoration:
                    InputDecoration(
                        hintText: "Short Description",
                        prefixIcon: Icon(Icons.person,size: 30,color: Colors.white,),
                        filled: true
                    ),
                  ),
                  SizedBox(height: 10,),
                  TextFormField(
                    controller: _dateController,
                    decoration:
                    InputDecoration(
                        hintText: "date",
                        prefixIcon: Icon(Icons.calendar_today,size: 30,color: Colors.white,),
                        filled: true
                    ),
                  ),

                ],
              ),
            ),
            SizedBox(height: 15,),

            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: RaisedButton(
                child: Text("save",style: TextStyle(
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),),
                onPressed: (){
                  saveBook();
                },
                color: Theme.of(context).primaryColor,
              ),
            )
          ],
        ),
      ),
    );
  }
  void saveBook(){
    String title = _titleController.text;
    String author = _authorController.text;
    String date = _dateController.text;
    String des = _desController.text;

    Map<String, String> book = {
      'title' : title,
      'author': author,
      'date': date,
      'des': des,
    };
    _ref.push().set(book).then((value) =>
    Navigator.pop(context));
  }
}
