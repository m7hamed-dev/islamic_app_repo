// To parse this JSON data, do
//
//     final hisnModel = hisnModelFromJson(jsonString);

import 'dart:convert';

HisnModel hisnModelFromJson(String str) => HisnModel.fromJson(json.decode(str));

class HisnModel {
  HisnModel({required this.english});

  List<English> english;

  factory HisnModel.fromJson(Map<String, dynamic> json) => HisnModel(
        english:
            List<English>.from(json["English"].map((x) => English.fromJson(x))),
      );
}

class English {
  English({
    required this.id,
    required this.title,
    required this.audioUrl,
    required this.text,
  });

  int id;
  String title;
  String audioUrl;
  List<MText> text;

  factory English.fromJson(Map<String, dynamic> json) => English(
        id: json["ID"],
        title: json["TITLE"],
        audioUrl: json["AUDIO_URL"],
        text: List<MText>.from(json["TEXT"].map((x) => MText.fromJson(x))),
      );
}

class MText {
  MText({
    required this.id,
    required this.arabicText,
    required this.languageArabicTranslatedText,
    required this.translatedText,
    required this.repeat,
    required this.audio,
    required this.text,
  });

  int id;
  String arabicText;
  String languageArabicTranslatedText;
  String translatedText;
  int repeat;
  String audio;
  String text;

  factory MText.fromJson(Map<String, dynamic> json) => MText(
        id: json["ID"],
        arabicText: json["ARABIC_TEXT"] ?? '',
        languageArabicTranslatedText:
            json["LANGUAGE_ARABIC_TRANSLATED_TEXT"] ?? '',
        translatedText: json["TRANSLATED_TEXT"] ?? '',
        repeat: json["REPEAT"],
        audio: json["AUDIO"],
        text: json["Text"] ?? '',
      );
}
