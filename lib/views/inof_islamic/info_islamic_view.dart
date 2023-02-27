import 'package:flutter/material.dart';
import 'package:quran/widgets/icon_show_bottomnavigation.dart';
import 'package:quran/widgets/navigation_bottom_settings.dart';
import '../../global/custom_app_bar_shape.dart';
import '../../widgets/app_bar_title.dart';
import '../../widgets/icon_leading.dart';
import 'info_islamic_listview.dart';

class InfoIslamicView extends StatelessWidget {
  const InfoIslamicView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const AppBarTitle('معلومات إسلاميه'),
          leading: const IconLeading(),
          actions: const [
            IconShowBottomNavigation(),
          ],
          shape: CustomAppBarShape(),
        ),
        body: const InfoIslamicListView(),
        bottomNavigationBar: const NavigationBbottomSettings(),
      );
}
