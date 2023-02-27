// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:quran/views/favourit/db_helper.dart';
// import 'package:quran/views/favourit/favourit_model.dart';
// import 'package:quran/widgets/circular_icon.dart';

// class WidgetAddToFavourit extends StatelessWidget {
//   //
//   const WidgetAddToFavourit({Key? key, required this.favouritModel})
//       : super(key: key);
//   //
//   final FavouritModel favouritModel;
//   //
//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       child: const CircleIcon(
//         icon: Icons.favorite,
//       ),
//       onTap: () {
//         context.read<DbHelper>().addToFavourit(context, favouritModel);
//       },
//     );
//   }
// }
