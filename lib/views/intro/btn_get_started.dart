import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quran/home/home_view.dart';
import 'package:quran/tools/push.dart';
import 'package:quran/views/intro/intro_provider.dart';

class BtnGetStarted extends StatelessWidget {
  const BtnGetStarted({Key? key, required this.pageController})
      : super(key: key);
  final PageController pageController;
  @override
  Widget build(BuildContext context) {
    return Consumer<IntroProvider>(
      builder: ((context, _controller, _) {
        return _controller.currentIndex == 2
            ? ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.all(20.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                ),
                child: const Text('Get Started'),
                onPressed: () {
                  Push.to(context, const HomeView());
                },
              )
            : const SizedBox();
      }),
    );
  }
}
