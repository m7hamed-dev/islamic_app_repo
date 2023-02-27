import 'package:flutter/material.dart';

class IconLeading extends StatelessWidget {
  const IconLeading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(
        Icons.arrow_back_ios,
        // color: Colors.black,
      ),
      onPressed: () => Navigator.of(context).pop(),
    );
  }
}
