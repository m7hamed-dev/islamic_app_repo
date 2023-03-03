//     final arabicName = arabicNameFromJson(jsonString);

import 'dart:convert';

ArabicName arabicNameFromJson(String str) =>
    ArabicName.fromJson(json.decode(str));

class ArabicName {
  const ArabicName({required this.quran});

  final List<Quran> quran;

  factory ArabicName.fromJson(Map<String, dynamic> json) => ArabicName(
        quran: List<Quran>.from(json["quran"].map((x) => Quran.fromJson(x))),
      );
}

class Quran {
  Quran({
    required this.id,
    required this.jozz,
    required this.suraNo,
    required this.suraNameEn,
    required this.suraNameAr,
    required this.page,
    required this.lineStart,
    required this.lineEnd,
    required this.ayaNo,
    required this.ayaText,
    required this.ayaTextEmlaey,
  });

  int id;
  int jozz;
  int suraNo;
  String suraNameEn;
  String suraNameAr;
  int page;
  int lineStart;
  int lineEnd;
  int ayaNo;
  String ayaText;
  String ayaTextEmlaey;

  factory Quran.fromJson(Map<String, dynamic> json) => Quran(
        id: json["id"],
        jozz: json["jozz"],
        suraNo: json["sura_no"],
        suraNameEn: json["sura_name_en"],
        suraNameAr: json["sura_name_ar"],
        page: json["page"],
        lineStart: json["line_start"],
        lineEnd: json["line_end"],
        ayaNo: json["aya_no"],
        ayaText: json["aya_text"],
        ayaTextEmlaey: json["aya_text_emlaey"],
      );
}
