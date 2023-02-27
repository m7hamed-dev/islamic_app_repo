import 'package:flutter/material.dart';
import 'package:quran/global/custom_app_bar_shape.dart';
import 'package:quran/views/duaa/duaa_categories_listview.dart';
import 'package:quran/widgets/icon_show_bottomnavigation.dart';
import 'package:quran/widgets/navigation_bottom_settings.dart';
import '../../widgets/app_bar_title.dart';
import '../../widgets/icon_leading.dart';

class CategoryDuaaView extends StatelessWidget {
  const CategoryDuaaView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const AppBarTitle('أقسام الأدعية'),
        leading: const IconLeading(),
        actions: const [
          IconShowBottomNavigation(),
        ],
        // shape: CustomAppBarShape(),
      ),
      body: const DuaaCategoriesListView(),
      bottomNavigationBar: const NavigationBbottomSettings(),
    );
  }
}
