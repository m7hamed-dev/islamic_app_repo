// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:permission_handler/permission_handler.dart';
// import 'package:provider/provider.dart';
// import 'package:quran/animation/bottom_animation.dart';
// import 'package:quran/models/data.dart';
// import 'package:http/http.dart' as http;
// import 'package:quran/views/prayer/widget_location_disable.dart';
// import 'package:quran/widgets/custom_card.dart';
// import 'package:quran/widgets/custom_loading.dart';
// import 'package:quran/widgets/icon_leading.dart';
// import 'package:quran/widgets/txt.dart';
// import '../../tools/json_connection.dart';
// import '../../tools/utils.dart';
// import '../../widgets/btn.dart';

// class PrayTimes extends StatefulWidget {
//   const PrayTimes({Key? key}) : super(key: key);

//   @override
//   _PrayTimesState createState() => _PrayTimesState();
// }

// class _PrayTimesState extends State<PrayTimes> {
//   ///
//   final JsonConnection jsonConnection = JsonConnection();
//   late Data list;

//   ///
//   static String city = 'Dammam';
//   static String country = 'Saudi Arabia';
//   static int method = 4;

//   final String url =
//       'http://api.aladhan.com/v1/timingsByCity?city=$city&country=$country&method=$method';

//   final _header = {
//     "Accept":
//         "text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8"
//   };
//   Future getPTData() async {
//     http.Response res = await http.get(
//       Uri.parse(Uri.encodeFull(url)),
//       headers: _header,
//     );
//     final data = jsonDecode(res.body);
//     list = Data.fromJson(data);
//     return list;
//   }

//   @override
//   void initState() {
//     // checkPermisstion();
//     // context.read<LocationServiceProvider>().locationIsEnabledAPI();
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: Consumer<LocationServiceProvider>(
//           builder: (context, locationService, _) {
//             // service disable
//             if (!locationService.serviceEnabled) {
//               return const WidgetLocationDisable();
//             }
//             //
//             if (!locationService.isGranted) {
//               return Btn(
//                 // height: 60.0,
//                 margin: const EdgeInsets.all(5.0),
//                 padding: const EdgeInsets.all(10.0),
//                 onPressed: locationService.checkPermissionsAPI,
//                 child: const Txt(
//                   'الرجاء التأكد من فتح الموقع الخاص بهاتفك ومن ثم من صلاحية الوصول',
//                   isUseFontSizePrefs: false,
//                   fontSize: 16.0,
//                   color: Colors.white,
//                 ),
//               );
//             }
//             //
//             if (locationService.locationPermission ==
//                 PermissionStatus.denied) {
//               return Padding(
//                 padding: const EdgeInsets.all(20.0),
//                 child: Btn(
//                   height: 60.0,
//                   onPressed: () async {
//                     await Permission.location.request();
//                   },
//                   child: Txt(
//                     locationService.locationPermission.name,
//                     isUseFontSizePrefs: false,
//                     fontSize: 20.0,
//                     color: Colors.white,
//                   ),
//                 ),
//               );
//             }
//             //
//             if (locationService.isGranted && locationService.serviceEnabled) {
//               return FutureBuilder<Data>(
//                 future: jsonConnection.getPTLocation(),
//                 builder:
//                     (BuildContext context, AsyncSnapshot<Data> snapshot) {
//                   debugPrint('snapshot tracker ${snapshot.data}');
//                   if (snapshot.data == null) {
//                     debugPrint('case 0');

//                     return const CustomLoading();
//                   }
//                   if (snapshot.hasData) {
//                     // if (snapshot.data != null) {
//                     debugPrint('snap = ${snapshot.data}');
//                     return CustomScrollView(
//                       physics: const BouncingScrollPhysics(),
//                       slivers: [
//                         SliverAppBar(
//                           expandedHeight: 200,
//                           stretch: true,
//                           leading: const IconLeading(),
//                           backgroundColor: Colors.transparent,
//                           flexibleSpace: FlexibleSpaceBar(
//                             collapseMode: CollapseMode.parallax,
//                             stretchModes: const [
//                               StretchMode.zoomBackground,
//                               StretchMode.blurBackground,
//                               StretchMode.fadeTitle,
//                             ],
//                             background: Stack(
//                               children: [
//                                 Container(
//                                   decoration: const BoxDecoration(
//                                     image: DecorationImage(
//                                       image: AssetImage(
//                                         'assets/home/mos.jpg',
//                                         // width: ScreenUtil.getWidth(context),
//                                       ),
//                                       fit: BoxFit.cover,
//                                     ),
//                                     borderRadius: BorderRadius.only(
//                                       bottomLeft: Radius.circular(30.0),
//                                       bottomRight: Radius.circular(30.0),
//                                     ),
//                                   ),
//                                 ),
//                                 Positioned(
//                                   top: 20.0,
//                                   left: 5.0,
//                                   child: Txt(
//                                     // snapshot.data!.data.date.hijri.day,
//                                     snapshot.data!.data.meta.timezone,
//                                     isUseFontSizePrefs: false,
//                                     fontSize: 25.0,
//                                   ),
//                                 )
//                               ],
//                             ),
//                           ),
//                         ),
//                         SliverList(
//                           delegate: SliverChildBuilderDelegate(
//                             ((context, index) {
//                               return CardAzan(
//                                 timesDate: [
//                                   snapshot.data!.data.timings.fajr,
//                                   snapshot.data!.data.timings.sunrise,
//                                   snapshot.data!.data.timings.dhuhr,
//                                   snapshot.data!.data.timings.asr,
//                                   snapshot.data!.data.timings.maghrib,
//                                   snapshot.data!.data.timings.isha,
//                                 ],
//                               );
//                             }),
//                             childCount: 1,
//                           ),
//                         ),
//                       ],
//                     );
//                     // }
//                   }
//                   debugPrint('snap = ${snapshot.data}');
//                   return const CircularProgressIndicator();
//                 },
//               );
//             }
//             return const SizedBox();
//           },
//         ),
//       ),
//     );
//   }
// }

// class CardAzan extends StatefulWidget {
//   const CardAzan({Key? key, required this.timesDate}) : super(key: key);
//   //
//   final List<String> timesDate;
//   //
//   @override
//   State<CardAzan> createState() => _CardAzanState();
// }

// class _CardAzanState extends State<CardAzan> {
//   //
//   final List<String> times = <String>[
//     'fajr',
//     'sunrise',
//     'dhuhr',
//     'asr',
//     'maghrib',
//     'isha',
//   ];

//   String _singleValue(List<String> items, int index) => items[index];
//   //
//   @override
//   Widget build(BuildContext context) {
//     return ListView.builder(
//       shrinkWrap: true,
//       physics: const NeverScrollableScrollPhysics(),
//       itemCount: widget.timesDate.length,
//       itemBuilder: (context, index) {
//         return BottomAnimator(
//           time: Duration(milliseconds: 400 + index * 100),
//           child: CustomCard(
//             padding: const EdgeInsets.all(8.0),
//             child: ListTile(
//               contentPadding: EdgeInsets.zero,
//               leading: Image.asset(
//                 Utils.getImageByPrayerName(_singleValue(times, index)),
//                 width: 40.0,
//               ),
//               title: Txt(
//                 Utils.translateToArabic(_singleValue(times, index)),
//                 isUseFontSizePrefs: false,
//                 fontSize: 17.0,
//                 color: Colors.grey,
//               ),
//               subtitle: Txt(
//                 _singleValue(widget.timesDate, index),
//                 isUseFontSizePrefs: false,
//                 fontSize: 22.0,
//               ),
//             ),
//           ),
//         );
//       },
//     );
//   }
// }
