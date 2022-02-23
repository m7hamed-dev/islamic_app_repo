import 'package:flutter/material.dart';
import 'package:quran/widgets/navigation_bottom_settings.dart';
import 'info_islamic_listview.dart';

class InfoIslamicView extends StatelessWidget {
  const InfoIslamicView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => const Scaffold(
        body: InfoIslamicListView(),
        bottomNavigationBar: NavigationBbottomSettings(),
      );
}
