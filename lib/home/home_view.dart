import 'package:flutter/material.dart';
import 'package:quran/home/widgets/home_widgets.dart';
import 'package:quran/widgets/app_bar_title.dart';
import 'package:quran/widgets/icon_islamic_info.dart';
import 'package:quran/widgets/icon_settings.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const AppBarTitle('الرئيسيه'),
          backgroundColor: Colors.transparent,
          actions: const [IconIslamicInfo(), Spacer(), IconSettings()],
        ),
        body: const HomeWidgets(),
      );
}
