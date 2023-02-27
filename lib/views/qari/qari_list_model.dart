// To parse this JSON data, do
//
//     final qariListModel = qariListModelFromJson(jsonString);

import 'dart:convert';

List<QariListModel> qariListModelFromJson(String str) =>
    List<QariListModel>.from(
        json.decode(str).map((x) => QariListModel.fromJson(x)));

class QariListModel {
  const QariListModel({
    this.id,
    this.name,
    this.arabicName,
    this.relativePath,
    this.fileFormats,
    this.sectionId,
    this.home,
    this.description,
    this.torrentFilename,
    this.torrentInfoHash,
    this.torrentSeeders,
    this.torrentLeechers,
  });

  final int? id;
  final String? name;
  final String? arabicName;
  final String? relativePath;
  final String? fileFormats;
  final int? sectionId;
  final bool? home;
  final String? description;
  final String? torrentFilename;
  final String? torrentInfoHash;
  final int? torrentSeeders;
  final int? torrentLeechers;

  factory QariListModel.fromJson(Map<String, dynamic> json) => QariListModel(
        id: json["id"],
        name: json["name"],
        arabicName: json["arabic_name"],
        relativePath: json["relative_path"],
        fileFormats: json["file_formats"],
        sectionId: json["section_id"],
        home: json["home"],
        description: json["description"],
        torrentFilename: json["torrent_filename"],
        torrentInfoHash: json["torrent_info_hash"],
        torrentSeeders: json["torrent_seeders"],
        torrentLeechers: json["torrent_leechers"],
      );
}
