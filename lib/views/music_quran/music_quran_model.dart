// To parse this JSON data, do
//
//     final quranMp3Model = quranMp3ModelFromJson(jsonString);

import 'dart:convert';

QuranMp3Model quranMp3ModelFromJson(String str) =>
    QuranMp3Model.fromJson(json.decode(str));

class QuranMp3Model {
  QuranMp3Model({required this.reciters});

  List<Reciter> reciters;

  factory QuranMp3Model.fromJson(Map<String, dynamic> json) => QuranMp3Model(
        reciters: List<Reciter>.from(
          json["reciters"].map(
            (x) => Reciter.fromJson(x),
          ),
        ),
      );
}

class Reciter {
  Reciter({
    required this.id,
    required this.name,
    required this.server,
    required this.rewaya,
    required this.count,
    required this.letter,
    required this.suras,
  });

  String id;
  String name;
  String server;
  String rewaya;
  String count;
  String letter;
  String suras;

  factory Reciter.fromJson(Map<String, dynamic> json) => Reciter(
        id: json["id"],
        name: json["name"],
        server: json["Server"],
        rewaya: json["rewaya"],
        count: json["count"],
        letter: json["letter"],
        suras: json["suras"] ,
      );
}
