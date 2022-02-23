import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:quran/styles/txt_style.dart';
import 'package:quran/tools/screen_util.dart';
import 'package:quran/widgets/custom_card.dart';
import 'hisn_model.dart';

class DetalsTitleHisnView extends StatefulWidget {
  const DetalsTitleHisnView({Key? key, required this.MTxt}) : super(key: key);
  final MText MTxt;

  @override
  State<DetalsTitleHisnView> createState() => _DetalsTitleHisnViewState();
}

class _DetalsTitleHisnViewState extends State<DetalsTitleHisnView>
    with SingleTickerProviderStateMixin {
  //
  late AnimationController iconController;

  bool isAnimated = false;
  // bool showPlay = true;
  // bool shopPause = false;

  AssetsAudioPlayer audioPlayer = AssetsAudioPlayer();
  //Listen to the current playing song
  Duration duration = Duration(milliseconds: 100);
  @override
  void initState() {
    super.initState();
    //
    iconController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    );
    duration = audioPlayer.currentPosition.value;
    // bool playing = false;
  }

  //
  open(String url) async {
    await audioPlayer.open(
      // Audio(url),
      Audio.network(url),
      autoStart: false,
      showNotification: true,
    );
    audioPlayer.play();
  }

  //
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomCard(
          margin: const EdgeInsets.all(2.0),
          padding: const EdgeInsets.all(2.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  height: ScreenUtil.getHeight(context) * 0.20,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.green.shade100,
                    borderRadius: BorderRadius.circular(
                      10.0,
                    ),
                  ),
                  child: Column(
                    children: [
                      GestureDetector(
                        // onTap: () => animateIcon('assets/001.mp3'),
                        onTap: () => animateIcon(widget.MTxt.audio),
                        child: AnimatedIcon(
                          icon: AnimatedIcons.play_pause,
                          progress: iconController,
                          size: 50.0,
                          color: isAnimated ? Colors.black : Colors.green[900],
                        ),
                      ),
                      StreamBuilder<Duration>(
                        stream: audioPlayer.currentPosition,
                        builder: (BuildContext context,
                            AsyncSnapshot<Duration> snapshot) {
                          if (snapshot.hasData) {
                            final Duration duration = snapshot.data!;
                            // final bool isPlaying = snapshot.data!;
                            return Slider(
                              value:
                                  double.parse(duration.inSeconds.toString()),
                              min: double.parse(duration.inSeconds.toString()),
                              max: 100,
                              onChanged: (value) {},
                            );
                          }
                          return Text(
                            'duration.toString()',
                            style: TxtStyle.customStyle(),
                          );
                        },
                      ),
                    ],
                  ),
                ),
                ListTile(
                  contentPadding: const EdgeInsets.all(2.0),
                  title: Text(
                    widget.MTxt.arabicText,
                    style: TxtStyle.customStyle(fontSize: 18.0),
                  ),
                  subtitle: Text(
                    widget.MTxt.translatedText,
                    textAlign: TextAlign.start,
                    softWrap: true,
                    style: TxtStyle.customStyle(
                      fontSize: 16.0,
                      color: Colors.green[900],
                    ),
                  ),
                  // leading:,
                  // trailing:    SleekCircularSlider(
                  //         min: 0,
                  //         max: double.parse(value.count.toString()) + 10,
                  //         initialValue: double.parse(value.count.toString()),
                  //         onChange: (double value) {},
                  //         onChangeStart: (double startValue) {},
                  //         onChangeEnd: (double endValue) {},
                  //         innerWidget: (double value) => const SizedBox(),
                  //       ),  CircularPercentIndicator(
                  //   radius: 40.0,
                  //   lineWidth: 5.0,
                  //   percent: 1.0,
                  //   animation: true,
                  //   animateFromLastPercent: true,
                  //   animationDuration: 2000,
                  //   center: Text(
                  //     widget.listMTxt[index].repeat.toString(),
                  //     style: TxtStyle.customStyle(fontSize: 20.0),
                  //   ),
                  //   progressColor: Colors.green,
                  //   circularStrokeCap: CircularStrokeCap.butt,
                  //   // progressColor: Colors.purple,
                  // ),

                  // Text(
                  //   widget.listMTxt[index].audio,
                  //   style: TxtStyle.customStyle(),
                  // ),

                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  //   children: [
                  //     InkWell(
                  //       child: const Icon(CupertinoIcons.pause),
                  //       onTap: () {
                  //         audioPlayer.pause();
                  //       },
                  //     ),
                  //     InkWell(
                  //       child: const Icon(CupertinoIcons.play),
                  //       onTap: () {
                  //         open('assets/001.mp3');
                  //       },
                  //     ),
                  //     InkWell(
                  //       child: const Icon(CupertinoIcons.forward_fill),
                  //       onTap: () {
                  //         // open(widget.listMTxt[index].audio);
                  //         audioPlayer.seekBy(const Duration(seconds: 10));
                  //         audioPlayer.seek(const Duration(seconds: 10));
                  //         audioPlayer.next();
                  //       },
                  //     ),
                  //   ],
                  // ),
                  // const SliderHusn(value: 100.0),
                  // ],
                ),
              ],
            ),
          )),
    );
  }

  void animateIcon(url) {
    isAnimated = !isAnimated;
    if (isAnimated) {
      iconController.forward();
      open(url);
      audioPlayer.play();
    } else {
      iconController.reverse();
      audioPlayer.pause();
    }
    setState(() {});
  }

  @override
  void dispose() {
    super.dispose();
    iconController.dispose();
    audioPlayer.dispose();
  }
}
