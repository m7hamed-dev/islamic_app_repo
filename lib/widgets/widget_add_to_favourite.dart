import 'package:flutter/material.dart';
import 'package:quran/views/favourit/db_helper.dart';
import 'package:quran/views/favourit/favourit_model.dart';
import 'btn.dart';

class WidgetAddToFavourit extends StatelessWidget {
  const WidgetAddToFavourit({Key? key, required this.favouritModel})
      : super(key: key);
  final FavouritModel favouritModel;
  @override
  Widget build(BuildContext context) {
    return Btn(
      color: Colors.white,
      padding: const EdgeInsets.all(10),
      shape: const CircleBorder(),
      child: const Icon(Icons.favorite, color: Colors.red),
      onPressed: () => DbHelper.addToFavourit(favouritModel),
    );
  }
}
