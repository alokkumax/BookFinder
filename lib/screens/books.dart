import 'package:challenge/ModelClass.dart';
import 'package:challenge/screens/add_books.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class books extends StatefulWidget {
  @override
  _bookState createState() => _bookState();
}

class _bookState extends State<books> {
  //ref.....
  Query _ref;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _ref = FirebaseDatabase.instance.reference().child('Books').orderByChild('title');
  }

  //....
  Widget _buildBookItem({Map book}){
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20,horizontal: 10),
      padding: EdgeInsets.all(10),
      height: 130,
      width: 100,
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(children: [
            
            Text(book['title'],style:GoogleFonts.inter(fontWeight: FontWeight.w500,color: Colors.black,fontSize: 22) ),

          ],

          ),
          Row(children: [
            // Icon(Icons.drive_file_rename_outline,color: Theme.of(context).primaryColor,
            //   size: 20,),
            Text(book['des'],style:GoogleFonts.inter(fontWeight: FontWeight.w400,color: Colors.black,fontSize: 15) ),

          ],

          ),
          SizedBox(height: 30,),

          Row(children: [

            Icon(Icons.person,color: Theme.of(context).primaryColor,
              size: 20,),
            SizedBox(width: 5,),

            Text(book['author'],style:GoogleFonts.inter(fontWeight: FontWeight.w300,color: Colors.black,fontSize: 18) ),
            SizedBox(width: 10,),
            Text(book['date'],style:GoogleFonts.inter(fontWeight: FontWeight.w400,color: Colors.black,fontSize: 12) ),


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
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              Text('Book'),
              Text('Finder',style: TextStyle(
                color: Color(0xFF61F8D5)
              ),)
            ],
          ),
          backgroundColor: Colors.transparent,
          elevation: 0.0,
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
             return _buildBookItem(book: name);
          },),
        ),
        floatingActionButton:Container(
          padding: EdgeInsets.symmetric(vertical: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end
            ,
            children: <Widget>[
              FloatingActionButton(
                  onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=> add()));
              },
              child:Icon(Icons.add),)
            ],
          ),
        ),
      ),
    );
  }
}
