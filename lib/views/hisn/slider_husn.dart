import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';

class SliderHusn extends StatelessWidget {
  const SliderHusn({
    Key? key,
    required this.value,
    required this.max,
    required this.min,
  }) : super(key: key);
  final String value;
  final String min;
  final String max;
  @override
  Widget build(BuildContext context) {
    final _sliderController = context.watch<SliderController>();
    return Slider(
      value: double.parse(value),
      min: 10,
      max: 100,
      onChanged: (value) {},
    );
  }
}

class SliderController extends ChangeNotifier {
  double value = 100.0;
  void onChange(double val) {
    value = val;
    notifyListeners();
  }
}
