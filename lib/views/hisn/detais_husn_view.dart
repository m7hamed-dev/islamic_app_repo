// import 'package:assets_audio_player/assets_audio_player.dart';
// import 'package:flutter/material.dart';
// import 'package:quran/tools/constants.dart';
// import 'package:quran/tools/screen_util.dart';
// import '../../widgets/txt.dart';
// import 'hisn_model.dart';

// class DetalsTitleHisnView extends StatefulWidget {
//   const DetalsTitleHisnView({Key? key, required this.MTxt}) : super(key: key);
//   final MText MTxt;

//   @override
//   State<DetalsTitleHisnView> createState() => _DetalsTitleHisnViewState();
// }

// class _DetalsTitleHisnViewState extends State<DetalsTitleHisnView>
//     with SingleTickerProviderStateMixin {
//   //
//   late AnimationController iconController;

//   bool isAnimated = false;
//   // bool showPlay = true;
//   // bool shopPause = false;

//   AssetsAudioPlayer audioPlayer = AssetsAudioPlayer();
//   //Listen to the current playing song
//   Duration duration = const Duration(milliseconds: 100);
//   @override
//   void initState() {
//     super.initState();
//     //
//     iconController = AnimationController(
//       vsync: this,
//       duration: const Duration(milliseconds: 1200),
//     );
//     duration = audioPlayer.currentPosition.value;
//     // bool playing = false;
//   }

//   //
//   open(String url) async {
//     await audioPlayer.open(
//       // Audio(url),
//       Audio.network(url),
//       autoStart: false,
//       showNotification: true,
//     );
//     audioPlayer.play();
//   }

//   //
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(),
//       body: ListView(
//         physics: Constants.bouncScrollPhysics,
//         children: [
//           Container(
//             height: ScreenUtil.getHeight(context) * 0.20,
//             alignment: Alignment.center,
//             decoration: BoxDecoration(
//               color: Colors.green.shade100,
//               borderRadius: BorderRadius.circular(
//                 10.0,
//               ),
//             ),
//             child: Column(
//               children: [
//                 GestureDetector(
//                   // onTap: () => animateIcon('assets/001.mp3'),
//                   onTap: () => animateIcon(widget.MTxt.audio),
//                   child: AnimatedIcon(
//                     icon: AnimatedIcons.play_pause,
//                     progress: iconController,
//                     size: 50.0,
//                     color: isAnimated ? Colors.black : Colors.green[900],
//                   ),
//                 ),
//                 StreamBuilder<Duration>(
//                   stream: audioPlayer.currentPosition,
//                   builder:
//                       (BuildContext context, AsyncSnapshot<Duration> snapshot) {
//                     if (snapshot.hasData) {
//                       final Duration duration = snapshot.data!;
//                       // final bool isPlaying = snapshot.data!;
//                       return Slider(
//                         value: double.parse(duration.inSeconds.toString()),
//                         min: double.parse(duration.inSeconds.toString()),
//                         max: 100,
//                         onChanged: (value) {},
//                       );
//                     }
//                     return Txt(
//                       'duration.toString()',
//                     );
//                   },
//                 ),
//               ],
//             ),
//           ),
//           Txt(
//             widget.MTxt.arabicText,
//             fontSize: 25.0,
//             textAlign: TextAlign.center,
//             fontFamily: 'tajawal',
//           ),
//           Txt(
//             widget.MTxt.translatedText,
//             textAlign: TextAlign.start,
//             fontSize: 20.0,
//             // textAlign: TextAlign.center,
//             fontFamily: 'tajawal',
//           ),
//         ],
//       ),
//     );
//   }

//   void animateIcon(url) {
//     isAnimated = !isAnimated;
//     if (isAnimated) {
//       iconController.forward();
//       open(url);
//       audioPlayer.play();
//     } else {
//       iconController.reverse();
//       audioPlayer.pause();
//     }
//     setState(() {});
//   }

//   @override
//   void dispose() {
//     super.dispose();
//     iconController.dispose();
//     audioPlayer.dispose();
//   }
// }
