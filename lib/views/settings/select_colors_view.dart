import 'package:flutter/material.dart';
import 'package:quran/animation/bottom_animation.dart';

class SelectColorsView extends StatelessWidget {
  const SelectColorsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 7,
          mainAxisSpacing: 4.0,
          crossAxisSpacing: 4.0,
        ),
        itemCount: 10,
        itemBuilder: (BuildContext context, int index) {
          return BottomAnimator(
            time: const Duration(milliseconds: 900),
            child: Container(
              width: 40.0,
              height: 40.0,
              color: Colors.red,
            ),
            //+ index * 100
          );
        },
      ),
    );
  }
}
