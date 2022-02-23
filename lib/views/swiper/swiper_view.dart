import 'package:flutter/material.dart';
import 'package:flutter_swiper_plus/flutter_swiper_plus.dart';
import 'package:provider/provider.dart';
import 'package:quran/tools/push.dart';
import 'package:quran/tools/screen_util.dart';
import 'package:quran/views/irshad/irshad_controller.dart';
import 'package:quran/views/irshad/irshad_view.dart';
import 'package:quran/views/swiper/card_swiper.dart';
import 'package:quran/widgets/custom_card.dart';

class SwiperView extends StatelessWidget {
  const SwiperView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    debugPrint('####### rebuild swiper view ####### ');
    return CustomCard(
      height: ScreenUtil.getHeight(context) * 0.20,
      margin: const EdgeInsets.symmetric(horizontal: 10.0),
      // alignment: Alignment.center,
      child: Swiper(
        itemCount: context.read<IrshadController>().irshads.length,
        autoplay: true,
        loop: true,
        // duration: 30,
        autoplayDelay: 4000,
        // pagination: const SwiperPagination(),
        onTap: (_) => Push.to(context, const IrshadView()),
        // control: _swiperController(context),
        itemBuilder: (BuildContext context, int index) {
          //
          return CardSwiper(
            title: context.watch<IrshadController>().irshads[index].title,
          );
        },
      ),
    );
  }

  // SwiperControl _swiperController(BuildContext context) {
  //   return SwiperControl(
  //     size: 18.0,
  //     padding: EdgeInsets.only(
  //       top: ScreenUtil.getHeight(context) * 0.10,
  //       right: ScreenUtil.getWidth(context) * 0.15,
  //       left: ScreenUtil.getWidth(context) * 0.15,
  //     ),
  //     color: Colors.white,
  //   );
  // }

}
