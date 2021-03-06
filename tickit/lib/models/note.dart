
class Note{

  int _id;
  String _title;
  String _description;
  int _priority;


  Note(this._title, this._priority, [this._description]);
  Note.withId(this._id,this._title, this._priority, [this._description]);

  int get id => _id;

  String get title => _title;

  String get description => _description;

  int get priority => _priority;

 set title(String newTitle) {
    if(newTitle.length <=50) {
     this._title = newTitle;
    }
  }

  set description(String newDescription) {
    if(newDescription.length <=50)
      {
       this._description = newDescription;
      }
  }

  set priority(int newPriority) {
    if(newPriority >=1 && newPriority <=5)
      {
       this._priority = newPriority;
      }
  }
  


  //Convert a Note Object into a Map Object
  Map<String, dynamic> toMap() {

    var map = Map<String, dynamic>();

    if( id != null){
      map['id'] = _id;
    }
    map['title'] = _title;
    map['description'] = _description;
    map['priority'] = _priority;

    return map;
  }

  //Extract a Note Object from a Map object
  Note.fromMapObject(Map<String, dynamic> map) {
    this._id = map['id'];
    this._title = map['title'];
    this._description = map['description'];
    this._priority = map['priority'];
  }

}