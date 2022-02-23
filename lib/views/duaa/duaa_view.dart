import 'package:coachmaker/coachmaker.dart';
import 'package:flutter/material.dart';
import 'package:quran/storage/local_storage.dart';
import 'package:quran/tools/coach_maker.dart';
import 'package:quran/widgets/btn.dart';
import 'package:quran/widgets/icon_show_bottomnavigation.dart';
import 'package:quran/widgets/navigation_bottom_settings.dart';
import 'package:quran/widgets/txt.dart';
import 'card_duaa_zkr.dart';
import 'duaa_model.dart';

class DuaaView extends StatefulWidget {
  //
  const DuaaView({
    Key? key,
    required this.details,
    required this.type,
  }) : super(key: key);
  final List<Detail> details;
  final String type;
  final String pageName = '/duaa_view';
  //
  @override
  State<DuaaView> createState() => _DuaaViewState();
}

class _DuaaViewState extends State<DuaaView> {
  //
  bool _isShow = true;
  void _getValueOfCoachMaker() {
    _isShow = LocalStorage.getValueOfCochMaker(widget.pageName);
    if (!mounted) {
      return;
    }
    setState(() {});
    debugPrint('_isShow $_isShow');
  }

  //
  @override
  void initState() {
    super.initState();
    //
    _getValueOfCoachMaker();
    //
    CustomCoachMaker.callCoachMaker(
      context: context,
      initial: '1',
      isShowCochMaker: _isShow,
      coachModelList: [
        CoachModel(
          initial: '1',
          title: 'اضغط لكي تسبح',
          maxWidth: 400,
          subtitle: [
            Btn(
              child: const Txt(
                'i understood !!',
                isUseFontSizePrefs: false,
                color: Colors.black,
              ),
              onPressed: () {
                LocalStorage.isShowCochMaker(widget.pageName, false);
              },
            ),
            '1. Aceh',
          ],
        ),
      ],
    );
  }

  //
  @override
  Widget build(BuildContext context) {
    //
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        actions: const [IconShowBottomNavigation()],
      ),
      body: ListView.builder(
        itemCount: widget.details.length,
        itemBuilder: (BuildContext context, int index) {
          if (index == 0 && _isShow == false) {
            return CustomCoachMaker.putWidgetInCoachMaker(
              child: CardDuaaZkr(detail: widget.details[index]),
              initial: '1',
            );
          }
          return CardDuaaZkr(detail: widget.details[index]);
        },
      ),
      bottomNavigationBar: const NavigationBbottomSettings(),
    );
  }
}
