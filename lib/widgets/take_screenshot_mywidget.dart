import 'package:flutter/material.dart';
import 'package:quran/global/depency_injection.dart';
import 'package:quran/widgets/app_bar_title.dart';
import 'package:quran/widgets/icon_leading.dart';
import 'package:quran/widgets/icon_show_bottomnavigation.dart';
import 'package:quran/widgets/navigation_bottom_settings.dart';
import 'package:quran/widgets/txt.dart';
import 'package:share_files_and_screenshot_widgets/share_files_and_screenshot_widgets.dart';
import '../tools/constants.dart';
import '../tools/custom_share.dart';

//
class TakeScreenShotMyWidget extends StatefulWidget {
  //
  const TakeScreenShotMyWidget({
    Key? key,
    required this.text,
    required this.title,
  }) : super(key: key);
  //
  final String title;
  final String text;

  @override
  State<TakeScreenShotMyWidget> createState() => _TakeScreenShotMyWidgetState();
}

class _TakeScreenShotMyWidgetState extends State<TakeScreenShotMyWidget> {
  //
  final _previewContainer = GlobalKey();

  Future<void> _takeScreenShot() async {
    ShareFilesAndScreenshotWidgets().shareScreenshot(
      _previewContainer,
      800,
      "Title",
      "Name.png",
      "image/png",
      text: widget.title,
    );
  }

  //
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const AppBarTitle('مشاركة الصورة'),
        leading: const IconLeading(),
        actions: [
          IconButton(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            onPressed: _takeScreenShot,
            icon: const Icon(Icons.ios_share),
          ),
          const IconShowBottomNavigation()
        ],
        // shape: CustomAppBarShape(),
      ),
      body: Center(
        child: RepaintBoundary(
          key: _previewContainer,
          child: Card(
            margin: const EdgeInsets.all(10.0),
            elevation: 7.0,
            // color: Colors.white,
            // alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(height: 10.0),
                Txt(
                  widget.title,
                  isUseFontSizePrefs: false,
                  fontSize: 14.0,
                  textAlign: TextAlign.center,
                ),
                const Divider(),
                Txt(
                  widget.text,
                  isUseFontSizePrefs: false,
                  fontSize: 16.0,
                  textAlign: TextAlign.center,
                ),
                const Divider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  // crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Txt(
                      'تطبيق خطي إسلاميه',
                      isUseFontSizePrefs: false,
                      fontSize: 11.0,
                      textAlign: TextAlign.center,
                    ),
                    Container(
                      width: .5,
                      height: 25.0,
                      color: DI.primaryColor(context),
                    ),
                    Image.asset(
                      'assets/logo.png',
                      width: 50.0,
                      height: 50.0,
                    ),
                    Container(
                      width: .5,
                      height: 25.0,
                      color: DI.primaryColor(context),
                    ),
                    InkWell(
                      onTap: () {
                        const txtShare = '''
${Constants.appName} \n
تطبيق يحتوي علي مجموعه اسلاميه من قراءة قرآن كريم اذكار المسلم تسبيح اسئله دينيه معلومات اسلاميه كما يمكنك من مشاركة كل هذه الاشياء مع اصدقائك
ساهم في نشر التطبيق فالدال على الخير كفاعله
 رابط التحميل: 
 ${Constants.linkAppInGoolePlayStore}
 ''';
                        CustomShare.shareTxt(txtShare);
                      },
                      child: const Txt(
                        'مشاركة التطبيق',
                        isUseFontSizePrefs: false,
                        fontSize: 13.0,
                        textAlign: TextAlign.center,
                      ),
                    )
                  ].map((e) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10.0,
                      ),
                      child: e,
                    );
                  }).toList(),
                ),
              ].map((e) {
                return Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 10.0,
                    horizontal: 30.0,
                  ),
                  child: e,
                );
              }).toList(),
            ),
          ),
        ),
      ),
      bottomNavigationBar: const NavigationBbottomSettings(),
    );
  }
}
