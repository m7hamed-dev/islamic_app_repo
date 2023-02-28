import 'package:flutter/material.dart';
import 'package:quran/tools/hijri_time.dart';
import 'package:quran/tools/screen_util.dart';
import '../../views/ramadan/card_remaining_of_ramadan.dart';
import 'card_advaice_for_ramadan.dart';
import 'card_hijri_info.dart';

class Header extends StatelessWidget {
  const Header({Key? key}) : super(key: key);
  //
  static final _advaiceRamadan = <String>[
    ' اعتبر بمضي الزمان وتتابع الأحوال على انقضاء العمر. ',
    ' إن هذا الشهر هو شهر عبادة وعمل وليس نوم وكسل . ',
    'اعلم أن العمل أمانة فحاسب نفسك هل أداءه كما ينبغي. ',
    'سارع إلى طلب العفو ممن ظلمته قبل أن يأخذ من حسناتك. ',
    '- احرص على أن تفطر صائما فيصير لك مثل أجره. ',
    '- ابتعد عن جلساء السوء واحرص على مصاحبة الأخيار الصالحين. ',
    '- احرص على توجيه من تحت إدارتك إلى ما ينفعهم في دينهم فإنهم يقبلون منك أكثر من غيرك. ',
    '- اعلم أن هذا الشهر المبارك ضيف راحل فأحسن ضيافته فما أسرع ما تذكره إذا ولى. ',
    '- اعلم أن يوم العيد يوم شكر للرب فلا تجعله يوم انطلاق مما حبست عنه نفسك في هذا الشهر. ',
    '- احذر من الفطر دون عذر فإن من أفطر يوما من رمضان لم يقضه صوم الدهر كله ولو صامه. ',
    '- اجعل لنفسك نصيبا ولو يسيرا من الاعتكاف. ',
    ' يحسن الجهر بالتكبير ليلة العيد ويومه إلى أداء الصلاة. ',
    'اجعل لنفسك نصيبا من صوم التطوع ولا يكن عهدك بالصيام في رمضان فقط. ',
  ];
  //
  @override
  Widget build(BuildContext context) {
    //
    if (MyHijriCalendar().thisMonthIsRamdan) {
      //
      return CardAdvaiceForRamadan(advaiceRamadan: _advaiceRamadan);
    }
    //
    return SizedBox(
      height: ScreenUtil.getHeight(context) * 0.22,
      child: Stack(
        children: const [
          // FittedBackImage(img: 'assets/home/mos.jpg'),
          Positioned(
            bottom: 0.0,
            left: 5.0,
            child: RemainingRamadanWidget(),
          ),
          Positioned(
            bottom: 2.0,
            right: 0.0,
            child: CardHijriCalender(),
          ),
        ],
      ),
    );
  }

  ///
}
