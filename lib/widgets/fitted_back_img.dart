import 'package:flutter/material.dart';

class FittedBackImage extends StatelessWidget {
  const FittedBackImage({
    Key? key,
    required this.img,
  }) : super(key: key);
  final String img;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            // 'assets/home/mos.jpg',
            img,
          ),
          fit: BoxFit.cover,
        ),
        borderRadius: const BorderRadius.all(
          Radius.circular(20.0),
        ),
      ),
    );
  }
}
