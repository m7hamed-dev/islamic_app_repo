import 'dart:convert';

List<IrshadModel> irshadModelFromJson(String str) => List<IrshadModel>.from(
    json.decode(str).map((x) => IrshadModel.fromJson(x)));

class IrshadModel {
  IrshadModel({required this.title});

  final String title;

  factory IrshadModel.fromJson(Map<String, dynamic> json) => IrshadModel(
        title: json["title"],
      );
}
