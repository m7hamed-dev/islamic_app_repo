import 'package:flutter/material.dart';

class BackGroundImageWidget extends StatelessWidget {
  const BackGroundImageWidget({Key? key, required this.child})
      : super(key: key);
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Image.asset('assets/home/bg_tow.png', fit: BoxFit.cover),
          child,
        ],
      ),
    );
  }
}
