import 'package:flutter/material.dart';
import 'package:quran/tools/push.dart';
import 'package:quran/widgets/circular_icon.dart';
import '../views/inof_islamic/info_islamic_view.dart';

class IconIslamicInfo extends StatelessWidget {
  const IconIslamicInfo({Key? key, this.color}) : super(key: key);
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () => Push.to(context, const InfoIslamicView()),
      icon: const CircleIcon(icon: Icons.info_outlined),
    );
  }
}
