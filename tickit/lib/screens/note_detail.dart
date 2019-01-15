import 'package:flutter/material.dart';
import 'package:tickit/utils/database_helper.dart';
import 'package:tickit/models/note.dart';

class NoteDetail extends StatefulWidget {
  final String appBarTitle;
  final Note note;


  NoteDetail(this.note, this.appBarTitle);

  @override
  State<StatefulWidget> createState() {
    return NoteDetailState(this.note, this.appBarTitle);
  }
}

class NoteDetailState extends State<NoteDetail> {

  
  var _formKey = GlobalKey<FormState>();
  
  static var _priorities = ['A', 'B', 'C', 'D', 'E'];

  DatabaseHelper helper = DatabaseHelper();

  String appBarTitle;
  Note note;

  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  NoteDetailState(this.note, this.appBarTitle);

  @override
   void initState() { 

    super.initState();
    
  }

  @override
  void didChangeDependencies() {
    
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {

    // TextStyle textStyle = Theme.of(context).textTheme.title;
    
    if(note.title != 'title') {
          titleController.text = note.title;
      }
    if(note.description != 'description') {
          descriptionController.text = note.description;
    }

    return WillPopScope(
        onWillPop: () {
          moveToLastScreen();
        },
        child: Scaffold(
            appBar: AppBar(
              title: Text(
                appBarTitle,
                style: TextStyle(color: Colors.white, fontFamily: 'Ubuntu'),
              ),
              leading: IconButton(
                icon: Icon(Icons.arrow_back),
                onPressed: () {
                  moveToLastScreen();
                },
                color: Colors.white,
              ),
            ),
            body: Form(
              key: _formKey,
              child: Padding(
              padding: EdgeInsets.only(top: 15.0, left: 10.0, right: 10.0),
              child: ListView(
                children: <Widget>[
                  //1st element in NoteDetail Screen
                  Padding(
                    padding: EdgeInsets.all(5.0),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: Text(
                            "Set Priority  >",
                            style: TextStyle(color:Colors.redAccent, fontFamily: 'Staatliches', fontSize: 25.0, shadows: <Shadow>[ Shadow( offset: Offset(0.5, 0.5), blurRadius: 2.0, color: Colors.black, ) ] ),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.only(left: 1.0),
                            child: DropdownButton(
                                iconSize: 30.0,
                                items: _priorities.map((String dropDownStringItem) {
                                  return DropdownMenuItem<String>(
                                    value: dropDownStringItem,
                                    child: Text(dropDownStringItem),
                                  );
                                }).toList(),
                                 style: TextStyle(color:Colors.redAccent, fontFamily: 'Staatliches', fontSize: 25.0, shadows: <Shadow>[ Shadow( offset: Offset(0.5, 0.5), blurRadius: 2.0, color: Colors.black, ) ] ),
                                value: getPriorityAsString(note.priority),
                                onChanged: (valueSelectedByUser) {
                                  setState(() {
                                    updatePriorityAsInt(valueSelectedByUser);
                                  });
                                }),
                          ),
                        )
                      ],
                    ),
                  ),

                  //Second Element
                  Padding(
                    padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
                    child: TextFormField(
                      controller: titleController,
                      style: TextStyle(fontSize: 18.0,  color: Colors.black),
                      validator: (String value) {
                        if(value.isEmpty) {
                          return '* Please Enter the Title';
                        }
                        if(value.length >=75) { return '* Inpute limit exceeded'; }
                      },
                      onSaved: (value) {
                          updateTitle();
                      },
                      decoration: InputDecoration(
                        hintText: "Title *",
                        border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20.0))),
                    ),
                  ),

                  //Third Element
                  Padding(
                    padding: EdgeInsets.only(top: 15.0, bottom: 18.0),
                    child: TextFormField(
                    controller: descriptionController,
                    style: TextStyle(fontSize: 18.0,  color: Colors.black, fontFamily: 'Ubuntu', fontStyle: FontStyle.italic ),
                      validator: (String value) {
                        if(value.length >=75) {
                          return '* Inpute limit exceeded';
                        }
                      },
                      onSaved: (value) { 
                        updateDescription();
                      },
                      decoration: InputDecoration(
                        hintText: 'Description (Optional)',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20.0))),
                    ),
                  ),

                  //fourth element

                  Padding(
                      padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            child: RaisedButton(
                              padding: EdgeInsets.only(top:12.0, bottom: 12.0),
                                color: Colors.lightGreen,
                                textColor: Colors.white,
                                elevation: 10.0,
                                highlightColor: Colors.lightGreenAccent,
                                highlightElevation: 2.0,
                                child: Text(
                                  "Save",
                                  style: TextStyle(fontFamily: 'Ubuntu', shadows: <Shadow>[
                                    Shadow(
                                      offset: Offset(0.5, 0.5),
                                      blurRadius: 3.0,
                                      color: Colors.black,
                                    )
                                  ]),
                                  textScaleFactor: 1.5,
                                ),
                                onPressed: () {
                                    setState(() {
                                      note.title = titleController.text;
                                      note.description = descriptionController.text;
                                      if(_formKey.currentState.validate()) {
                                        _formKey.currentState.save();
                                           _save();
                                      }
                                    });
                                }),
                          ),

                          Container(
                            width: 5.0,
                          ),

                        //DeleteButton
                          Expanded(
                            child: RaisedButton(
                              padding: EdgeInsets.only(top:12.0, bottom: 12.0),
                                color: Colors.redAccent,
                                textColor: Colors.white,
                                elevation: 10.0,
                                highlightColor: Colors.red,
                                highlightElevation: 1.0,
                                child: Text(
                                  "Delete",
                                  style: TextStyle(fontFamily: 'Ubuntu',shadows: <Shadow>[ Shadow( offset: Offset(0.5, 0.5), blurRadius: 3.0, color: Colors.black, ) ]),
                                  textScaleFactor: 1.5,
                                ),
                                onPressed: () {
                                  setState(() {
                                     note.description = descriptionController.text;
                                    _delete();
                                  });
                                }),
                          ),
                        ],
                      )),
                ],
              ),
            ))));
  }

  void moveToLastScreen() {
    Navigator.pop(context, true);
  }

  // Convert String priority in the form of integer before saving it to Database
  void updatePriorityAsInt(String value) {
    switch (value) {
      case 'A':
        note.priority = 1;
        break;

      case 'B':
        note.priority = 2;
        break;

      case 'C':
        note.priority = 3;
        break;

      case 'D':
        note.priority = 4;
        break;

      case 'E':
        note.priority = 5;
        break;

      default:
        note.priority = 1;
    }
  }

  // Convert int priority in the form of String and display it to the user in DropDown
  String getPriorityAsString(int value) {
    String priority;

    switch (value) {
      case 1:
        priority = _priorities[0];
        break;

      case 2:
        priority = _priorities[1];
        break;

      case 3:
        priority = _priorities[2];
        break;

      case 4:
        priority = _priorities[3];
        break;

      case 5:
        priority = _priorities[4];
        break;

      default:
        priority = _priorities[0];
    }

    return priority;
  }

  //Update the title of note object
  void updateTitle() {
    note.title = titleController.text;
  }

  //Update the description of note object
  void updateDescription() {
    note.description = descriptionController.text;
  }

  //Save data to database
  void _save() async {
    moveToLastScreen();
    // int result;

    if (note.id != null) {
      //Case 1: Update Operation
      await helper.updateNote(note);
    } else {
      //Case 2: Insert Operation
      await helper.insertNote(note);
    }

    // if (result != 0) {
    //   //Success
    //   _showAlertDialog('Staus', 'To-Do Saved Successfully');
    // } else {
    //   //Failure
    //   _showAlertDialog('Staus', 'Problem in Saving To-Do');
    // }
  }

  //Delete Button code
  void _delete() async {
    moveToLastScreen();
    //case 1: new note delete before saving
    // if (note.id == null) {
    //   _showAlertDialog('Status', 'No To-Do is Deleted');
    //   return;
    // }

    //Case 2: deleting older note saved in database
    // int result =
     await helper.deleteNote(note.id);

    // if (result != 0) {
    //   _showAlertDialog('Staus', 'To-Do Deleted Successfully');
    // } else {
    //   _showAlertDialog('Staus', 'Error Occured while Deleting Note');
    // }
  }

  //Show AlertDialog Box
  // void _showAlertDialog(String title, String message) {
  //   AlertDialog alertDialog = AlertDialog(
  //     title: Text(title),
  //     content: Text(message),       
  //   );

  //   showDialog(context: context, builder: (_) => alertDialog);
  // }
}

