// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:quran/animation/bottom_animation.dart';
// import 'package:quran/global/depency_injection.dart';
// import 'package:quran/global/empty_list_widget.dart';
// import 'package:quran/tools/constants.dart';
// import 'package:quran/views/ramadan/ramadan_controller.dart';
// import 'package:quran/widgets/app_bar_title.dart';
// import 'package:quran/widgets/custom_card.dart';
// import 'package:quran/widgets/icon_leading.dart';
// import 'package:quran/widgets/icon_show_bottomnavigation.dart';
// import 'package:quran/widgets/navigation_bottom_settings.dart';
// import 'package:quran/widgets/row_multi_process.dart';
// import 'package:quran/widgets/txt.dart';
// import 'package:sticky_headers/sticky_headers.dart';
// import '../../global/custom_app_bar_shape.dart';
// import '../../models/ramadan_model.dart';

// class RamadanView extends StatelessWidget {
//   const RamadanView({Key? key}) : super(key: key);

//   ///
//   @override
//   Widget build(BuildContext context) {
//     //
//     return Scaffold(
//       appBar: AppBar(
//         title: const AppBarTitle('رمضانيات'),
//         actions: const [IconShowBottomNavigation()],
//         shape: CustomAppBarShape(),
//         leading: const IconLeading(),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: Consumer<RamadanController>(
//           builder: (context, _controller, _) {
//             //
//             return EmptyListWidget<RamadanModel>().checkList(
//               _controller.benefits,
//               ListView.builder(
//                 physics: Constants.bouncScrollPhysics,
//                 itemCount: _controller.benefits.length,
//                 itemBuilder: (BuildContext context, int index) {
//                   return StickyHeader(
//                     header: Container(
//                       height: 50.0,
//                       padding: const EdgeInsets.symmetric(horizontal: 16.0),
//                       margin: const EdgeInsets.symmetric(horizontal: 16.0),
//                       alignment: Alignment.center,
//                       decoration: BoxDecoration(
//                         color: DI.primaryColor(context),
//                         // color: Colors.blueGrey[700],
//                         borderRadius: const BorderRadius.only(
//                           topLeft: Radius.circular(10.0),
//                           topRight: Radius.circular(10.0),
//                         ),
//                       ),
//                       child: Txt(
//                         _controller.benefits[index].title,
//                         isUseFontSizePrefs: false,
//                         fontSize: 22.0,
//                         color: Colors.white,
//                       ),
//                     ),
//                     content: Column(
//                       children: _controller.benefits[index].items
//                           .map((e) {
//                             return CustomCard(
//                               child: Column(
//                                 children: [
//                                   Txt(
//                                     e,
//                                     textAlign: TextAlign.center,
//                                     // isUseFontSizePrefs: false,
//                                   ),
//                                   RowMultiProcess(
//                                     text: e,
//                                     title: 'رمضانيات',
//                                     hsna: '',
//                                     titleFavourit: 'false',
//                                   )
//                                 ],
//                               ),
//                             );
//                           })
//                           .toList()
//                           .map((e) {
//                             return BottomAnimator(
//                               child: e,
//                               time: Duration(milliseconds: 100 * 5 + index),
//                             );
//                           })
//                           .toList(),
//                     ),
//                   );
//                 },
//               ),
//             );
//           },
//         ),
//       ),
//       
//     );
//   }
// }
