import 'package:flutter/material.dart';
import 'package:quran/widgets/circular_icon.dart';

class NextPreviousArrow extends StatelessWidget {
  const NextPreviousArrow({Key? key, required this.pageController})
      : super(key: key);

  final PageController pageController;
  //
  @override
  Widget build(BuildContext context) {
    //
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          InkWell(
            onTap: () {
              pageController.previousPage(
                duration: const Duration(milliseconds: 400),
                curve: Curves.easeInToLinear,
              );
            },
            child: const CircleIcon(icon: Icons.arrow_back_ios_new),
          ),
          const SizedBox(width: 10.0),
          InkWell(
            onTap: () {
              pageController.nextPage(
                duration: const Duration(milliseconds: 400),
                curve: Curves.easeInToLinear,
              );
            },
            child: const CircleIcon(icon: Icons.arrow_forward_ios_rounded),
          ),
        ],
      ),
    );
  }
}
