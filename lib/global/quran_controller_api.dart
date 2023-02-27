import 'package:api_cache_manager/models/cache_db_model.dart';
import 'package:api_cache_manager/utils/cache_manager.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

class QuranAPI extends ChangeNotifier {
  // constructor
  QuranAPI() {
    getSurahList();
  }
  // static final _hiveBox = Hive.box('data');
  bool isLoading = true;
  bool isError = false;
  final surahLis = <Surah>[];
  //
  // final url = "http://api.alquran.";
  static const url = "http://api.alquran.cloud/v1/quran/quran-uthmanis";
  late Surah selectedSurah;
  //
  void setSurah(int index) {
    selectedSurah = surahLis[index];
    notifyListeners();
  }

  Future<bool> get _isAPICached async =>
      await APICacheManager().isAPICacheKeyExist('surah_list_cached_key');
  //
  Future<void> getSurahList() async {
    debugPrint('getSurahList() is calling ...');
    // final _dbHelper = context.read<DbHelper>();

    try {
      final isAPICacheKeyExist = await _isAPICached;
      // check is get from cached
      if (isAPICacheKeyExist) {
        debugPrint('is getting from cahced $isAPICacheKeyExist');
        final cachedData =
            await APICacheManager().getCacheData('surah_list_cached_key');
        //
        final surahs0 = quranOnlineModelFromJson(cachedData.syncData);
        //
        for (var item in surahs0.data.surahs) {
          surahLis.add(item);
        }
        isLoading = false;
        notifyListeners();
      } else {
        debugPrint('is getting from cahced $isAPICacheKeyExist');

        http.Response response = await http.get(Uri.parse(url));
        debugPrint(response.body);
        if (response.statusCode == 200) {
          final apiCacheDBModel = APICacheDBModel(
            key: 'surah_list_cached_key',
            syncData: response.body,
          );
          await APICacheManager().addCacheData(apiCacheDBModel);
          //
          final surahs = quranOnlineModelFromJson(response.body).data.surahs;
          //
          for (var item in surahs) {
            surahLis.add(item);
          }
          isLoading = false;
          notifyListeners();
        }
      }
    } catch (e) {
      debugPrint('exception $e');
      isLoading = false;
      isError = true;
      notifyListeners();
    }
  }

  // static Future<SajdaList> getSajda() async {
  //   String url = "http://api.alquran.cloud/v1/sajda/quran-uthmani";
  //   final response = await http.get(Uri.parse(url));

  //   if (response.statusCode == 200) {
  //     // cache in Hive
  //     await _hiveBox.put(
  //       'sajdaList',
  //       SajdaList.fromJSON(
  //         json.decode(response.body),
  //       ),
  //     );

  //     return SajdaList.fromJSON(json.decode(response.body));
  //   } else {
  //     throw Exception("Failed  to Load Post");
  //   }
  // }

  // static Future<JuzList> getJuzz(int? index) async {
  //   String url = "http://api.alquran.cloud/v1/juz/$index/quran-uthmani";

  //   final response = await http.get(
  //     Uri.parse(url),
  //   );

  //   if (response.statusCode == 200) {
  //     // cache in Hive
  //     await _hiveBox.put(
  //       'juzList$index',
  //       JuzList.fromJSON(
  //         json.decode(response.body),
  //       ),
  //     );

  //     return JuzList.fromJSON(json.decode(response.body));
  //   } else {
  //     throw Exception("Failed  to Load Post");
  //   }
  // }
  //
}

QuranOnlineModel quranOnlineModelFromJson(String str) =>
    QuranOnlineModel.fromJson(json.decode(str));

class QuranOnlineModel {
  QuranOnlineModel({
    required this.code,
    required this.status,
    required this.data,
  });

  final int code;
  final String status;
  final Data data;

  factory QuranOnlineModel.fromJson(Map<String, dynamic> json) =>
      QuranOnlineModel(
        code: json["code"],
        status: json["status"],
        data: Data.fromJson(json["data"]),
      );
}

class Data {
  const Data({required this.surahs, required this.edition});

  final List<Surah> surahs;
  final Edition edition;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        surahs: List<Surah>.from(json["surahs"].map((x) => Surah.fromJson(x))),
        edition: Edition.fromJson(json["edition"]),
      );
}

class Edition {
  Edition({
    required this.identifier,
    required this.language,
    required this.name,
    required this.englishName,
    required this.format,
    required this.type,
  });

  String identifier;
  String language;
  String name;
  String englishName;
  String format;
  String type;

  factory Edition.fromJson(Map<String, dynamic> json) => Edition(
        identifier: json["identifier"],
        language: json["language"],
        name: json["name"],
        englishName: json["englishName"],
        format: json["format"],
        type: json["type"],
      );
}

class Surah {
  //
  const Surah({
    required this.number,
    required this.name,
    required this.englishName,
    required this.englishNameTranslation,
    required this.revelationType,
    required this.ayahs,
  });

  final int number;
  final String name;
  final String englishName;
  final String englishNameTranslation;
  final String revelationType;
  final List<Ayah> ayahs;

  factory Surah.fromJson(Map<String, dynamic> json) => Surah(
        number: json["number"],
        name: json["name"],
        englishName: json["englishName"],
        englishNameTranslation: json["englishNameTranslation"],
        revelationType: json["revelationType"],
        ayahs: List<Ayah>.from(json["ayahs"].map((x) => Ayah.fromJson(x))),
      );
  //
  Map<String, dynamic> toJson() => {
        "number": number,
        "name": name,
        "englishName": englishName,
        "englishNameTranslation": englishNameTranslation,
        "revelationType": revelationType,
        "ayahs": List<dynamic>.from(ayahs.map((x) => x.toJson())),
      };
}

class Ayah {
  //
  const Ayah({
    required this.number,
    required this.text,
    required this.numberInSurah,
    required this.juz,
    required this.manzil,
    required this.page,
    required this.ruku,
    required this.hizbQuarter,
    required this.sajda,
  });

  final int number;
  final String text;
  final int numberInSurah;
  final int juz;
  final int manzil;
  final int page;
  final int ruku;
  final int hizbQuarter;
  final dynamic sajda;

  factory Ayah.fromJson(Map<String, dynamic> json) => Ayah(
        number: json["number"],
        text: json["text"],
        numberInSurah: json["numberInSurah"],
        juz: json["juz"],
        manzil: json["manzil"],
        page: json["page"],
        ruku: json["ruku"],
        hizbQuarter: json["hizbQuarter"],
        sajda: json["sajda"],
      );

  Map<String, dynamic> toJson() => {
        "number": number,
        "text": text,
        "numberInSurah": numberInSurah,
        "juz": juz,
        "manzil": manzil,
        "page": page,
        "ruku": ruku,
        "hizbQuarter": hizbQuarter,
        "sajda": sajda,
      };
}

class SajdaClass {
  const SajdaClass({
    required this.id,
    required this.recommended,
    required this.obligatory,
  });

  final int id;
  final bool recommended;
  final bool obligatory;

  factory SajdaClass.fromJson(Map<String, dynamic> json) => SajdaClass(
        id: json["id"],
        recommended: json["recommended"],
        obligatory: json["obligatory"],
      );
}
