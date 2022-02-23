import 'package:flutter/material.dart';
import 'package:quran/home/widgets/home_widgets.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);
  static const pageName = '/';

  ///
  @override
  Widget build(BuildContext context) => const Scaffold(
        body: SafeArea(child: HomeWidgets()),
      );
}
