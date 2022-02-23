// To parse this JSON data, do
//
//     final surahModel = surahModelFromJson(jsonString);

import 'dart:convert';

List<SurahModel> surahModelFromJson(String str) =>
    List<SurahModel>.from(json.decode(str).map((x) => SurahModel.fromJson(x)));

class SurahModel {
  SurahModel({
    required this.place,
    required this.type,
    required this.count,
    required this.title,
    required this.titleAr,
    required this.index,
    required this.pages,
    required this.juz,
    required this.pageIndex,
  });

  String place;
  String type;
  int count;
  String title;
  String titleAr;
  String index;
  dynamic pages;
  dynamic pageIndex;
  List<Juz> juz;
  //  pages: 569 - int.parse(json['pages']),
//       pageIndex: int.parse(json['pages']),

  factory SurahModel.fromJson(Map<String, dynamic> json) => SurahModel(
        place: json["place"],
        type: json["type"],
        count: json["count"],
        title: json["title"],
        titleAr: json["titleAr"],
        index: json["index"],
        pages: 569 - int.parse(json['pages']),
        pageIndex: int.parse(json['pages']),
        // pages: json["pages"],
        juz: List<Juz>.from(json["juz"].map((x) => Juz.fromJson(x))),
      );
}

class Juz {
  Juz({
    required this.index,
    required this.verse,
  });

  String index;
  Verse verse;

  factory Juz.fromJson(Map<String, dynamic> json) => Juz(
        index: json["index"],
        verse: Verse.fromJson(json["verse"]),
      );
}

class Verse {
  Verse({
    required this.start,
    required this.end,
  });

  String start;
  String end;

  factory Verse.fromJson(Map<String, dynamic> json) => Verse(
        start: json["start"],
        end: json["end"],
      );
}
