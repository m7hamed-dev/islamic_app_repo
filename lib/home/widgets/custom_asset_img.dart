import 'package:flutter/material.dart';

class CustomAssetImg extends StatelessWidget {
  const CustomAssetImg({
    Key? key,
    required this.path,
    this.width,
    this.height,
  }) : super(key: key);
  //
  final String path;
  final double? width;
  final double? height;
  @override
  Widget build(BuildContext context) {
    return Image.asset(
      path,
      width: width ?? 60.0,
      height: height ?? 60.0,
    );
  }
}
