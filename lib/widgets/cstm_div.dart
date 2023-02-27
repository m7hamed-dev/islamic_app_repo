import 'package:flutter/material.dart';

class CstmDiv extends StatelessWidget {
  //
  const CstmDiv({Key? key, this.thickness}) : super(key: key);
  final double? thickness;
  //
  @override
  Widget build(BuildContext context) {
    return Divider(
      thickness: thickness ?? 7.7,
      color: Theme.of(context).primaryColor.withOpacity(.1),
    );
  }
}
