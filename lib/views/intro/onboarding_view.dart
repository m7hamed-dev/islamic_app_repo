import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quran/home/home_view.dart';
import 'package:quran/providers/on_boardong_provider.dart';
import 'package:quran/styles/txt_style.dart';
import 'package:quran/tools/constants.dart';
import 'package:quran/tools/push.dart';
import 'package:quran/views/intro/content.dart';
import 'build_dot.dart';

class OnBoardingView extends StatefulWidget {
  const OnBoardingView({Key? key}) : super(key: key);
  static const String pageName = '/intro_view';
  @override
  State<OnBoardingView> createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView> {
  double bottom = 10.0;
  final int _duration = 1100;
  //
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        child: SafeArea(
          child: Stack(
            children: [
              ///
              AnimatedContainer(
                duration: Duration(milliseconds: _duration),
                color: color(context.read<OnBoardingProvider>().selectedIndex),
                child: PageView.builder(
                  itemCount: context.read<OnBoardingProvider>().items.length,
                  onPageChanged: (index) =>
                      context.read<OnBoardingProvider>().onPageChanged(index),
                  itemBuilder: (context, index) => Content(
                    model: context.read<OnBoardingProvider>().items[index],
                  ),
                ),
              ),

              Positioned(
                bottom: 10,
                left: 0,
                right: 0.0,
                child: context.watch<OnBoardingProvider>().selectedIndex != 2
                    ? const BuildDots()
                    : const SizedBox(),
              ),
              // skip
              Positioned(
                left: 10.0,
                bottom: 10.0,
                child: InkWell(
                  onTap: () => Push.to(context, const HomeView()),
                  child: Text(
                    'skip',
                    style: TxtStyle.customStyle(
                      fontSize: 30.0,
                      // color: Colors.grey,
                    ),
                  ),
                ),
              ),
              //btn
              // Positioned(
              //   bottom: 10,
              //   left: 10,
              //   right: 10,
              //   child: AnimatedContainer(
              //     alignment: _alignmentBottomNavigationBar(),
              //     color:
              //         color(context.watch<OnBoardingProvider>().selectedIndex),
              //     // height: _heightBottomNav(),
              //     duration: const Duration(milliseconds: 900),
              //     child: Btn(
              //       width: ScreenUtil.getWidth(context),
              //       // onPressed: () => goToHomeView(context, _index),
              //       child: Text(
              //         titleBtn(
              //             context.watch<OnBoardingProvider>().selectedIndex),
              //         style: TxtStyle.customStyle(),
              //       ),
              //     ),
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}

//
String titleBtn(int index) {
  if (index == 0) {
    return 'next';
  }
  if (index == 1) {
    return 'next';
  }
  return 'Go !!';
}

//
Color color(int index) {
  return Constants.customGrey;
}
