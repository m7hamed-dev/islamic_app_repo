import 'dart:convert';

List<AsmaAllahModel> asmaAllahModelFromJson(String str) =>
    List<AsmaAllahModel>.from(
        json.decode(str).map((x) => AsmaAllahModel.fromJson(x)));

class AsmaAllahModel {
  AsmaAllahModel({
    required this.name,
    required this.meaning,
  });

  final String name;
  final String meaning;

  factory AsmaAllahModel.fromJson(Map<String, dynamic> json) => AsmaAllahModel(
        name: json["name"],
        meaning: json["meaning"],
      );
}
