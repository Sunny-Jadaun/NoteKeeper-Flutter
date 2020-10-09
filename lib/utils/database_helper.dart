import 'dart:html';

import 'package:sqflite/sqflite.dart';
import 'dart:async';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:wishwala/models/note.dart';
class DatabaseHelper{
  static DatabaseHelper _databaseHelper;
  static Database _database;
  String noteTable='note_table';
  String colTitle='title';
  String colId='id';
  String colDescription='description';
  String colPriority='priority';
  String colDate='date';

  DatabaseHelper._createInstance();
  factory DatabaseHelper(){
    if(_databaseHelper==null){
      _databaseHelper=DatabaseHelper._createInstance();
    }
    return _databaseHelper;
  }
  Future<Database> initializeDatabase() async{
    Directory directory=await getApplicationDocumentsDirectory();
    String path=directory.path +'note.db';
    var notesDatabase=openDatabase(path,version: 1,onCreate: _createDb);
    return notesDatabase;
  }
  Future<Database> get database async{
    if (_database == null)
      {
        _database=await initializeDatabase();
      }
    return _database;
  }
  void _createDb(Database db,int position) async{
    await db.execute('CREATE TABLE $noteTable($colId INTEGER PRIMARY KEY AUTOINCREMENT,$colTitle TEXT,'
        '$colDescription TEXT,$colPriority INTEGER,$colDate TEXT)');
  }

  Future<List<Map<String,dynamic>>> getNoteMapList() async{
    Database db=await this.database;
    var result=await db.query(noteTable,orderBy: '$colPriority ASC');
    return result;
  }
  Future<int> insertNote(Note note) async{
   var db=await this.database;
   var result= await db.insert(noteTable,note.toMap());
   return result;
  }
  Future<int> updateNote(Note note) async{
    var db=await this.database;
    var result= await db.update(noteTable,note.toMap(),where: '$colId=?',whereArgs: [note.id]);
    return result;
  }
  Future<int> deleteNote(int id) async{
    var db=await this.database;
    var result=await db.delete(noteTable,where: '$colId=$id');
    return result;
  }
  Future<int> getCount() async{
    var db= await this.database;
    List<Map<String,dynamic>> x=await db.rawQuery('SELECT COUNT(*) from $noteTable');
    int result=Sqflite.firstIntValue(x);
    return result;
  }
}