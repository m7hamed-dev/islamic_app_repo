import 'package:flutter/material.dart';

class CustomLinearProgressIndicator extends StatelessWidget {
  const CustomLinearProgressIndicator({
    Key? key,
    required this.currentValue,
  }) : super(key: key);
  final double currentValue;
  //
  @override
  Widget build(BuildContext context) {
    return LinearProgressIndicator(
      value: currentValue,
      valueColor: const AlwaysStoppedAnimation<Color>(Colors.grey),
      backgroundColor: Theme.of(context).primaryColor,
    );
  }
}
