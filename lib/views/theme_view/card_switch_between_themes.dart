// import 'package:flutter/material.dart';

// import '../../global/depency_injection.dart';
// import '../../widgets/listtile_setting.dart';
// import '../../widgets/txt.dart';
// import 'colors_gridview.dart';
// import 'icon_change_theme_mode.dart';

// class CardSwitchBetweenThemes extends StatelessWidget {
//   const CardSwitchBetweenThemes({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return ListTileSetting(
//       title: 'يمكنك تغيير الثيم الخاص بك',
//       subtitle: Txt(DI.themeController(context, isListen: true).isDarkTheme
//           ? 'light theme'
//           : 'dark theme'),
//       page: const ColorsListView(),
//       icon: Icons.color_lens,
//       trailing: const IconChangeThemeMode(),
//     );
//   }
// }
