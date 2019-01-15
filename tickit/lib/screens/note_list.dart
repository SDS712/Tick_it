import 'dart:async';
import 'package:flutter/material.dart';
import 'package:tickit/models/note.dart';
import 'package:tickit/screens/LeftDrawer.dart';
import 'package:tickit/utils/database_helper.dart';
import 'package:sqflite/sqflite.dart';
import 'package:tickit/screens/note_detail.dart';

class NoteList extends StatefulWidget {
    
  @override
  State<StatefulWidget> createState() {
    return NoteListState();
  }
}

class NoteListState extends State<NoteList> {

  final GlobalKey<ScaffoldState> _scaffoldkey = new GlobalKey<ScaffoldState>();

  DatabaseHelper databaseHelper = DatabaseHelper();
  List<Note> noteList;
  int count = 0;
  TextStyle titleStyle;
  

  @override
  Widget build(BuildContext context) {
    if (noteList == null) {
      noteList = List<Note>();
      updateListView( );
    }
    return Scaffold(
      backgroundColor: Colors.grey,
      key: _scaffoldkey,
      drawer: LeftDrawer(),
      appBar: AppBar(
        title: Text(
          "To - Do List",
          style: TextStyle(color: Colors.white, fontFamily: 'Ubuntu'),
        ),
        leading: IconButton(icon: Icon(Icons.done_all), color: Colors.white,
          onPressed: ( ) => _scaffoldkey.currentState.openDrawer( ),),

      ),

      body: getNoteListView(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          navigateToDetail(Note('title', 1, 'description'), 'Create To - Do Item');
        },
        tooltip: 'Add New To - Do',
        child: Text("+", style: TextStyle(fontSize: 30.0,color:Colors.white, shadows: <Shadow>[Shadow(offset: Offset(1.0, 1.0), color: Colors.black, blurRadius: 5.0)]),)
      ),
    );
  }

  ListView getNoteListView() {
    // TextStyle textStyle = Theme.of(context).textTheme.subhead;
      TextStyle titleStyleTitle = TextStyle(fontFamily: 'Ubuntu',color: Colors.black);

    return ListView.builder(
        itemCount: count,
        itemBuilder: (BuildContext context, int position) {
          return Dismissible(
            dismissThresholds: {
              DismissDirection.endToStart: 0.56,
            },
            direction: DismissDirection.endToStart,
            key: new ObjectKey(noteList[position]),
            onDismissed: (direcion) {
              _delete(context, this.noteList[position]);
              _showSnackBar(context, 'To - Do Deleted Successfully', 'RED');
            },
            background: Container(
              color: Colors.redAccent,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Align(
                    alignment: Alignment.centerRight,
                    child: Icon(Icons.arrow_left,color: Colors.white, size: 40.0,),
                  ),
                  Container(width: 5.0,),
                  //Delete
                  Align(
                    alignment: Alignment.centerRight,
                    child: Text("Delete", style: TextStyle(color: Colors.white, fontSize:20.0, fontFamily: 'Ubuntu' )),
                  ),
                  Container(width: 5.0,),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Padding(
                      padding: EdgeInsets.only(right: 15.0),
                        child: Icon(
                        Icons.delete,
                        color: Colors.white,
                        size: 40.0,
                      ),
                    ),
                  ),
                ],
              ),
            ),
                child: Card(
                shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)
              ),
              color: Colors.white,
              elevation: 3.0,
              child: ListTile(
                leading: InkWell(
                  highlightColor: Colors.orangeAccent,
                        child: CircleAvatar(
                        backgroundColor: getPriorityColor(this.noteList[position].priority),
                        child: Text(getPriorityIcon(this.noteList[position].priority),  style: TextStyle(color: Colors.white,fontFamily: 'Staatliches',shadows: <Shadow>[ Shadow( offset: Offset(0.5, 0.5), blurRadius: 3.0, color: Colors.black, ) ]), textScaleFactor: 1.5,),
                      ),
                ),
                title: Text(this.noteList[position].title, style: titleStyleTitle,textScaleFactor: 1.1,),
                subtitle: Text(this.noteList[position].description, style: TextStyle(fontFamily: 'Ubuntu', fontStyle: FontStyle.italic, color: Colors.grey),textScaleFactor: 1.0,),
               /* 
                trailing: GestureDetector(
                      child: Icon(Icons.delete_forever, color: Color.fromRGBO(255, 0, 0, 0.6), size: 35,),
                    onTap: () {
                        // _delete(context, noteList[position]);
                    },
                  ),
              */
                onTap: () {  navigateToDetail(this.noteList[position], 'Edit To - Do Item');}
              ),
            ),
          );
        });
     
  }
  List<int> value(int position) => [position];

  //Returns the Priority Color
  Color getPriorityColor(int priority) {
    switch (priority) {
      case 1:
        return Colors.green;
        break;

      case 2:
        return Colors.teal;
        break;

      case 3:
        return Colors.blue;
        break;

      case 4:
        return Colors.pinkAccent;
        break;

      case 5:
        return Colors.red;
        break;

      default:
        return Colors.lightGreen;
    }
  }

  //Returns Priority Icon
  String getPriorityIcon(int priority) {
    switch (priority) {
      case 1:
        return "A";
        break;

      case 2:
        return "B";
        break;

      case 3:
        return "C";
        break;

      case 4:
        return "D";
        break;

      case 5:
        return "E";
        break;

      default:
        return "A";
    }
  }

  //Delete note on IconClick
  void _delete(BuildContext context, Note note,) async {
    int result = await databaseHelper.deleteNote(note.id);

    if (result != 0) {
      updateListView();
    }
  }

  void _showSnackBar(BuildContext context, String message, String color) {

    final snackBar = SnackBar(content: Text(message), backgroundColor: Colors.redAccent,  duration: Duration(seconds: 1),);
    Scaffold.of(context).showSnackBar(snackBar);
  }

  void navigateToDetail(Note note,String title) async {
    bool result = await Navigator.push(context, MaterialPageRoute(builder: (context) {
      return NoteDetail(note, title);
    }));

    if(result == true) {
      updateListView( );
    }
  }


  //update
void updateListView( ) {
    final Future<Database> dbFuture = databaseHelper.initializeDatabase();
    dbFuture.then((database) {

      Future<List<Note>> noteListFuture = databaseHelper.getNoteList( );
      noteListFuture.then( (noteList) {
        setState(() {
          this.noteList = noteList;
          this.count = noteList.length;
        });
      });
    });
}
}
