import 'package:flutter/material.dart';
import 'package:quran/tools/constants.dart';
import '../../tools/push.dart';
import '../constant/surah_builder.dart';
import '../widgets/surah_item_index.dart';
import 'constant.dart';

enum States { loading, success, error }

class IndexPage extends StatefulWidget {
  const IndexPage({Key? key}) : super(key: key);

  @override
  State<IndexPage> createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {
  var quran;
  States currentState = States.loading;
  void _state(States state) {
    currentState = state;
    setState(() {});
  }

  Future<void> _readDataFromJson() async {
    try {
      _state(States.loading);
      quran = await readJson();
      _state(States.success);
    } catch (e) {
      _state(States.error);
    }
  }

  @override
  void initState() {
    _readDataFromJson();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        tooltip: 'Go to bookmark',
        backgroundColor: primaryColor,
        onPressed: () async {
          if (await readBookmark() == true) {
            final surahBuilder = SurahBuilder(
              fabIsClicked: true,
              arabic: quran[0],
              sura: bookmarkedSura - 1,
              suraName: arabicName[bookmarkedSura - 1]['name'] ?? '',
              ayah: bookmarkedAyah,
            );
            Push.to(context, surahBuilder);
          }
        },
        child: const Icon(Icons.bookmark),
      ),

      body: const Body(),
      // body: currentState == States.loading
      //     ? const CircularProgressIndicator()
      //     : currentState == States.error
      //         ? const Text('Error')
      //         : SurahItemIndex(quran: quran),
    );
  }
}

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      // padding: const EdgeInsets.all(8.0),
      physics: Constants.bouncScrollPhysics,
      slivers: [
        const SliverAppBar(
          expandedHeight: 220.0,
          collapsedHeight: 60.0,
          flexibleSpace: FlexibleSpaceBar(
            background: Icon(Icons.holiday_village),
            // title: Txt('خطي إسلامية'),
          ),
          pinned: true,
          floating: true,
        ),
        SliverToBoxAdapter(child: SurahItemIndex(quran: quran)),
      ],
    );
  }
}
