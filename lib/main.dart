import 'package:flutter/material.dart';
import 'package:wishwala/note_list.dart';
void main(){
  runApp(NoteKeeper());
}
class NoteKeeper extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.indigoAccent,
        accentColor: Colors.yellow
      ),
      debugShowCheckedModeBanner: false,
      title: "NoteKeeper Application",
      home: NoteList(),
    );
  }
}
