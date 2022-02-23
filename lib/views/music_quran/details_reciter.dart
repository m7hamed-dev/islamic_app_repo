import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quran/styles/txt_style.dart';
import 'package:quran/tools/push.dart';
import 'package:quran/views/music_quran/music_quran_controller.dart';
import 'package:quran/widgets/card_music.dart';
import 'package:quran/widgets/custom_card.dart';
import 'music_quran_model.dart';

class DetailsReciter extends StatefulWidget {
  const DetailsReciter({
    Key? key,
    required this.surahList,
  }) : super(key: key);
  final List<String> surahList;

  @override
  State<DetailsReciter> createState() => _DetailsReciterState();
}

class _DetailsReciterState extends State<DetailsReciter> {
  final AssetsAudioPlayer audioPlayer = AssetsAudioPlayer();
  @override
  Widget build(BuildContext context) {
    final _musicQuranController = context.read<MusicQuranController>();
    return Scaffold(
      body: ListView.builder(
        itemCount: widget.surahList.length,
        itemBuilder: (BuildContext context, int index) {
          return CustomCard(
            margin: const EdgeInsets.all(5.0),
            padding: const EdgeInsets.all(5.0),
            child: ListTile(
              title: Text(
                _musicQuranController.getSurahNameByID(widget.surahList[index]),
                style: TxtStyle.customStyle(),
              ),
              subtitle: Text(
                hundlerUrlServer(index, widget.surahList[index],
                    _musicQuranController.reciters),
                style: TxtStyle.customStyle(),
              ),
              leading: GestureDetector(
                // onTap: () => open(
                //   hundlerUrlServer(
                //     index,
                //     widget.surahList[index],
                //     _musicQuranController.reciters,
                //   ),
                // ),
                onTap: () => Push.to(
                  context,
                  // CardPlayMusic(
                  //   title: widget.surahList[index],
                  //   url: 'url',
                  // ),
                  CardMusic(
                    url: hundlerUrlServer(index, widget.surahList[index],
                        _musicQuranController.reciters),
                  ),
                ),
                child: const Icon(
                  Icons.play_circle,
                  size: 50.0,
                  // color: isAnimated ? Colors.black : Colors.green[900],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  ///
  Future<void> open(String url) async {
    await audioPlayer.open(
      // Audio(url),
      Audio.network(url),
      autoStart: false,
      showNotification: true,
    );
    audioPlayer.play();
  }

  String hundlerUrlServer(int index, String path, List<Reciter> reciters) {
    if (path.length == 1) {
      return '${reciters[index].server}/00$path.mp3';
    }
    if (path.length == 2) {
      return '${reciters[index].server}/0$path.mp3';
    }
    return '${reciters[index].server}/$path.mp3';
  }

  @override
  void dispose() {
    super.dispose();
    audioPlayer.dispose();
  }
}
