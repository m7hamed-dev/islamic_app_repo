import 'package:flutter/material.dart';

class BlurWidget extends StatelessWidget {
  //
  const BlurWidget({Key? key, required this.child}) : super(key: key);
  //
  final Widget child;
  //
  @override
  Widget build(BuildContext context) {
    // return Container(
    //   padding: const EdgeInsets.all(5.0),
    //   decoration: BoxDecoration(
    //     color: Colors.grey.withOpacity(.22),
    //     // color: Theme.of(context).primaryColor,
    //     borderRadius: const BorderRadius.all(Radius.circular(10.0)),
    //     boxShadow: const [
    //       BoxShadow(
    //         color: Colors.white,
    //         // blurRadius: 10.0,
    //         // spreadRadius: 10.0,
    //       )
    //     ],
    //   ),
    //   child: child,
    // );

    //
    return Container(
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: Colors.white,
        // color: Theme.of(context).primaryColor,
        borderRadius: const BorderRadius.all(Radius.circular(10.0)),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(.10),
            blurRadius: 10.0,
            spreadRadius: 10.0,
          )
        ],
      ),
      child: child,
    );
  }
}
