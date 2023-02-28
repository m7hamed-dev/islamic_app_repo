import 'package:flutter/material.dart';
import 'package:quran/tools/constants.dart';
import 'package:quran/widgets/generate_dots_widget.dart';
import 'package:quran/widgets/icon_leading.dart';
import 'package:quran/widgets/icon_show_bottomnavigation.dart';
import '../../widgets/app_bar_title.dart';
import 'card_duaa_zkr.dart';
import 'duaa_model.dart';

class DuaaView extends StatefulWidget {
  //
  const DuaaView({
    Key? key,
    required this.details,
    required this.type,
  }) : super(key: key);
  //
  final List<Detail> details;
  final String type;
  final String pageName = '/duaa_view';
  //
  @override
  State<DuaaView> createState() => _DuaaViewState();
}

class _DuaaViewState extends State<DuaaView> {
  int _selectedIndex = 0;
  //
  void changeIndex() {
    setState(() {});
  }

  final PageController _pageController = PageController(initialPage: 0);

  ///
  @override
  Widget build(BuildContext context) {
    //
    return Scaffold(
      appBar: AppBar(
        title: AppBarTitle(widget.type),
        actions: const [IconShowBottomNavigation()],
        leading: const IconLeading(),
      ),
      body: Column(
        children: [
          GenerateDotsWidget(
            items: widget.details,
            selectedIndex: _selectedIndex,
          ),
          Expanded(
            flex: 4,
            child: PageView.builder(
              itemCount: widget.details.length,
              controller: _pageController,
              onPageChanged: (int page) {
                _selectedIndex = page;
                setState(() {});
              },
              physics: const BouncingScrollPhysics(),
              itemBuilder: (BuildContext context, int index) {
                return ListView(
                  physics: Constants.bouncScrollPhysics,
                  children: [
                    CardDuaaZkr(
                      pageController: _pageController,
                      detail: widget.details[index],
                      typeOfDuaa: widget.type,
                    ),
                  ],
                );
              },
            ),
          ),
          // NextPreviousArrow(pageController: _pageController),
        ],
      ),
    );
  }
}
