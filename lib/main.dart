import 'package:challenge/screens/books.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'BookFinder',
      theme: ThemeData.dark(),
      // theme: ThemeData(
      //   primaryColor: Colors.deepPurple,
      //   accentColor: Colors.deepPurple[600],
      // ),
      home: books(),

    );
  }
}
