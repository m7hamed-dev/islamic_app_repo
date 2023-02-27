import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quran/tools/convert_to_arabic_num.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';
import '../../widgets/txt.dart';
import 'sibha_controller.dart';

class SibhaBody extends StatelessWidget {
  const SibhaBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //
    return Consumer<SibhaController>(
      builder: (BuildContext context, SibhaController value, _) {
        return Container(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Txt(
                  value.lastZikr,
                  isUseFontSizePrefs: false,
                  fontSize: 22.0,
                ),
                const SizedBox(height: 40.0),
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
                  onChange: (double value) {
                    return;
                  },
                  onChangeStart: (double startValue) {
                    return;
                  },
                  onChangeEnd: (double endValue) {
                    return;
                  },
                  innerWidget: (double _) {
                    final String _count =
                        ConvertTo.toArabicNumber('${value.count}');
                    debugPrint('hash code = ${_count.hashCode}');
                    //
                    return Center(
                      child: Txt(
                        _count,
                        isUseFontSizePrefs: false,
                        fontSize: 20.0,
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
