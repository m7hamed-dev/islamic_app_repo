// import 'package:assets_audio_player/assets_audio_player.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:quran/widgets/btn.dart';
// import 'package:quran/widgets/custom_loading.dart';
// import 'package:quran/widgets/txt.dart';

// class PlayMusicProvider extends ChangeNotifier {
//   final AssetsAudioPlayer _assetsAudioPlayer = AssetsAudioPlayer();
//   bool isError = false;
//   bool isPlaying = false;
//   late var error;
//   //
//   //
//   StreamBuilder streamBuilder() {
//     double _currentSeconds = 0.00;
//     debugPrint('rebuild SleekCircularSlider');
//     return StreamBuilder<Duration>(
//         stream: _assetsAudioPlayer.currentPosition,
//         builder: (context, asyncSnapshot) {
//           if (asyncSnapshot.hasData) {
//             final Duration value = asyncSnapshot.data!;
//             _currentSeconds = value.inSeconds.toDouble();
//             return Column(
//               children: [
//                 Row(
//                   children: [
//                     Txt(
//                       '$_currentSeconds',
//                       color: Colors.white,
//                       fontSize: 40.0,
//                       isUseFontSizePrefs: false,
//                     ),
//                   ],
//                 ),
//                 Slider(
//                   min: 0.0,
//                   max: _currentSeconds + 10,
//                   value: _currentSeconds,
//                   divisions: 200,
//                   onChanged: (double changedValue) {
//                     _currentSeconds = changedValue;
//                     notifyListeners();
//                   },
//                 ),
//               ],
//             );
//           }
//           return const CustomLoading();
//         });
//   }

//   // },
//   // );
//   // return Center(
//   //     child: Txt(
//   //   '${duration.inSeconds.floor()}',
//   //   color: Colors.white,
//   //   fontSize: 40.0,
//   //   isUseFontSizePrefs: false,
//   // ));
//   // }
//   // return const CustomLoading();

//   Future<void> playAudioFromNetwork(String url) async {
//     try {
//       if (_assetsAudioPlayer.isPlaying.value) {
//         await _assetsAudioPlayer.stop();
//       }
//       await _assetsAudioPlayer.open(
//         Audio.network(url),
//         showNotification: true,
//       );
//       isPlaying = true;
//       notifyListeners();
//     } catch (err) {
//       debugPrint('err = $err');
//       if (err is PlatformException) {
//         error = 'Internet Connection !!';
//         isError = true;
//         isPlaying = false;
//         notifyListeners();
//         return;
//       }
//       error = err;
//       isPlaying = false;
//       notifyListeners();
//     }
//   }

//   StreamBuilder showIsPlayingState() {
//     //will follow the AssetsAudioPlayer playing state
//     return StreamBuilder<bool>(
//         stream: _assetsAudioPlayer.isPlaying,
//         builder: (context, asyncSnapshot) {
//           if (asyncSnapshot.hasData) {
//             final bool _isPlaying = asyncSnapshot.data!;
//             return Btn(
//               child: Text(_isPlaying ? "Pause" : "Play"),
//               onPressed: () {
//                 _isPlaying
//                     ? _assetsAudioPlayer.pause()
//                     : _assetsAudioPlayer.play();
//               },
//             );
//           }
//           return const CustomLoading();
//         });
//   }

//   //
//   void disposeAudioPlayer() {
//     _assetsAudioPlayer.dispose();
//   }
// }
