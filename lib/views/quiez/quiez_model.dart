//     final questionModel = questionModelFromJson(jsonString);
import 'dart:convert';

List<QuiezModel> questionModelFromJson(String str) =>
    List<QuiezModel>.from(json.decode(str).map((x) => QuiezModel.fromJson(x)));

class QuiezModel {
  QuiezModel({
    required this.id,
    required this.question,
    required this.options,
    required this.answer,
  });

  final int id;
  final String question;
  final int answer;
  final List<Options> options;

  factory QuiezModel.fromJson(Map<String, dynamic> json) {
    //
    return QuiezModel(
      // id: 1,
      id: json["id"],
      question: json["question"],
      answer: json["answer"],
      options:
          List<Options>.from(json["options"].map((x) => Options.fromJson(x))),
    );
  }
}

class Options {
  Options({required this.sugge});

  String sugge;

  factory Options.fromJson(Map<String, dynamic> json) => Options(
        sugge: json["sugge"],
      );
}
