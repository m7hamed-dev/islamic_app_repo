import 'package:flutter/material.dart';
import 'package:quran/animation/transition_animation.dart';

class Push {
  static void to(BuildContext context, Widget page) => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => page,
        ),
      );
  // transitionAnimation.circleReval(context: context, goToPage: page);
  //
  static void withPage(BuildContext context, Widget page) =>
      transitionAnimation.circleReval(context: context, goToPage: page);
  //
  static void withReplacement(BuildContext context, Widget page) =>
      transitionAnimation.circleRevalPushReplacement(
          context: context, goToPage: page);
}
