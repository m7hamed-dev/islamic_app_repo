import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';
import 'package:quran/tools/push.dart';
import 'package:quran/widgets/txt.dart';
import 'zkat_controller.dart';

class ZkatView extends StatelessWidget {
  const ZkatView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: ListViewCategoryZkat(),
    );
  }
}

class CalcZkatView extends StatelessWidget {
  const CalcZkatView({Key? key, required this.index}) : super(key: key);
  final int index;
  @override
  Widget build(BuildContext context) {
    final zkatController = context.watch<ZkatController>();
    //
    return Scaffold(
      // title: zkatController.pageTitle,
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
        return InkWell(
          onTap: () => Push.to(context, CalcZkatView(index: index)),
          child: Container(
            margin: const EdgeInsets.all(5.0),
            alignment: Alignment.center,
            child: Txt(
              ZkatController().categories[index],
              color: Colors.black,
            ),
          ),
        );
      },
    );
  }
}
