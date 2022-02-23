import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  //
  const CustomCard({
    Key? key,
    required this.child,
    this.margin,
    this.padding,
    this.width,
    this.height,
  }) : super(key: key);
  //
  final Widget child;
  final EdgeInsets? margin;
  final EdgeInsets? padding;
  final double? width;
  final double? height;
  //
  @override
  Widget build(BuildContext context) {
    //
    return Container(
      margin: margin,
      padding: padding,
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6.0),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(.070),
            blurRadius: 4.0,
            spreadRadius: 2.9,
            // offset: const Offset(0.0, 1.4),
          ),
        ],
      ),
      child: child,
    );
  }
}
