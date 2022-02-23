import 'package:flutter/material.dart';
import 'package:quran/widgets/navigation_bottom_settings.dart';
import 'listview_irshad.dart';

class IrshadView extends StatelessWidget {
  const IrshadView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const ListviewIrshad(),
      bottomNavigationBar: const NavigationBbottomSettings(),
    );
  }
}
