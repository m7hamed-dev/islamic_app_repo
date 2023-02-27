// // import 'package:concentric_transition/concentric_transition.dart';
// import 'package:flutter/material.dart';
// // import 'package:lottie/lottie.dart';
// import 'package:quran/global/key_prefs.dart';
// import 'package:quran/home/home_view.dart';
// import 'package:quran/tools/push.dart';
// import 'package:quran/views/intro/intro_provider.dart';
// import 'card_planet.dart';

// class IntroView extends StatefulWidget {
//   const IntroView({Key? key}) : super(key: key);

//   @override
//   State<IntroView> createState() => _IntroViewState();
// }

// class _IntroViewState extends State<IntroView> {
//   late PageController pageController;
//   //
//   @override
//   void initState() {
//     pageController = PageController(initialPage: 0);
//     super.initState();
//   }

//   static final data = <CardPlanetData>[
//     CardPlanetData(
//       title: "التطبيق مجاني بالكامل ",
//       subtitle: 'لايحتوي علي اي اعلانات ',
//       image: const AssetImage("assets/images/img-1.png"),
//       backgroundColor: const Color.fromRGBO(0, 10, 56, 1),
//       titleColor: Colors.pink,
//       subtitleColor: Colors.white,
//       background: LottieBuilder.asset("assets/animation/bg-1.json"),
//     ),
//     CardPlanetData(
//       title: "قران كريم",
//       subtitle: 'لايحتوي علي اي اعلانات ',
//       image: const AssetImage("assets/images/img-2.png"),
//       backgroundColor: Colors.white,
//       titleColor: Colors.purple,
//       subtitleColor: const Color.fromRGBO(0, 10, 56, 1),
//       background: LottieBuilder.asset("assets/animation/bg-2.json"),
//     ),
//     CardPlanetData(
//       title: "سبحه",
//       subtitle: 'لايحتوي علي اي اعلانات ',
//       image: const AssetImage("assets/images/img-3.png"),
//       backgroundColor: const Color.fromARGB(255, 138, 9, 85),
//       titleColor: Colors.yellow,
//       subtitleColor: Colors.white,
//       background: LottieBuilder.asset("assets/animation/bg-3.json"),
//     ),
//     CardPlanetData(
//       title: "اسئله متنوعه",
//       subtitle: 'لايحتوي علي اي اعلانات ',
//       image: const AssetImage("assets/images/img-3.png"),
//       backgroundColor: const Color.fromRGBO(71, 59, 117, 1),
//       titleColor: Colors.yellow,
//       subtitleColor: Colors.white,
//       background: LottieBuilder.asset("assets/animation/bg-3.json"),
//     ),
//     CardPlanetData(
//       title: "اسئله متنوعه",
//       subtitle: 'لايحتوي علي اي اعلانات ',
//       image: const AssetImage("assets/images/img-3.png"),
//       backgroundColor: const Color.fromARGB(255, 111, 152, 14),
//       titleColor: Colors.yellow,
//       subtitleColor: Colors.white,
//       background: LottieBuilder.asset("assets/animation/bg-3.json"),
//     ),
//   ];

//   //
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: ConcentricPageView(
//         itemCount: data.length,
//         colors: data.map((e) => e.backgroundColor).toList(),
//         itemBuilder: (int index, double value) {
//           debugPrint('value = $value');
//           return CardPlanet(
//             data: data[index],
//             index: index == 4 ? 4 : null,
//           );
//         },
//         onFinish: _onFinish,
//         curve: Curves.linear,
//         // curve: Curves.easeOutSine,
//       ),
//     );
//   }

//   @override
//   void dispose() {
//     pageController.dispose();
//     super.dispose();
//   }

//   //
//   void _onFinish() {
//     IntroProvider().setValue(KeyPrefs.onBoardingKey, true);
//     Push.to(context, const HomeView());
//   }
// }
