// import 'package:flutter/material.dart';
// import 'package:flutter_vibrate/flutter_vibrate.dart';

// class VibrateAPIsProvider extends ChangeNotifier {
//   //
//   VibrateAPIsProvider() {
//     checkDeviceCanVibrate();
//   }
//   //
//   Future<bool> checkDeviceCanVibrate() async {
//     return await Vibrate.canVibrate;
//   }

//   bool _canVibrate = false;
//   bool get getCanVibrate => _canVibrate;
//   //
//   void runVibrate() async {
//     const feedback = FeedbackType.success;
//     if (_canVibrate) {
//       Vibrate.feedback(feedback);
//     }
//   }

//   void onChanged(bool value) {
//     _canVibrate = !_canVibrate;
//     notifyListeners();
//   }
// }
