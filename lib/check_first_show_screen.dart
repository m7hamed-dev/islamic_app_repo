// import 'package:flutter/material.dart';

// import 'home/home_view.dart';
// import 'views/achievements/achievements_view.dart';
// import 'views/intro/into_view.dart';
// import 'views/intro/intro_provider.dart';

// class CheckFirstShowScreen extends StatelessWidget {
//   const CheckFirstShowScreen({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     // return SibhaView();
//     return FutureBuilder<bool>(
//       future: IntroProvider().getValue('on_boarding_key'),
//       initialData: true,
//       builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
//         if (snapshot.data == null) {
//           return const CircularProgressIndicator.adaptive();
//         }
//         if (snapshot.hasData) {
//           bool _isShowOnBoradingView = snapshot.data ?? true;
//           if (_isShowOnBoradingView) {
//             return const HomeView();
//             return const AchievementsView();
//             return const IntroView();
//           }
//           return const HomeView();
//         }
//         return const CircularProgressIndicator.adaptive();
//       },
//     );
//   }
// }
