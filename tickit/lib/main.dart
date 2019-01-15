import 'package:flutter/material.dart';
import 'package:tickit/screens/note_list.dart';

void main() {
  runApp(MyApp());
}

//MyApp() widget

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Tick it",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.orange
      ),
      home: NoteList()
    );
  }

}