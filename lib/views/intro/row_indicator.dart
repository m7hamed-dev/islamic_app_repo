import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quran/views/intro/intro_provider.dart';

class RowIndicator extends StatelessWidget {
  const RowIndicator({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Consumer<IntroProvider>(
      builder: (context, _controller, _) {
        return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(3, (cureentIndex) {
              return AnimatedContainer(
                duration: const Duration(milliseconds: 700),
                width: _controller.currentIndex == cureentIndex ? 60 : 10.0,
                margin: const EdgeInsets.all(5.0),
                height: 8.0,
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(10.0),
                ),
              );
            }));
      },
    );
  }
}
