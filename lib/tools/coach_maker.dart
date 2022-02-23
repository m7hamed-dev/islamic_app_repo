import 'package:coachmaker/coachmaker.dart';
import 'package:flutter/material.dart';

class CustomCoachMaker {
  //
  static void callCoachMaker(
      {required BuildContext context,
      required String initial,
      bool? isShowSkipBtn,
      dynamic subtitle,
      required List<CoachModel> coachModelList,
      bool? isShowCochMaker}) {
    if (isShowCochMaker == true) {
      CoachMaker(
        context,
        initialList: coachModelList,
        // buttonOptions: CoachButtonOptions(
        //   skipTitle: 'skipTitle',
        //   buttonTitle: 'buttonTitle',
        // ),
        skip: () => isShowSkipBtn,
      ).show();
    }
  }

  static CoachPoint putWidgetInCoachMaker(
          {required Widget child, required String initial}) =>
      CoachPoint(initial: initial, child: child);
}
