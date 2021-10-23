import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:random_string/random_string.dart';
class add extends StatefulWidget {
  @override
  _addState createState() => _addState();
}

class _addState extends State<add> {
  TextEditingController _titleController, _authorController, _dateController, _desController;
  DatabaseReference _ref;
  File image;
  DateTime pickedDate;

  FirebaseFirestore _firestore = FirebaseFirestore.instance;



  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _titleController= TextEditingController();
    _authorController = TextEditingController();
    _dateController = TextEditingController();
    _desController = TextEditingController();

    pickedDate = DateTime.now();

    _ref = FirebaseDatabase.instance.reference().child('Books');


  }




  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title:Row(

          children: [
            Text('      Publish Your Book',style: GoogleFonts.inter(fontWeight: FontWeight.w500,color: Color(0xff7f00ff)),),
          ],
        ),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        // actions: [
        //   Icon(Icons.add,color: Colors.white,)
        // ],
      ),
      body: Container(
        child: SingleChildScrollView(
          reverse: true,
          child: Column(

            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin:EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  children: <Widget>[
                    Container(
                      height: size.height /2.5,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(
                              'images/books.png'),

                        ),
                        shape: BoxShape.circle,
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: TextFormField(
                        controller: _titleController,
                        decoration:
                        InputDecoration(
                          border: InputBorder.none,
                            fillColor: Color(0xffE2D3F5),
                            hintText: "Title of the Book",hintStyle: TextStyle(color: Color(0xff9417e2),),
                            prefixIcon: Icon(Icons.book,size: 30,color: Color(0xff6F35A4),),
                            filled: true
                        ),
                      ),
                    ),
                    SizedBox(height: 10,),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: TextFormField(
                        controller: _authorController,
                        decoration:
                        InputDecoration(
                            border: InputBorder.none,
                            fillColor: Color(0xffE2D3F5),
                            hintText: "Author Name",hintStyle: TextStyle(color: Color(0xff9417e2),),
                            prefixIcon: Icon(Icons.person,size: 30,color: Color(0xff6F35A4),),
                            filled: true
                        ),
                      ),
                    ),
                    SizedBox(height: 10,),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: TextFormField(
                        controller: _desController,
                        decoration:
                        InputDecoration(
                            border: InputBorder.none,
                            fillColor: Color(0xffE2D3F5),
                            hintText: "Short Description",hintStyle: TextStyle(color: Color(0xff9417e2),),
                            prefixIcon: Icon(Icons.description,size: 30,color: Color(0xff6F35A4),),
                            filled: true
                        ),
                      ),
                    ),
                    SizedBox(height: 10,),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: TextFormField(
                        controller: _dateController,
                        decoration:
                        InputDecoration(
                            border: InputBorder.none,
                            fillColor: Color(0xffE2D3F5),
                            hintText: "Publish Date of Book",hintStyle: TextStyle(color: Color(0xff9417e2),),
                            prefixIcon: Icon(Icons.date_range,size: 30,color: Color(0xff6F35A4),),
                            filled: true
                        ),
                      ),
                    ),
                    ],
                ),
              ),
              SizedBox(height: 25,),
            Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
          GestureDetector(
            // onTap: _pickDate,
            child: Container(
              height: 45,
              width: 65,
              padding: EdgeInsets.symmetric(vertical: 6, horizontal: 10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.red,),
              child: Icon(Icons.delete,color: Colors.white,),
            ),
          ),
          SizedBox(
            width: 15,
          ),
      GestureDetector(
          onTap: saveBook,
          child: Container(
            height: 45,
          width: 120,
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 30),
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.bottomLeft,
                  end: Alignment.topRight,
                  colors: [Color(0xff8F7AFE), Color(0xffD76EF5),]),
              borderRadius: BorderRadius.circular(10)),
          child: Center(
            child: Text(
              'Save',
              style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600,fontSize: 18),
            ),
          ),
    ),
      ),


    ],
    )
       ]
          ),
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
  _pickDate() async{
   DateTime date = await  showDatePicker(context: context, firstDate: DateTime(DateTime.now().year-20),
        lastDate: DateTime(DateTime.now().year+20),initialDate: pickedDate);
   if(date != null)
     setState(() {
       pickedDate=date;
     });

  }

}
