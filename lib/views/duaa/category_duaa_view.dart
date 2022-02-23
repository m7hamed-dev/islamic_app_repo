import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';
import 'package:quran/views/duaa/duaa_categories_listview.dart';
import 'package:quran/views/lang/icon_change_lang.dart';
import 'package:quran/widgets/icon_show_bottomnavigation.dart';
import 'package:quran/widgets/input.dart';
import 'package:quran/widgets/navigation_bottom_settings.dart';
import 'duaa_controller.dart';

class CategoryDuaaView extends StatelessWidget {
  const CategoryDuaaView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final DuaaController _duaaController = context.watch<DuaaController>();
    return Scaffold(
      appBar: AppBar(
        actions: const [
          IconShowBottomNavigation(),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Input(
              hintText: 'search',
              onChanged: (value) => _duaaController.search(value),
              prefixIcon: _duaaController.valueDuaa.isNotEmpty
                  ? InkWell(
                      onTap: () {
                        _duaaController.valueDuaa = '';
                      },
                      child: const Icon(Icons.clear),
                    )
                  : const SizedBox(width: 0.0, height: 0.0),
            ),
            const SizedBox(height: 30.0),
            const Expanded(child: DuaaCategoriesListView()),
          ],
        ),
      ),
      bottomNavigationBar: const NavigationBbottomSettings(),
    );
  }
}
