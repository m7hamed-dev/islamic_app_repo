// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:quran/views/favourit/card_favouriet.dart';
// import 'package:quran/views/favourit/db_helper.dart';
// import 'package:quran/widgets/empty_widget.dart';
// import '../../global/custom_app_bar_shape.dart';
// import '../../widgets/app_bar_title.dart';

// //
// class FavouritView extends StatefulWidget {
//   const FavouritView({Key? key}) : super(key: key);
//   static const pageName = '/FavouritView';

//   @override
//   State<FavouritView> createState() => _FavouritViewState();
// }

// class _FavouritViewState extends State<FavouritView> {
//   @override
//   void initState() {
//     super.initState();
//     context.read<DbHelper>().fetchFavourites();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const AppBarTitle('مفضلتك'),
//         shape: CustomAppBarShape(),
//       ),
//       body: Consumer<DbHelper>(
//         builder: (context, value, _) {
//           if (value.favourites.isEmpty) {
//             return const EmptyWidget();
//           }
//           return ListView.builder(
//             itemCount: value.favourites.length,
//             itemBuilder: (BuildContext context, int index) {
//               return CardFavourit(title: value.favourites[index].title);
//             },
//           );
//         },
//       ),
//     );
//   }
// }
