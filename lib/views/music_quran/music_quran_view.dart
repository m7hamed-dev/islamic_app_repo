import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quran/styles/txt_style.dart';
import 'package:quran/tools/push.dart';
import 'card_listview_reciter.dart';
import 'details_reciter.dart';
import 'music_quran_controller.dart';

class MusicQuranView extends StatelessWidget {
  const MusicQuranView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final _musicQuranController = context.watch<MusicQuranController>();

    return Scaffold(
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                childAspectRatio: 2 / 1,
              ),
              itemCount:
                  context.watch<MusicQuranController>().lettersArabic.length,
              itemBuilder: (BuildContext context, int index) {
                final _controller = context.read<MusicQuranController>();
                return InkWell(
                  onTap: () {
                    _controller.filter(_controller.lettersArabic[index]);
                    _controller.setsSlectedLetterIndex(index);
                  },
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 900),
                    margin: const EdgeInsets.all(5.0),
                    alignment: Alignment.center,
                    // decoration: customBoxDecoration(
                    //   color: _musicQuranController.selectedLetterIndex == index
                    //       ? Colors.green.shade100
                    //       : Colors.grey[50],
                    //   radius: _musicQuranController.selectedLetterIndex == index
                    //       ? 15.0
                    //       : 10.0,
                    // ),
                    child: Text(
                      _controller.lettersArabic[index],
                      style: TxtStyle.customStyle(),
                    ),
                  ),
                );
              },
            ),
          ),
          Expanded(
            flex: 3,
            child: ListView.builder(
              itemCount:
                  context.read<MusicQuranController>().filtterReciters.length,
              itemBuilder: (BuildContext context, int index) {
                return InkWell(
                  onTap: () {
                    _pushToDetailsReciterView(
                      context: context,
                      controller: context.read<MusicQuranController>(),
                      index: index,
                    );
                  },
                  child: CardListViewReciter(
                    reciter: context
                        .read<MusicQuranController>()
                        .filtterReciters[index],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  void _pushToDetailsReciterView({
    required BuildContext context,
    required MusicQuranController controller,
    required int index,
  }) {
    Push.to(
      context,
      DetailsReciter(
        surahList: controller.convetToListOfStrings(
          controller.reciters[index].suras,
        ),
      ),
    );
  }
}
