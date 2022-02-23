import 'dart:convert';

List<SurahNameModel> surahNameModelFromJson(String str) =>
    List<SurahNameModel>.from(
      json.decode(str).map((x) => SurahNameModel.fromJson(x)),
    );

class SurahNameModel {
  SurahNameModel({
    required this.id,
    required this.name,
  });

  String id;
  String name;

  factory SurahNameModel.fromJson(Map<String, dynamic> json) => SurahNameModel(
        id: json["id"],
        name: json["name"],
      );
}
