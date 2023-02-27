import 'dart:convert';
//     final ayaEbraModel = ayaEbraModelFromJson(jsonString);

List<AyaEbraModel> ayaEbraModelFromJson(String str) => List<AyaEbraModel>.from(
    json.decode(str).map((x) => AyaEbraModel.fromJson(x)));

class AyaEbraModel {
  const AyaEbraModel({required this.aya, required this.ebra});

  final String aya;
  final String ebra;

  factory AyaEbraModel.fromJson(Map<String, dynamic> json) => AyaEbraModel(
        aya: json["aya"],
        ebra: json["ebra"],
      );
}
