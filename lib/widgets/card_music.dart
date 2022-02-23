import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quran/tools/play_music_provider.dart';
import 'package:quran/widgets/btn.dart';
import 'package:quran/widgets/txt.dart';

class CardMusic extends StatefulWidget {
  const CardMusic({Key? key, required this.url}) : super(key: key);
  final String url;

  @override
  State<CardMusic> createState() => _CardMusicState();
}

class _CardMusicState extends State<CardMusic> {
  @override
  Widget build(BuildContext context) {
    debugPrint('rebuild card music ........');
    debugPrint('url = ${widget.url}');
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/nuture.jpeg',
              fit: BoxFit.cover,
            ),
          ),
          if (context.watch<PlayMusicProvider>().isError)
            Center(
              child: Txt(
                context.watch<PlayMusicProvider>().error.toString(),
                color: Colors.white,
                isUseFontSizePrefs: false,
                fontSize: 20.0,
              ),
            )
          else
            Positioned(
              top: 100.0,
              // left: 10.0,
              // right: 10.0,
              child: Consumer<PlayMusicProvider>(
                builder: (context, _controller, _) {
                  return Btn(
                    width: 200.0,
                    onPressed: () {
                      _controller.playAudioFromNetwork(
                        // 'http://server8.mp3quran.net/ahmad_huth/001.mp3',
                        widget.url,
                      );
                    },
                    child: Text(
                      _controller.isPlaying == false ? 'play' : 'pause',
                    ),
                  );
                },
              ),
            ),
          Positioned(
            bottom: 222.0,
            left: 10.0,
            right: 10.0,
            child: Consumer<PlayMusicProvider>(
              builder: (context, controller, _) {
                return controller.showIsPlayingState();
              },
            ),
          ),
          Positioned(
            bottom: 260.0,
            left: 10.0,
            right: 10.0,
            child: Consumer<PlayMusicProvider>(
              builder: (context, controller, _) {
                return controller.streamBuilder();
                return Txt(
                  controller.isError ? controller.error.toString() : 'ok',
                  color: Colors.white,
                  fontSize: 40.0,
                  isUseFontSizePrefs: false,
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    // context.read<PlayMusicProvider>().dispose();
  }
}
