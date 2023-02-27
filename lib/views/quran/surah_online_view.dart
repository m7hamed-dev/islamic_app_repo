import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quran/global/depency_injection.dart';
import 'package:quran/tools/convert_to_arabic_num.dart';
import 'package:quran/widgets/app_bar_title.dart';
import 'package:quran/widgets/custom_card.dart';
import 'package:quran/widgets/row_multi_process.dart';
import '../../widgets/icon_leading.dart';
import '../../widgets/txt.dart';

class SurahOnlineView extends StatefulWidget {
  //
  const SurahOnlineView({Key? key}) : super(key: key);
  @override
  State<SurahOnlineView> createState() => _SurahOnlineViewState();
}

class _SurahOnlineViewState extends State<SurahOnlineView> {
  //
  final _scrollController = ScrollController();
  late QuranAPI _quranAPIsProvider;

  //
  void _scrollToBottom() {
    final min = _scrollController.position.minScrollExtent;
    final max = _scrollController.position.maxScrollExtent;
    //
    _mixin(max, min, 5);
    // _mixin(max, min, 25);
  }

  void _mixin(double max, double min, double direction) async {
    _scrollController
        .animateTo(
      direction,
      duration: const Duration(milliseconds: 900),
      curve: Curves.linear,
    )
        .then((_) {
      direction = direction == max ? min : max;
      // direction = direction == max ? min : max;
      // _mixin(max, min, direction);
      _scrollController.animateTo(
        direction,
        duration: Duration(
            seconds: _quranAPIsProvider.selectedSurah.ayahs.length * 6),
        curve: Curves.linear,
      );
    });
  }

//
  @override
  void initState() {
    _quranAPIsProvider = Provider.of<QuranAPI>(context, listen: false);
    WidgetsBinding.instance.addPostFrameCallback((_) => _scrollToBottom());
    super.initState();
  }

  bool _isShowRowMultiProcess = false;

  void _showHideRowMultiProcess() {
    _isShowRowMultiProcess = !_isShowRowMultiProcess;
    setState(() {});
  }

  String _numberAya = '';

  ///
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: AppBarTitle(_quranAPIsProvider.selectedSurah.name),
        actions: [
          IconButton(
            onPressed: _showHideRowMultiProcess,
            icon: Icon(
              _isShowRowMultiProcess
                  ? Icons.visibility_off_rounded
                  : Icons.visibility,
            ),
          )
        ],
        leading: const IconLeading(),
      ),
      // body: Consumer<QuranAPI>(
      body: Consumer(
        builder: (context, _controller, child) {
          //
          return ListView.builder(
            controller: _scrollController,
            itemCount: _controller.surahLis.length,
            itemBuilder: (BuildContext context, int index) {
              _numberAya = ConvertTo.toArabicNumber(_controller
                  .selectedSurah.ayahs[index].numberInSurah
                  .toString());

              return CustomCard(
                child: ListTile(
                  trailing: CircleAvatar(
                    // radius: 0.012,
                    backgroundColor: DI.primaryColor(context).withOpacity(.1),
                    child: Txt(
                      _numberAya,
                      isUseFontSizePrefs: false,
                      fontSize: 17.0,
                    ),
                  ),
                  title: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Txt(
                      _controller.selectedSurah.ayahs[index].text,
                      textAlign: TextAlign.center,
                      isUseFontSizePrefs: false,
                      fontSize: 20.0,
                    ),
                  ),
                  subtitle: _isShowRowMultiProcess
                      ? RowMultiProcess(
                          text: _controller.selectedSurah.ayahs[index].text,
                          title: _controller.selectedSurah.name +
                              ' الآية ' +
                              '( ${_controller.selectedSurah.ayahs[index].numberInSurah} )',
                          hsna: '',
                          titleFavourit: 'titleFavourit',
                        )
                      : const SizedBox(),
                ),
              );
            },
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    debugPrint('_scrollController was dispose ......');
    _scrollController.dispose();
    super.dispose();
  }
}
