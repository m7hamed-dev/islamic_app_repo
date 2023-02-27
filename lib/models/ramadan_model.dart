import 'dart:convert';

List<RamadanModel> ramadanModelFromJson(String str) => List<RamadanModel>.from(
    json.decode(str).map((x) => RamadanModel.fromJson(x)));

class RamadanModel {
  RamadanModel({required this.title, required this.items});

  final String title;
  final List<String> items;

  factory RamadanModel.fromJson(Map<String, dynamic> json) => RamadanModel(
        title: json["title"],
        items: List<String>.from(json["items"].map((x) => x)),
      );
}
