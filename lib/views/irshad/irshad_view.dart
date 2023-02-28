import 'package:flutter/material.dart';
import 'package:quran/widgets/icon_leading.dart';
import 'package:quran/widgets/icon_show_bottomnavigation.dart';
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
    return Scaffold(
      appBar: AppBar(
        title: const AppBarTitle('نصايح وإرشادات'),
        actions: const [IconShowBottomNavigation()],
        // shape: CustomAppBarShape(),
        leading: const IconLeading(),
      ),
      body: const ListviewIrshad(),
      // floatingActionButton: const ScrollTopBottom(),
    );
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }
}
