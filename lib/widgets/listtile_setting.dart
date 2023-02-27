import 'package:flutter/material.dart';
import 'package:quran/tools/push.dart';
import 'package:quran/widgets/txt.dart';
import '../global/depency_injection.dart';
import '../styles/custom_box_decoration.dart';
import '../tools/constants.dart';

class ListTileSetting extends StatelessWidget {
  const ListTileSetting({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.icon,
    this.onTap,
    this.page,
    this.trailing,
  }) : super(key: key);

  ///
  final String title;
  final Widget subtitle;
  final IconData icon;
  final Widget? trailing;
  final Widget? page;
  final void Function()? onTap;

  ///
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: CustomBoxDecoraton.decoration(context),
      // margin: const EdgeInsets.symmetric(vertical: 10.0),
      // padding: EdgeInsets.zero,
      child: ListTile(
        onTap: onTap ??
            () {
              if (page != null) {
                Push.to(context, page!);
              }
            },
        // contentPadding: const EdgeInsets.symmetric(
        //   horizontal: 10.0,
        //   vertical: 5.0,
        // ),
        trailing: trailing,
        leading: CircleAvatar(
          backgroundColor: DI.primaryColor(context).withOpacity(.7),
          // Color.fromARGB(255, 111, 171, 0),
          child: Icon(icon, color: Colors.white),
        ),
        title: Txt(
          title,
          isUseFontSizePrefs: false,
          fontSize: Constants.fontSizeForSettingsTxt,
        ),
        subtitle: subtitle,
      ),
    );
  }
}
