import 'package:flutter/material.dart';
import 'package:quran/home/widgets/home_widgets.dart';
import 'package:quran/widgets/app_bar_title.dart';
import 'package:quran/widgets/icon_islamic_info.dart';
import 'package:quran/widgets/icon_settings.dart';
import '../global/custom_app_bar_shape.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          // backgroundColor: Colors.white,
          backgroundColor: Colors.transparent,
          actions: const [
            IconSettings(),
            IconIslamicInfo()
            // IconButton(
            //   onPressed: () {
            //     Push.to(context, const IconIslamicInfo());
            //   },
            //   icon: Icon(
            //     Icons.info_outline_rounded,
            //     color: DI.themeController(context).isDarkTheme
            //         ? Colors.white
            //         : DI.primaryColor(context),
            //   ),
            // )
          ],
          title: const AppBarTitle(
            'الرئيسيه',
            // color: Colors.transparent,
            // color: Colors.black,
          ),
          shape: CustomAppBarShape(),
        ),
        body: const HomeWidgets(),
      );
}
