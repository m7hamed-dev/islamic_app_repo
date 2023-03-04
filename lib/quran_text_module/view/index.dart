import 'package:flutter/material.dart';
import 'package:quran/tools/constants.dart';
import 'package:quran/widgets/custom_loading.dart';
import 'package:quran/widgets/txt.dart';
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
  late List quran;
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
        onPressed: () async {
          if (await readBookmark) {
            final surahBuilder = SurahBuilder(
              fabIsClicked: true,
              arabic: quran[0],
              sura: bookmarkedSura - 1,
              suraName: arabicName[bookmarkedSura - 1]['name'] ?? '',
              ayah: bookmarkedAyah,
            );
            if (!mounted) return;
            Push.to(context, surahBuilder);
          }
        },
        child: const Icon(Icons.bookmark),
      ),
      body: Body(
        isLoading: currentState,
      ),
    );
  }
}

class Body extends StatelessWidget {
  const Body({Key? key, required this.isLoading}) : super(key: key);
  final States isLoading;
  @override
  Widget build(BuildContext context) {
    if (isLoading == States.loading) {
      return const CustomLoading();
    }
    return CustomScrollView(
      physics: Constants.bouncScrollPhysics,
      slivers: [
        SliverAppBar(
          expandedHeight: 220.0,
          collapsedHeight: 60.0,
          flexibleSpace: FlexibleSpaceBar(
            background: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/home/green_quran.png'),
                const Txt('خطي إسلامية', color: Colors.white),
              ],
            ),
            // title: Txt('خطي إسلامية'),
          ),
          pinned: true,
          floating: true,
        ),
        SurahItemIndex(quran: quran),
      ],
    );
  }
}
