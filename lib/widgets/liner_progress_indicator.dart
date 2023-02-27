import 'package:flutter/material.dart';

class CustomLinearProgressIndicator extends StatefulWidget {
  //
  const CustomLinearProgressIndicator({
    Key? key,
    required this.currentValue,
    this.color,
  }) : super(key: key);
  //
  final int currentValue;
  final Color? color;

  @override
  State<CustomLinearProgressIndicator> createState() =>
      _CustomLinearProgressIndicatorState();
}

class _CustomLinearProgressIndicatorState
    extends State<CustomLinearProgressIndicator> {
  //

  late double _process;
  //
  @override
  void initState() {
    super.initState();
    _futrue();
  }

  _futrue() async {
    _process = widget.currentValue / 30;
    await Future.delayed(const Duration(milliseconds: 2500)).then((value) {
      // if (mounted && _process ) {
      setState(() {});
      // }
    });
  }

  ///
  @override
  Widget build(BuildContext context) {
    // _process = widget.currentValue / 30;
    // debugPrint('result of rmadna = $_process');
    //
    return Container(
      height: 15.0,
      // padding: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(.4),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: LinearProgressIndicator(
        value: _process,
        valueColor: const AlwaysStoppedAnimation<Color>(
          Colors.white,
          // Theme.of(context).primaryColor,
        ),
        backgroundColor: widget.color ?? Theme.of(context).primaryColor,
        // const Color.fromARGB(255, 2, 154, 7),
        minHeight: 5.0,
      ),
    );
  }
}
