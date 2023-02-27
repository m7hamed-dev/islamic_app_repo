// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart' show rootBundle;
// import 'package:quran/widgets/icon_show_bottomnavigation.dart';
// import 'package:quran/widgets/navigation_bottom_settings.dart';
// import '../../global/custom_app_bar_shape.dart';
// import '../../widgets/app_bar_title.dart';
// import 'hisn_model.dart';
// import 'listview_hisn.dart';

// class HisnView extends StatefulWidget {
//   const HisnView({Key? key}) : super(key: key);
//   static const pageName = '/HisnView';
//   @override
//   State<HisnView> createState() => _HisnViewState();
// }

// class _HisnViewState extends State<HisnView> {
//   //
//   Future _loadListZkr() async {
//     String jsonString = await rootBundle.loadString('assets/json/hisn.json');
//     // print('raw = $jsonString');
//     final hisnModel = hisnModelFromJson(jsonString).english;
//     // print(
//     //     '============================ \n ${hisnModel.english.length} \n ============================');
//     if (!mounted) {
//       return;
//     } else {
//       _hisList = hisnModel;
//       setState(() {});
//     }
//   }

//   List<English> _hisList = [];
//   //
//   @override
//   void initState() {
//     super.initState();
//     _loadListZkr();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const AppBarTitle('hisn english'),
//         shape: CustomAppBarShape(),
//         actions: const [IconShowBottomNavigation()],
//       ),
//       body: ListviewHisn(hisnList: _hisList),
//       bottomNavigationBar: const NavigationBbottomSettings(),
//     );
//   }
// }
