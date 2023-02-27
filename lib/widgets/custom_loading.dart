import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quran/global/depency_injection.dart';

class CustomLoading extends StatelessWidget {
  const CustomLoading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CupertinoActivityIndicator(
        color: DI.themeController(context, isListen: true).isDarkTheme
            ? Colors.white
            : DI.primaryColor(context).withOpacity(.6),
        radius: 25.0,
      ),
    );
  }
}
