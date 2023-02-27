import 'package:flutter/material.dart';
import 'package:quran/widgets/icon_leading.dart';
import 'package:quran/widgets/icon_show_bottomnavigation.dart';
import 'package:quran/widgets/navigation_bottom_settings.dart';
import '../../global/custom_app_bar_shape.dart';
import '../../widgets/app_bar_title.dart';
import 'listview_irshad.dart';

class IrshadView extends StatefulWidget {
  const IrshadView({Key? key}) : super(key: key);

  @override
  State<IrshadView> createState() => _IrshadViewState();
}

class _IrshadViewState extends State<IrshadView> {
  final scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: const AppBarTitle('نصايح وإرشادات'),
          actions: const [IconShowBottomNavigation()],
          shape: CustomAppBarShape(),
          leading: const IconLeading(),
        ),
        body: const ListviewIrshad(),
        // floatingActionButton: const ScrollTopBottom(),
        bottomNavigationBar: const NavigationBbottomSettings(),
      ),
    );
  }

  @override
  void dispose() {
    scrollController.dispose();
    debugPrint('dispose irsha view');
    super.dispose();
  }
}
