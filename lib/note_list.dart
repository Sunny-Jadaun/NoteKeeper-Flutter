import 'package:flutter/material.dart';
import 'package:wishwala/note_details.dart';
class NoteList extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return NoteListState();
  }
}
class NoteListState extends State<NoteList>{
  int count=0;
  @override
  Widget build(BuildContext context) {
    return
      WillPopScope(onWillPop: (){
         backToLastScreen();
      },
          child:Scaffold(
      appBar: AppBar(title: Text("List View"),
      backgroundColor: Colors.blueAccent,
      leading: IconButton(icon: Icon(Icons.arrow_back),
          onPressed: (){
            backToLastScreen();
          }),
      ),
      body: getNoteListView(),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        backgroundColor: Colors.yellow,
        tooltip: "Add one more Note",
        onPressed: (){
          debugPrint("FAB was clicked");
          nextScreen('Add Note');
              }))
      );
  }
  ListView getNoteListView() {
    TextStyle titleStyle = Theme
        .of(context)
        .textTheme
        .subhead;
    return ListView.builder(
        itemCount: count,
        itemBuilder: (BuildContext context, int position) {
          return Card(
              color: Colors.white,
              elevation: 2.0,
              child: ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Colors.yellow,
                    child: Icon(Icons.arrow_right),
                  ),
                  title: Text("Dummy title",
                    style: titleStyle,),
                  subtitle: Text("Dummy Subtitle"),
                  trailing: Icon(Icons.delete, color: Colors.grey,),
                  onTap: () {
                    debugPrint("ListView Tapped");
                    nextScreen('Edit Note');
                        }));
                  });
        }
  void backToLastScreen(){
    Navigator.pop(context);
  }
  void nextScreen(String string) {
    Navigator.push(context, MaterialPageRoute(
        builder: (context) {
          return NoteDetail(string);
        }));
  }

  }