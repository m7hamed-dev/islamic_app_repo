import 'package:coachmaker/coachmaker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';
import 'package:quran/tools/coach_maker.dart';
import 'package:quran/views/surah/input_filtter.dart';
import 'package:quran/widgets/btn.dart';
import 'package:quran/widgets/listview_surah.dart';
import 'package:quran/widgets/madina_img.dart';
import 'package:quran/widgets/mecca_img.dart';
import 'package:quran/widgets/search_icon.dart';
import 'package:quran/widgets/set_book_mark.dart';
import 'surah_controller.dart';

class AllSurahView extends StatefulWidget {
  const AllSurahView({Key? key}) : super(key: key);

  @override
  State<AllSurahView> createState() => _AllSurahViewState();
}

class _AllSurahViewState extends State<AllSurahView> {
  //
  @override
  void initState() {
    super.initState();
    //
    CustomCoachMaker.callCoachMaker(
      context: context,
      initial: '1',
      coachModelList: [
        CoachModel(
          initial: '1',
          title: 'Indonesia',
          maxWidth: 400,
          subtitle: [
            Btn(
              child: const Text('skip'),
              onPressed: () {},
            ),
            '1. Aceh',
            '2. Jakarta',
            '3. Bali',
          ],
        ),
        CoachModel(
          initial: '2',
          title: 'Indonesia',
          maxWidth: 400,
          subtitle: [
            '1. Aceh',
            '2. Jakarta',
            '3. Bali',
            '4. Papua',
          ],
        ),
        CoachModel(
          initial: '3',
          title: 'Indonesia',
          maxWidth: 400,
          subtitle: [
            '1. Aceh',
            '2. Jakarta',
            '3. Bali',
            '4. Papua',
          ],
        ),
      ],
    );
  }

  bool _isSowHeaderAppBar = true;
  //
  Row _headerAppBar() {
    return Row(
      children: [
        CustomCoachMaker.putWidgetInCoachMaker(
          initial: '1',
          child: IconButton(
            onPressed: () {
              context.read<SurahController>().filtteSurahByPlace('Mecca');
            },
            icon: const MeccaImg(),
          ),
        ),
        IconButton(
          onPressed: () {
            context.read<SurahController>().filtteSurahByPlace('Medina');
          },
          icon: const MdinaImg(),
        ),
        IconButton(
          onPressed: () {
            context.read<SurahController>().filtteSurahByPlace('all');
          },
          icon: const Icon(Icons.done_all_outlined),
        ),
        CustomCoachMaker.putWidgetInCoachMaker(
          initial: '2',
          child: const SetBookMark(),
        ),
        const SearchIcon()
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    //
    return Scaffold(
      appBar: AppBar(),
      body: NotificationListener<UserScrollNotification>(
        onNotification: _onNotification,
        child: Column(
          children: [
            Visibility(
              visible: _isSowHeaderAppBar,
              child: _headerAppBar(),
            ),
            const Expanded(child: ListViewSurah()),
          ],
        ),
      ),
    );
  }

  bool _onNotification(UserScrollNotification notification) {
    if (notification.direction == ScrollDirection.reverse) {
      _isSowHeaderAppBar = false;
      setState(() {});
    } else {
      _isSowHeaderAppBar = true;
      setState(() {});
    }
    return true;
  }
}
