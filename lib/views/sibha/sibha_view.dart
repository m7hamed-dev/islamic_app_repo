import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quran/styles/txt_style.dart';
import 'package:quran/tools/custom_message.dart';
import 'package:quran/tools/custom_share.dart';
import 'package:quran/tools/my_dialog.dart';
import 'package:quran/tools/screen_util.dart';
import 'package:quran/views/sibha/sibha_controller.dart';
import 'package:quran/widgets/btn.dart';
import 'package:quran/widgets/txt.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';

class SibhaView extends StatelessWidget {
  const SibhaView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                    child: const Icon(Icons.add),
                    // child: const Text('add your custom zikr'),
                    onTap: () {
                      MyDialog.addYourZikr(context);
                    },
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              customBorder: Border.all(
                width: 30.0,
              ),
              onTap: () => CustomShare.shareTxt(
                'sibha',
                subject: context.read<SibhaController>().count.toString(),
                // 'qura app',
              ),
              child: const Icon(Icons.share),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: context.read<SibhaController>().resetCount,
              child: const Icon(
                Icons.restore,
              ),
            ),
          ),
        ],
      ),
      body: observalbleCounterWidget(context),
    );
  }

  Consumer observalbleCounterWidget(BuildContext context) {
    return Consumer<SibhaController>(
      builder: (BuildContext context, SibhaController value, Widget? child) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Txt(
                  value.lastZikr,
                  color: Colors.black,
                  isUseFontSizePrefs: false,
                  fontSize: 90,
                ),
                SleekCircularSlider(
                  min: 0,
                  max: double.parse(value.count.toString()) + 30,
                  initialValue: double.parse(value.count.toString()),
                  appearance: CircularSliderAppearance(
                    customWidths: CustomSliderWidths(progressBarWidth: 10),
                    customColors: CustomSliderColors(
                      // dotColor: Theme.of(context).primaryColor,
                      progressBarColor: Theme.of(context).primaryColor,
                      trackColor: Colors.pink,
                    ),
                    // spinnerDuration: 400,
                    animDurationMultiplier: 2.0,
                  ),
                  onChange: (double value) {},
                  onChangeStart: (double startValue) {},
                  onChangeEnd: (double endValue) {},
                  innerWidget: (double _) => Center(
                    child: Text(
                      value.count.toString(),
                      style: TxtStyle.customStyle(fontSize: 20.0),
                    ),
                  ),
                ),
                // SizedBox(height: ScreenUtil.getHeight(context) * 0.20),
                Btn(
                  shape: const CircleBorder(),
                  padding: const EdgeInsets.all(10.0),
                  color: Theme.of(context).primaryColor,
                  onPressed: () {
                    value.incrementCount();
                    CustomMessage.showCongratuldationsSnackBar(
                      context,
                      'dont give up !!',
                      countTsbih: value.count,
                    );
                  },
                  child: Icon(
                    Icons.touch_app_sharp,
                    size: ScreenUtil.isMobile(context) ? 40.0 : 90.0,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
