// import 'package:flutter/material.dart';
// import 'package:quran/tools/constants.dart';
// import 'package:quran/tools/custom_message.dart';
// import 'package:quran/widgets/txt.dart';
// import 'package:sqflite/sqflite.dart';
// import 'package:path_provider/path_provider.dart';
// import 'package:path/path.dart'; //used to join paths
// import 'dart:io';
// import 'dart:async';
// import '../../global/quran_controller_api.dart';
// import 'favourit_model.dart';

// ///
// class DbHelper extends ChangeNotifier {
//   static const tableName = "favorit_table";
//   static const surahTableName = "surah_table";
//   //
//   DbHelper() {
//     debugPrint('dbhelper build constructor ....');
//     // fetchFavourites();
//   }
//   static Future<Database> init() async {
//     Directory directory =
//         //returns a directory which stores permanent files
//         await getApplicationDocumentsDirectory();
//     //create path to database
//     final path = join(directory.path, Constants.dataBaseName);
//     //open the database or create a database if there isn't any

//     return await openDatabase(path, version: 1,
//         onCreate: (Database db, int version) async {
//       await db.execute(""" CREATE TABLE $tableName(
//           id INTEGER PRIMARY KEY AUTOINCREMENT, title TEXT,hsna TEXT ) """);
//     });
//   }

//   Future<int> addToFavourit(
//       BuildContext context, FavouritModel favourit) async {
//     //returns number of items inserted as an integer
//     //open database
//     final Database db = await init();
//     //
//     final result = await db.insert(
//       //toMap() function from MemoModel
//       tableName, favourit.toMap(),
//       conflictAlgorithm: ConflictAlgorithm.ignore,
//       //ignores conflicts due to duplicate entries
//     );
//     CustomMessage.showCustomSnackBar(
//       context,
//       content: const Txt(
//         Constants.processSuccess,
//         isUseFontSizePrefs: false,
//         fontSize: 20.0,
//         color: Colors.white,
//       ),
//     );
//     notifyListeners();
//     return result;
//   }

//   final favourites = <FavouritModel>[];
//   // int get length => favourites.length;
//   // List<FavouritModel> get equal => favourites;
//   //
//   Future<void> fetchFavourites() async {
//     //returns the memos as a list (array)
//     final Database db = await init();
//     //
//     final maps = await db.query(tableName);
//     // List<FavouritModel> _favourites = <FavouritModel>[];
//     //query all the rows in a table as an array of maps
//     for (var item in maps) {
//       FavouritModel _favourit = FavouritModel.fromJson(item);
//       favourites.add(_favourit);
//       debugPrint('item ${item['title']}');
//     }
//     notifyListeners();
//   }

//   Future<int> deleteSingleFavourite(String title) async {
//     //returns number of items deleted
//     final db = await init();
//     int result = await db.delete(tableName, where: "title = ?",
//         // use whereArgs to avoid SQL injection
//         whereArgs: [title]);
//     // print('result = $result');
//     notifyListeners();
//     return result;
//   }

//   /// part quran online
//   static Future<Database> initSurahTable() async {
//     Directory directory =
//         //returns a directory which stores permanent files
//         await getApplicationDocumentsDirectory();
//     //create path to database
//     final path = join(directory.path, Constants.dataBaseName);
//     //open the database or create a database if there isn't any
//     // final _query =
//     //     ' number ,name , englishNameTranslation , revelationType , surahList LIST   ';

//     //
//     final result = await openDatabase(path, version: 1,
//         onCreate: (Database db, int version) async {
//       await db.execute(""" CREATE TABLE $surahTableName(
//           id INTEGER PRIMARY KEY AUTOINCREMENT, title TEXT,hsna TEXT ) """);
//     });
//     //
//     return result;
//   }

//   // final ayaList = <Surah>[];
//   //
//   Future<void> saveListOfAyaFromOnlineToLocal(List<Surah> ayaList) async {
//     //open database
//     final Database db = await initSurahTable();

//     // final String dataAsJson = json.encode(Ayah.ti);
// //
//     // db.insert(surahTableName, values);
//     //
//     for (var item in ayaList) {
//       await db.insert(
//         tableName, item.toJson(),
//         conflictAlgorithm: ConflictAlgorithm.ignore,
//         //ignores conflicts due to duplicate entries
//       );
//     }
//   }

//   Future<void> fetchSurahs() async {
//     //returns the memos as a list (array)
//     final Database db = await initSurahTable();
//     //
//     final maps = await db.query(surahTableName);
//     // List<FavouritModel> _favourites = <FavouritModel>[];
//     //query all the rows in a table as an array of maps
//     for (var item in maps) {
//       //  final ayaEbraModel = ayaEbraModelFromJson(item.);
//       // item.map((key, value) {

//       // });
//       //
//       debugPrint('numberInSurah ${item['numberInSurah']}');
//     }
//     notifyListeners();
//   }
// }
