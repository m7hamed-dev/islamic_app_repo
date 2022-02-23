// // class Surah {
// //   int? number;
// //   String? arabic;
// //   String? latin;
// //   String? name;
// //   int? totalAyah;
// //   Map<String, dynamic>? ayah;
// //   Map<String, dynamic>? translation;
// //   Map<String, dynamic>? tafsir;

// //   Surah(
// //       {this.number,
// //       this.arabic,
// //       this.name,
// //       this.latin,
// //       this.totalAyah,
// //       this.ayah,
// //       this.translation,
// //       this.tafsir});

// //   factory Surah.fromJson(Map<String, dynamic> json) {
// //     return Surah(
// //       number: int.parse(json['number']),
// //       arabic: json['name'],
// //       name: json['translations']['id']['name'],
// //       latin: json['name_latin'],
// //       totalAyah: int.parse(json['number_of_ayah']),
// //       ayah: json['text'],
// //       translation: json['translations']['id']['text'],
// //       tafsir: json['tafsir']['id']['kemenag']['text'],
// //     );
// //   }
// // }

// /*---------------------------------------  Surah Model  --------------------------------------*/
// /*-----------------------------------------------------------------------------------------------*/
// class Surah {
//   String place;
//   String type;
//   int count;
//   String title;
//   String titleAr;
//   String index;
//   int pages;
//   int pageIndex;
//   String juzIndex;

//   Surah(
//       {required this.place,
//       required this.type,
//       required this.count,
//       required this.title,
//       required this.titleAr,
//       required this.index,
//       required this.pages,
//       required this.pageIndex,
//       required this.juzIndex});

//   /*-----------------------------------------------------------------------------------------------*/
//   /*---------------------------------------  model from json  --------------------------------------*/
//   /*-----------------------------------------------------------------------------------------------*/
//   factory Surah.fromJson(Map<String, dynamic> json) {
//     return Surah(
//       place: json['place'] as String,
//       type: json['type'] as String,
//       count: json['count'] as int,
//       title: json['title'] as String,
//       titleAr: json['titleAr'] as String,
//       index: json['index'] as String,
//       // reversed pages
//       pages: 569 - int.parse(json['pages']),
//       pageIndex: int.parse(json['pages']),
//       juzIndex: json['juzIndex'] as String,
//     );
//   }
// }
