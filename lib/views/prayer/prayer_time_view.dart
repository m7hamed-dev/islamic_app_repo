import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quran/tools/constants.dart';
import 'package:quran/views/prayer/prayer_controller.dart';
import 'package:quran/views/prayer/card_prayer_time_.dart';
import 'package:quran/widgets/custom_circular_indicator.dart';
import 'package:quran/widgets/txt.dart';
import 'package:quran/widgets/txt_trans.dart';

class PrayerTimeView extends StatelessWidget {
  const PrayerTimeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //
    return Consumer<PrayerController>(
      builder: (context, _prayerController, _) {
        return Scaffold(
          appBar: AppBar(
            title: const TxtTrans(
              'prayer time',
              isUseFontSizePrefs: false,
              color: Colors.white,
            ),
          ),
          body: Center(
            child: _prayerController.isLoading
                ? const CustomLoading()
                : _prayerController.isInternetConnectionError
                    ? const Center(
                        child: Txt(Constants.internetErro),
                      )
                    : _prayerController.isInternetConnectionError
                        ? Text(_prayerController.error)
                        : const CardPrayerTime(),
          ),
        );
      },
    );
  }
}
