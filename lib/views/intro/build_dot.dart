import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quran/providers/on_boardong_provider.dart';
import 'package:quran/tools/constants.dart';

class BuildDots extends StatelessWidget {
  const BuildDots({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //
    return Consumer<OnBoardingProvider>(
      builder: (BuildContext context, OnBoardingProvider provider, _) => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(
          3,
          (index) => AnimatedContainer(
            duration: const Duration(milliseconds: 1100),
            // curve: Curves.bounceInOut,
            height: provider.selectedIndex == index ? 30.0 : 20.0,
            width: provider.selectedIndex == index ? 6.0 : 6.0,
            margin: const EdgeInsets.all(4.0),
            decoration: BoxDecoration(
              color: provider.selectedIndex == index
                  ? Constants.customDarkBlue
                  : Colors.grey,
              // : Constants.customGrey,
              // shape: BoxShape.circle,
              // border: Border.all(
              //   color: currentIndex == index ? Colors.white : Colors.black,
              //   width: currentIndex == index ? 3.0 : 0.0,
              // ),
            ),
          ),
        ),
      ),
    );
  }
}
