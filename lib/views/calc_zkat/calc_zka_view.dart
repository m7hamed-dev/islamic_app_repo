import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';
import 'package:quran/tools/push.dart';
import 'package:quran/widgets/custom_card.dart';
import 'package:quran/widgets/txt.dart';
import 'zkat_controller.dart';

class ZkatView extends StatelessWidget {
  const ZkatView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const ListViewCategoryZkat(),
    );
  }
}

class CalcZkatView extends StatelessWidget {
  const CalcZkatView({Key? key, required this.index}) : super(key: key);
  final int index;
  @override
  Widget build(BuildContext context) {
    final zkatController = context.watch<ZkatController>();
    return Scaffold(
      body: zkatController.contentPage(index),
    );
  }
}

class ListViewCategoryZkat extends StatelessWidget {
  const ListViewCategoryZkat({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 10.0,
        crossAxisSpacing: 10.0,
      ),
      itemCount: ZkatController().categories.length,
      itemBuilder: (context, index) {
        return CustomCard(
          onTap: () => Push.to(context, CalcZkatView(index: index)),
          child: Txt(
            ZkatController().categories[index],
            isUseFontSizePrefs: false,
            fontSize: 16.0,
          ),
        );
      },
    );
  }
}
