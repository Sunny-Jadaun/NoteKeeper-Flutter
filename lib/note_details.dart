import 'package:flutter/material.dart';

class NoteDetail extends StatefulWidget{
  String appBarEdge;
  NoteDetail(this.appBarEdge);
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return NoteDetailState(this.appBarEdge);
  }
}
class NoteDetailState extends State<NoteDetail>{
  String appBarEdgeState;
  NoteDetailState(this.appBarEdgeState);
  static var _priorities=['High','Low'];
  var _currentItem='Low';
  TextEditingController titleController=TextEditingController();
  TextEditingController descriptionController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    TextStyle textStyle=Theme.of(context).textTheme.title;
    return Scaffold(
      appBar: AppBar(
        title: Text(this.appBarEdgeState),
        backgroundColor: Colors.blueAccent,
        centerTitle: true,
      ),
      body: ListView(
        children: <Widget>[
          Padding(padding: EdgeInsets.all(10.0),
      child: ListTile(
            title: DropdownButton(
                items: _priorities.map((String dropDownItem){
                  return DropdownMenuItem<String>(
                      value: dropDownItem,
                      child: Text(dropDownItem)
                  );
            }).toList(),
                value: _currentItem,
                style: textStyle,
                onChanged: (String selectedValue){
                  setState(() {
                    this._currentItem=selectedValue;
                  });
                }),
          )),
          Padding(padding: EdgeInsets.all(10.0),
          child: TextField(
            controller: titleController,
            style: textStyle,
            decoration: InputDecoration(
              labelText: "Title",
              labelStyle: textStyle,
              border:  OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
              )
            ),
          ),),
          Padding(padding: EdgeInsets.all(10.0),
            child: TextField(
              controller: descriptionController,
              style: textStyle,
              decoration: InputDecoration(
                  labelText: "Description",
                  labelStyle: textStyle,
                  border:  OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  )
              ),
            ),),
          Padding(padding: EdgeInsets.all(10.0),
          child: Row(
            children: <Widget>[
              Expanded(
                  child: RaisedButton(
                      color: Colors.blueAccent,
                      textColor: Theme.of(context).primaryColorLight,
                      child: Text("Save",textScaleFactor: 1.5,),
                      onPressed: (){
                      setState(() {

                      });
                  })),
              Container(width: 5.0,),
              Expanded(
                  child: RaisedButton(
                      color: Colors.grey,
                      textColor: Theme.of(context).primaryColorLight,
                      child: Text("Delete",textScaleFactor: 1.5,),
                      onPressed: (){
                        setState(() {

                        });
                      }))
            ],
          ),)
        ],
      ),
    );
  }
}