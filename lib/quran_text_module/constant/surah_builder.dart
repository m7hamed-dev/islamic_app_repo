import 'package:flutter/material.dart';
import 'package:quran/tools/custom_message.dart';
import 'package:quran/widgets/circular_icon.dart';
import 'package:quran/widgets/icon_leading.dart';
import 'package:quran/widgets/txt.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

import '../view/constant.dart';

class SurahBuilder extends StatefulWidget {
  final int sura;
  final List arabic;
  final String suraName;
  final int ayah;
  final bool fabIsClicked;

  const SurahBuilder({
    Key? key,
    required this.sura,
    required this.fabIsClicked,
    required this.arabic,
    required this.suraName,
    required this.ayah,
  }) : super(key: key);

  @override
  SurahBuilderState createState() => SurahBuilderState();
}

class SurahBuilderState extends State<SurahBuilder> {
  bool view = true;
  final itemScrollController = ItemScrollController();
  late ItemPositionsListener itemPositionsListener;

  @override
  void initState() {
    itemPositionsListener = ItemPositionsListener.create();
    WidgetsBinding.instance.addPostFrameCallback((_) => jumbToAyah());
    super.initState();
  }

  void jumbToAyah() {
    if (widget.fabIsClicked) {
      itemScrollController.scrollTo(
        index: widget.ayah,
        duration: const Duration(seconds: 2),
        curve: Curves.easeInOutCubic,
      );
    }
  }

  Row verseBuilder(int index, int previousVerses) {
    return Row(
      children: [
        Expanded(
          child: Text(
            widget.arabic[index + previousVerses]['aya_text'],
            textDirection: TextDirection.rtl,
            style: TextStyle(
              fontSize: arabicFontSize,
              fontFamily: arabicFont,
              color: const Color.fromARGB(196, 0, 0, 0),
            ),
          ),
        ),
      ],
    );
  }

  SafeArea singleSuraBuilder(int lengthOfSura) {
    String fullSura = '';
    int previousVerses = 0;
    if (widget.sura + 1 != 1) {
      for (int i = widget.sura - 1; i >= 0; i--) {
        previousVerses = previousVerses + noOfVerses[i];
      }
    }

    if (!view) {
      for (int i = 0; i < lengthOfSura; i++) {
        fullSura += (widget.arabic[i + previousVerses]['aya_text']);
      }
    }

    return SafeArea(
      child: Container(
        color: const Color.fromARGB(255, 253, 251, 240),
        child: view
            ? ScrollablePositionedList.builder(
                itemBuilder: (BuildContext context, int index) {
                  return Column(
                    children: [
                      (index != 0) || (widget.sura == 0) || (widget.sura == 8)
                          ? const Text('')
                          : const RetunBasmala(),
                      Container(
                        color: index % 2 != 0
                            ? const Color.fromARGB(255, 253, 251, 240)
                            : const Color.fromARGB(255, 253, 247, 230),
                        child: PopupMenuButton(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: verseBuilder(index, previousVerses),
                          ),
                          itemBuilder: (context) => [
                            PopupMenuItem(
                              onTap: () async {
                                String msg = ' تم حفظ ';
                                // ' تم حفظ ${widget.arabic[widget.ayah + 1]} , ${widget.ayah} ';
                                await saveBookMark(
                                  widget.sura + 1,
                                  index,
                                );
                                if (!mounted) return;
                                CustomMessage.showCustomSnackBar(
                                  context,
                                  content: Txt(
                                    msg,
                                    color: Colors.white,
                                  ),
                                );
                              },
                              child: Row(
                                children: const [
                                  Icon(Icons.bookmark_add),
                                  SizedBox(width: 10),
                                  Txt('حفظ كعلامة'),
                                ],
                              ),
                            ),
                            PopupMenuItem(
                              onTap: () {},
                              child: Row(
                                //mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: const [
                                  Icon(
                                    Icons.share,
                                    color: Color.fromARGB(255, 56, 115, 59),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text('Share'),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                },
                itemScrollController: itemScrollController,
                itemPositionsListener: itemPositionsListener,
                itemCount: lengthOfSura,
              )
            : ListView(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            widget.sura + 1 != 1 && widget.sura + 1 != 9
                                ? const RetunBasmala()
                                : const Text(''),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                fullSura,
                                textDirection: TextDirection.rtl,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: mushafFontSize,
                                  fontFamily: arabicFont,
                                  color: const Color.fromARGB(196, 44, 44, 44),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    int lengthOfSura = noOfVerses[widget.sura];

    return Scaffold(
      appBar: AppBar(
        title: Txt(widget.suraName, color: Colors.white),
        leading: const IconLeading(),
        actions: [
          Tooltip(
            message: 'Mushaf Mode',
            child: TextButton(
              child: const CircleIcon(
                icon: Icons.chrome_reader_mode,
              ),
              onPressed: () {
                view = !view;
                setState(() {});
              },
            ),
          ),
        ],
      ),
      body: singleSuraBuilder(lengthOfSura),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}

class RetunBasmala extends StatelessWidget {
  const RetunBasmala({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: const [
        Center(
          child: Text(
            'بسم الله الرحمن الرحيم',
            style: TextStyle(fontFamily: 'me_quran', fontSize: 30),
            textDirection: TextDirection.rtl,
          ),
        ),
      ],
    );
  }
}
