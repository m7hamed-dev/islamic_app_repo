import 'dart:convert';

List<InfoIslamicModel> infoIslamicModelFromJson(String str) =>
    List<InfoIslamicModel>.from(
        json.decode(str).map((x) => InfoIslamicModel.fromJson(x)));

class InfoIslamicModel {
  InfoIslamicModel({required this.info});

  final String info;

  factory InfoIslamicModel.fromJson(Map<String, dynamic> json) =>
      InfoIslamicModel(
        info: json["info"],
      );
}
