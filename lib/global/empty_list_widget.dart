import 'package:flutter/material.dart';
import 'package:quran/widgets/custom_loading.dart';

class EmptyListWidget<T> {
  Widget checkList(List<T> list, Widget child, {String? msg}) {
    if (list.isEmpty) {
      return const CustomLoading();
    }
    return child;
  }
}
