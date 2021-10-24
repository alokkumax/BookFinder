import 'package:challenge/screens/books.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';


class Search extends SearchDelegate {
  List<String> data = [
    "android",
    "windows",
    "mac",
    "linux",
    "parrotOS",
    "mint",
    "book",
    "Programming",
    "code",
    "coding",
    "app"

  ];

  List<String> recentSearch = [
    "Android",
    "Windows",
    "Mac",
  ];


  @override
  List<Widget> buildActions(BuildContext context) {
    return <Widget>[
      IconButton(
          icon: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Icon(Icons.clear,color:  Color(0xff7f00ff),),
          ),
          onPressed: () {
            query = "";
          })
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
        icon: Icon(Icons.arrow_back,color:  Color(0xff7f00ff),), onPressed: () => Navigator.pop(context));
  }

  @override
  Widget buildResults(BuildContext context) {
    if (query != null && data.contains(query.toLowerCase())) {
      return ListTile(
        title: Text(query,style: TextStyle(color: Colors.black),),
        subtitle: Text("The Book"),
        trailing: IconButton(icon: Icon(Icons.arrow_forward_sharp,color:  Color(0xff7f00ff),),
          onPressed: ()=>showDialog(
              context: context,
              builder: (_)=> AlertDialog(),
          barrierDismissible: true,
          ),),
        onTap: () {},
      );
    } else if (query == "") {
      return Text("");
    } else {
      return ListTile(
        title: Text("No results found"),
        onTap: () {},
      );
    }
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return ListView.builder(
        itemCount: recentSearch.length,
        itemBuilder: (context, index) {});
  }

}

