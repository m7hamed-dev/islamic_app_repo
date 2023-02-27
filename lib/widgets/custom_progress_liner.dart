import 'package:flutter/material.dart';
import 'txt.dart';

class CustomProgressLiner extends StatefulWidget {
  const CustomProgressLiner({Key? key}) : super(key: key);

  @override
  State<CustomProgressLiner> createState() => _CustomProgressLinerState();
}

class _CustomProgressLinerState extends State<CustomProgressLiner> {
  @override
  void initState() {
    _s();
    super.initState();
  }

  double width = 4.0;
  bool isShow = false;
  //
  _s() async {
    await Future.delayed(const Duration(seconds: 2)).then((_) {
      width = 90.0;
      isShow = true;
      setState(() {});
    });
  }

  //
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AnimatedContainer(
          duration: const Duration(seconds: 3),
          width: width,
          height: 20,
          curve: Curves.easeInOut,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: <Color>[
                Theme.of(context).primaryColor,
                Theme.of(context).primaryColor.withOpacity(.5),
                Theme.of(context).primaryColor.withOpacity(.4),
              ],
            ),
          ),
          // child: ,
        ),
        AnimatedOpacity(
          opacity: isShow ? 1.0 : 0.0,
          duration: const Duration(seconds: 3),
          child: const Txt(
            'data',
            isUseFontSizePrefs: false,
            fontSize: 20.0,
          ),
        )
      ],
    );
  }
}
