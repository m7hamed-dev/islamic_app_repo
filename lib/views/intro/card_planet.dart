import 'package:flutter/material.dart';
import 'package:quran/global/key_prefs.dart';
import 'package:quran/views/intro/intro_provider.dart';
import 'package:quran/widgets/btn.dart';
import 'package:quran/widgets/txt.dart';

class CardPlanetData {
  final String title;
  final String subtitle;
  final ImageProvider image;
  final Color backgroundColor;
  final Color titleColor;
  final Color subtitleColor;
  final Widget? background;

  CardPlanetData({
    required this.title,
    required this.subtitle,
    required this.image,
    required this.backgroundColor,
    required this.titleColor,
    required this.subtitleColor,
    this.background,
  });
}

class CardPlanet extends StatelessWidget {
  const CardPlanet({
    Key? key,
    required this.data,
    this.index,
  }) : super(key: key);

  ///
  final CardPlanetData data;
  final int? index;

  ///
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        if (data.background != null) data.background!,
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(flex: 3),
              Flexible(
                flex: 20,
                child: Image.asset('assets/home/peace.jpeg'),
                // child: Image(image: data.image),
              ),
              const Spacer(flex: 1),
              Txt(
                data.title,
                color: data.titleColor,
                fontSize: 30,
                isUseFontSizePrefs: false,
              ),
              const Spacer(flex: 1),
              Txt(
                data.subtitle,
                color: data.subtitleColor,
                fontSize: 15,
                isUseFontSizePrefs: false,
              ),
              const Spacer(flex: 10),
              if (index != null)
                Btn(
                  onPressed: () {
                    IntroProvider().setValue(KeyPrefs.onBoardingKey, false);
                  },
                  child: const Text('finish'),
                )
            ],
          ),
        ),
      ],
    );
  }
}
