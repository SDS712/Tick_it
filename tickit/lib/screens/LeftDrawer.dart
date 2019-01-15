
import 'package:flutter/material.dart';
import 'package:tickit/screens/SliverPage.dart';

class LeftDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[

            //first widger in drawer
            DrawerHeader(
              child: Row(
                children: <Widget>[

                  //first child
                  Center(
                  child: CircleAvatar(
                  radius: 65.0,
                  backgroundColor: Colors.white,
                   child: CircleAvatar(
                    radius: 60.0,
                    backgroundColor: Colors.white,
                    child: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          fit: BoxFit.fitHeight,
                          image: AssetImage('images/bt.jpg'),
                        )
                      ),
                  ),
              )),
            ),

              //second child
              Container(width: 30.0,),

              //third child
              Center (child: Container(child: Text('Brian\nTracy', style: TextStyle(fontSize: 30.0, color: Colors.white, fontFamily: 'Ubuntu',shadows: <Shadow>[ Shadow( offset: Offset(0.5, 0.5), blurRadius: 3.0, color: Colors.black, ) ])),),)

                ],
              ),
              decoration: BoxDecoration(
              color: Colors.orange,
              ),              
            ),

            //second widget in drawer
            ListTile(
              leading: Container(padding:EdgeInsets.all(10.0,),color: Colors.redAccent,child: Text("Note", style: TextStyle(fontSize: 20.0,fontFamily: 'Staatliches', fontWeight: FontWeight.w300, color: Colors.white, shadows: <Shadow>[Shadow(offset: Offset(0.5, 0.5),blurRadius: 1.5, color: Colors.black)]),)),
              subtitle: Text("This short Description is taken for educational purpose only, from the book 'Eat that Frog' which is written by Brian Tracy.",
                              style: TextStyle(color: Colors.redAccent, fontFamily: 'Ubuntu', fontStyle: FontStyle.italic, fontSize: 10.0),),
            ),

            //
            GestureDetector(onDoubleTap: () { Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context)=>SliverPage(),));} ,child: Padding(padding: EdgeInsets.only(top:3.0, bottom: 3.0),child: ListTile(title: EatTFImg()))),

            //
            Padding(padding: EdgeInsets.only(left: 20.0),child: Text("ABCDE Method :", style: TextStyle(fontFamily: 'Ubuntu', color: Colors.redAccent, fontSize: 25.0,fontWeight: FontWeight.w600, shadows: <Shadow>[Shadow(offset: Offset(0.5, 0.5),blurRadius: 1.5, color: Colors.black)]),)),
            
            Padding(
              padding: EdgeInsets.only(left:20.0, right: 2.0,),
              child: 
                Text("     First of all, make a list. Make a list of everything that you have to do in the course of the day. The best time to make the list is the night before. Write down everything you have to do, the night before. Then review the list carefully using ABCDE method." + "\n     The ABCDE stands for five different ways of alocating time on this list.",
                      style: TextStyle(fontFamily: 'Ubuntu', fontStyle: FontStyle.italic, fontSize:15.0),
                    ),
            ),

            Divider(height: 10.0, color: Colors.redAccent,),

            //A
            ListTile(leading: CircleAvatar(backgroundColor: Colors.green,child: Text("A", style: TextStyle(fontFamily: 'Staatliches', fontSize: 30.0, shadows: <Shadow>[ Shadow( offset: Offset(0.5, 0.5), blurRadius: 3.0, color: Colors.black, ) ]),),),title: Text("'A' task is an activity that has serious potential consequences. It is something that you must do.\nThe most valueable things at present time.",style: TextStyle(fontFamily: 'Ubuntu', fontSize:15.0),),),
            Divider(height: 5.0, color: Colors.redAccent,),
            
            //B
            ListTile(leading: CircleAvatar(backgroundColor: Colors.teal,child: Text("B", style: TextStyle(fontFamily: 'Staatliches', fontSize: 30.0,shadows: <Shadow>[ Shadow( offset: Offset(0.5, 0.5), blurRadius: 3.0, color: Colors.black, ) ]),),),title: Text("'B' task is something that it would be nice to do. It has mild consequences, but it's not as serious as an A task.\n\nE.g. replying e-mails, reading newspaper... etc",style: TextStyle(fontFamily: 'Ubuntu', fontSize:15.0),),),
            Divider(height: 5.0, color: Colors.redAccent,),

            //C
            ListTile(leading: CircleAvatar(backgroundColor: Colors.blue,child: Text("C", style: TextStyle(fontFamily: 'Staatliches', fontSize: 30.0,shadows: <Shadow>[ Shadow( offset: Offset(0.5, 0.5), blurRadius: 3.0, color: Colors.black, ) ]),),),title: Text("'C' task is something that would be fun to do, but it has no consequences.\n\nE.g. Watching moives, Chitchat... etc",style: TextStyle(fontFamily: 'Ubuntu', fontSize:15.0),),),
            Divider(height: 5.0, color: Colors.redAccent,),

            //D
            ListTile(leading: CircleAvatar(backgroundColor: Colors.pinkAccent,child: Text("D", style: TextStyle(fontFamily: 'Staatliches', fontSize: 30.0, shadows: <Shadow>[ Shadow( offset: Offset(0.5, 0.5), blurRadius: 3.0, color: Colors.black, ) ]),),),title: Text("'D' stands for delegate. What you do is you delegate everything that you possibly can to someone else who can do it reasonably well.\n     There are certain things that you just don't do any more. You get them done through others.",style: TextStyle(fontFamily: 'Ubuntu', fontSize:15.0),),),
            Divider(height: 5.0, color: Colors.redAccent,),

            //E
            ListTile(
              leading: CircleAvatar(backgroundColor: Colors.red,child: Text("E", style: TextStyle(fontFamily: 'Staatliches', fontSize: 30.0, shadows: <Shadow>[ Shadow( offset: Offset(0.5, 0.5), blurRadius: 3.0, color: Colors.black, ) ]),),),
              title: Text("'E' is for eliminate. Eliminate everything that is not important to your life. Even if you've been doing it for a long time, even if it's fun, even if it's comfortable or enjoyable, stop doing it.",style: TextStyle(fontFamily: 'Ubuntu', fontSize:15.0),),
              subtitle: Text("* Remember that the only way you can get your time under control is to stop doing things of low or no value.", style:TextStyle(color:Colors.redAccent, fontFamily: 'Ubuntu', fontStyle: FontStyle.italic, shadows: <Shadow>[Shadow(offset: Offset(0.5, 0.5),blurRadius: 1.5, color: Colors.black)])),
            ),
            Divider(height: 5.0, color: Colors.redAccent,),

            //Rule
            ListTile(
              leading: Container(padding:EdgeInsets.all(10.0,),color: Colors.redAccent,child: Text("RULE", style: TextStyle(fontSize: 20.0,fontFamily: 'Staatliches', fontWeight: FontWeight.w300, color: Colors.white, shadows: <Shadow>[Shadow(offset: Offset(0.5, 0.5),blurRadius: 1.5, color: Colors.black)]),)),
              title: Text("Never do a 'C' task when you have a 'B' left undone, and never do a 'B' when you have an 'A' left undone.",
                              style: TextStyle(color: Colors.black, fontFamily: 'Ubuntu', fontStyle: FontStyle.italic, fontSize: 15.0),),
            ),
            Divider(height: 5.0, color: Colors.redAccent),

            //extra space
            Container(height: 10.0,),

            //last
            Padding(
              padding: EdgeInsets.only(top: 5.0, bottom: 15.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text("v 1.0", style: TextStyle(fontFamily: 'Ubuntu', fontSize: 15.0, fontWeight: FontWeight.w600)),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      
                      Text("Made With ", style: TextStyle(fontFamily: 'Satisfy', fontSize: 18.0)),
                      Icon(Icons.favorite, color: Colors.red,),
                      Text(" By Using ",style: TextStyle(fontFamily: 'Satisfy', fontSize: 18.0)),
                      FlutterLogo(),
                    ],
                  ),
                  Divider(height: 5.0,),
                  Text("Developed By", style: TextStyle(fontFamily: 'Staatliches', fontSize: 15.0)),
                  Text("Saurabh Andhare", style: TextStyle(fontFamily: 'Ubuntu', fontSize: 18.0)),
                ],
              ),
            ),
            
            //last divider
            Divider(height: 5.0,color: Colors.redAccent,),

          ],
        ),
      );
  }


}

class BrianImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
  AssetImage assetImage = AssetImage('images/bt.jpg');
  Image img = Image(image: assetImage, height:125.0,);

    return Container (child: img);
  }
}

class EatTFImg extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AssetImage asset = AssetImage('images/ETF.jpg');
    Image img1 = Image(image: asset, height: 150.0,);

    return img1;
  }
}

