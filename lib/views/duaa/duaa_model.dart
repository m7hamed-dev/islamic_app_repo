import 'dart:convert';

List<DuaaModel> duaaModelFromJson(String str) =>
    List<DuaaModel>.from(json.decode(str).map((x) => DuaaModel.fromJson(x)));

class DuaaModel {
  DuaaModel({
    required this.type,
    required this.details,
  });

  String type;
  List<Detail> details;

  factory DuaaModel.fromJson(Map<String, dynamic> json) => DuaaModel(
        type: json["type"],
        details:
            List<Detail>.from(json["details"].map((x) => Detail.fromJson(x))),
      );
}

class Detail {
  Detail({
    required this.title,
    required this.hsna,
    required this.count,
  });
  final String title;
  String hsna;
  int count;

  factory Detail.fromJson(Map<String, dynamic> json) => Detail(
        title: json["title"],
        hsna: json["hsna"],
        count: json["count"],
      );
}
