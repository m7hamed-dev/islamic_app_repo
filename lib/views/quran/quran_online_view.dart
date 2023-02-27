import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quran/animation/bottom_animation.dart';
import 'package:quran/global/depency_injection.dart';
import 'package:quran/global/quran_controller_api.dart';
import 'package:quran/tools/push.dart';
import 'package:quran/views/quran/surah_online_view.dart';
import 'package:quran/widgets/app_bar_title.dart';
import 'package:quran/widgets/custom_card.dart';
import 'package:quran/widgets/custom_loading.dart';
import 'package:quran/widgets/icon_leading.dart';
import 'package:quran/widgets/txt.dart';
import '../../tools/constants.dart';

class QuranOnlineView extends StatelessWidget {
  const QuranOnlineView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const AppBarTitle('جميع السور'),
        leading: const IconLeading(),
      ),
      body: Consumer<QuranAPI>(
        builder: (context, _controller, _) {
          //
          if (_controller.isLoading) {
            return const CustomLoading();
          }
          //
          if (_controller.isError) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: const [
                  Icon(
                    Icons.error_outline_rounded,
                    size: 60.0,
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Txt(
                      'حدث خطأ ما الرجاء المحاولة مرة اخري',
                      isUseFontSizePrefs: false,
                      fontSize: 27.0,
                    ),
                  ),
                ],
              ),
            );
          }
          return ListView.builder(
            itemCount: _controller.surahLis.length,
            physics: Constants.bouncScrollPhysics,
            itemBuilder: (BuildContext context, int index) {
              return InkWell(
                onTap: () {
                  _controller.setSurah(index);
                  Push.to(
                    context,
                    const SurahOnlineView(),
                  );
                },
                child: BottomAnimator(
                  time: Duration(milliseconds: 10 * index),
                  child: CustomCard(
                    margin: const EdgeInsets.all(4.0),
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundColor:
                            DI.primaryColor(context).withOpacity(.5),
                        child: Txt(
                          _controller.surahLis[index].number.toString(),
                          isUseFontSizePrefs: false,
                          fontSize: 13.0,
                        ),
                      ),
                      title: Txt(
                        _controller.surahLis[index].name,
                        isUseFontSizePrefs: false,
                        fontSize: 16.0,
                      ),
                      subtitle: Txt(
                        _controller.surahLis[index].revelationType,
                        isUseFontSizePrefs: false,
                        fontSize: 13.0,
                      ),
                      trailing: MecaMedinaAsset(
                        place: _controller.surahLis[index].revelationType,
                      ),
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class MecaMedinaAsset extends StatelessWidget {
  const MecaMedinaAsset({
    Key? key,
    required this.place,
    this.width,
    this.height,
  }) : super(key: key);

  ///
  final String place;
  final double? width, height;

  ///
  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/arabic_quran/$path.png',
      width: width ?? 30.0,
      height: height ?? 30.0,
    );
  }

  String get path => place.contains('Meccan') ? 'Mecca' : 'Medina';
}
