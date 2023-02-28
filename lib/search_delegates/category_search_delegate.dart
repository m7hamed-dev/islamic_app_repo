import 'package:flutter/material.dart';
import 'package:quran/views/duaa/duaa_model.dart';
import 'package:quran/widgets/txt.dart';

class CategorySearchDelegate extends SearchDelegate<DuaaModel> {
  //
  CategorySearchDelegate({required this.list});
  //
  final List<Detail> list;
  //
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () => query = '',
        icon: const Icon(Icons.close),
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    //
    return IconButton(
      onPressed: () => Navigator.pop(context),
      icon: const Icon(Icons.arrow_back_ios),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    List<Detail> categorisList = [];
    //
    for (var item in list) {
      if (item.title.contains(query)) {
        categorisList.add(
          Detail(
            title: item.title,
            hsna: item.hsna,
            count: item.count,
            rawie: '',
          ),
        );
      }
    }
    return ListView.builder(
      itemCount: list.length,
      itemBuilder: (BuildContext context, int index) {
        return Txt(categorisList[index].title);
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<Detail> categorisList = [];
    //
    for (var item in list) {
      if (item.title.contains(query)) {
        categorisList.add(
          Detail(
            title: item.title,
            hsna: item.hsna,
            count: item.count,
            rawie: '',
          ),
        );
      }
    }
    return ListView.builder(
      itemCount: list.length,
      itemBuilder: (BuildContext context, int index) {
        return Txt(categorisList[index].title);
      },
    );
  }
}
