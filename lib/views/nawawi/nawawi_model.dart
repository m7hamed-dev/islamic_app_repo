import 'dart:convert';

List<NawawiModel> nawawiModelFromJson(String str) => List<NawawiModel>.from(
    json.decode(str).map((x) => NawawiModel.fromJson(x)));

class NawawiModel {
  const NawawiModel({required this.description, required this.hadith});

  final String description;
  final String hadith;

  factory NawawiModel.fromJson(Map<String, dynamic> json) => NawawiModel(
        description: json["description"],
        hadith: json["hadith"],
      );
}
