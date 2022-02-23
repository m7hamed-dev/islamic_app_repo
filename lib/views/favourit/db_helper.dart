import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:quran/tools/constants.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart'; //used to join paths
import 'dart:io';
import 'dart:async';
import 'favourit_model.dart';

class DbHelper {
  static const tableName = "favorit_table";
  //
  static Future<Database> init() async {
    Directory directory =
        //returns a directory which stores permanent files
        await getApplicationDocumentsDirectory();
    //create path to database
    final path = join(directory.path, Constants.dataBaseName);
    //open the database or create a database if there isn't any

    // await databaseFactory.deleteDatabase(path);
    // return;
    return await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
      await db.execute(""" CREATE TABLE $tableName(
          id INTEGER PRIMARY KEY AUTOINCREMENT, title TEXT,hsna TEXT ) """);
    });
  }

  static Future<int> addToFavourit(FavouritModel favourit) async {
    //returns number of items inserted as an integer
    //open database
    final Database db = await init();
    Fluttertoast.showToast(
      msg: 'addToFavourit',
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.green,
      textColor: Colors.white,
      fontSize: 16.0,
    );

    ///
    return db.insert(
      //toMap() function from MemoModel
      tableName, favourit.toMap(),
      conflictAlgorithm:
          ConflictAlgorithm.ignore, //ignores conflicts due to duplicate entries
    );
  }

  static Future<List<FavouritModel>> fetchFavourites() async {
    //returns the memos as a list (array)
    final Database db = await init();
    final maps = await db.query(tableName);
    List<FavouritModel> _favourites = <FavouritModel>[];
    //query all the rows in a table as an array of maps
    for (var item in maps) {
      _favourites.add(FavouritModel.fromJson(item));
    }
    return _favourites;
  }

  static Future<int> deleteSingleFavourite(String title) async {
    //returns number of items deleted
    final db = await init();
    int result = await db.delete(tableName, where: "title = ?",
        // use whereArgs to avoid SQL injection
        whereArgs: [title]);
    // print('result = $result');
    return result;
  }
}
