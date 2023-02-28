import 'package:flutter/material.dart';
import 'package:quran/home/widgets/home_widgets.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) => const Scaffold(
        // appBar: AppBar(
        //   title: const AppBarTitle('الرئيسيه'),
        //   // backgroundColor: Colors.transparent,
        //   actions: const [IconIslamicInfo(), Spacer(), IconSettings()],
        // ),
        body: HomeWidgets(),
      );
}
