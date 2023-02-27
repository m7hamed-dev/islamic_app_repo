import 'package:flutter/material.dart';

class BlurWidget extends StatelessWidget {
  //
  const BlurWidget({Key? key, required this.child}) : super(key: key);
  //
  final Widget child;
  //
  @override
  Widget build(BuildContext context) {
    //
    return Container(
      padding: const EdgeInsets.all(4.0),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        // color: Theme.of(context).primaryColor.withOpacity(.11),
        color: Colors.white.withOpacity(.4),
        borderRadius: const BorderRadius.all(
          Radius.circular(10.0),
        ),
        boxShadow: [
          BoxShadow(
            // color: Theme.of(context).primaryColor.withOpacity(.1),
            // color: Colors.white.withOpacity(.4),
            color: Colors.black.withOpacity(.03),
            blurRadius: 5.0,
            spreadRadius: 5.0,
            offset: const Offset(3.0, 3.0),
          )
        ],
      ),
      child: child,
    );
  }
}
