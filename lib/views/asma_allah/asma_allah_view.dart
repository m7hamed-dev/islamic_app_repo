import 'dart:math';
import 'package:flutter/material.dart';
import 'package:quran/global/future_string.dart';
import 'package:quran/tools/constants.dart';
import 'package:quran/tools/imgs.dart';
import 'package:quran/tools/push.dart';
import 'package:quran/tools/screen_util.dart';
import 'package:quran/widgets/app_bar_title.dart';
import 'package:quran/widgets/blur_widget.dart';
import 'package:quran/widgets/custom_card.dart';
import 'package:quran/widgets/custom_loading.dart';
import 'package:quran/widgets/fitted_back_img.dart';
import 'package:quran/widgets/icon_leading.dart';
import 'package:quran/widgets/txt.dart';
import '../../animation/bottom_animation.dart';
import '../../global/custom_app_bar_shape.dart';
import 'asma_allah_model.dart';

class AsmaAllahView extends StatefulWidget {
  const AsmaAllahView({
    Key? key,
    this.isShowAllNamesOfAllah,
  }) : super(key: key);
  //
  final bool? isShowAllNamesOfAllah;
  //
  @override
  State<AsmaAllahView> createState() => _AsmaAllahViewState();
}

class _AsmaAllahViewState extends State<AsmaAllahView> {
  //
  List<AsmaAllahModel> names = [];
  late bool isLoading;
  //
  Future getData() async {
    isLoading = true;
    String jsonString = await FutureString.from('assets/json/asma_allah.json');
    final result = asmaAllahModelFromJson(jsonString);
    names = result;
    isLoading = false;
    setState(() {});
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

  // Used to generate random integers
  final _random = Random();
  //
  Color get _boxColor =>
      Colors.primaries[_random.nextInt(Colors.primaries.length)].shade400;

  ///
  @override
  Widget build(BuildContext context) {
    if (widget.isShowAllNamesOfAllah != null) {
      return Scaffold(
        appBar: AppBar(
          title: const AppBarTitle('أسماء الله الحسني'),
          shape: CustomAppBarShape(),
          leading: const IconLeading(),
        ),
        body: isLoading
            ? const CustomLoading()
            : ListView.builder(
                itemCount: names.length,
                // itemExtent: 120.0,
                physics: Constants.bouncScrollPhysics,
                itemBuilder: (BuildContext context, int index) {
                  return BottomAnimator(
                    time: Duration(milliseconds: 300 + index * 3),
                    child: CustomCard(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // const Spacer(),
                          LeadingColor(color: _boxColor),
                          const SizedBox(width: 10.0),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Txt(
                                names[index].name,
                                isUseFontSizePrefs: false,
                                fontSize: 26.0,
                                fontWeight: FontWeight.bold,
                              ),
                              const SizedBox(height: 10.0),
                              Txt(
                                names[index].name,
                                isUseFontSizePrefs: false,
                                fontSize: 14.0,
                                // fontWeight: FontWeight.bold,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    // child: Padding(
                    //   padding: const EdgeInsets.all(8.0),
                    //   child: Container(
                    //     height: 100.0,
                    //     decoration: CustomBoxDecoraton.decoration(context),
                    //     child: ListTile(
                    //       leading: LeadingColor(color: _boxColor),
                    //       title: Padding(
                    //         padding: const EdgeInsets.all(8.0),
                    //         child: Txt(
                    //           names[index].name,
                    //           isUseFontSizePrefs: false,
                    //           fontSize: 26.0,
                    //           fontWeight: FontWeight.bold,
                    //         ),
                    //       ),
                    //       subtitle: Txt(
                    //         'names[index].meaning',
                    //         isUseFontSizePrefs: false,
                    //         fontSize: 16.0,
                    //         textAlign: TextAlign.center,
                    //         // fontWeight: FontWeight.bold,
                    //       ),
                    //     ),
                    //   ),
                    // ),
                  );
                },
              ),
      );
    }
    return Container(
      height: ScreenUtil.getHeight(context) * 0.24,
      margin: const EdgeInsets.symmetric(vertical: 10.0),
      child: isLoading
          ? const CustomLoading()
          : CardAsmaAllah(
              isShowAll: true,
              meaning: '',
              name: names[Random().nextInt(80)].name,
            ),
    );
  }
}

class CardAsmaAllah extends StatelessWidget {
  //
  const CardAsmaAllah({
    Key? key,
    required this.name,
    required this.meaning,
    required this.isShowAll,
  }) : super(key: key);

  final String name;
  final String meaning;
  final bool isShowAll;

  @override
  Widget build(BuildContext context) {
    //
    return SizedBox(
      height: ScreenUtil.getHeight(context) * 0.22,
      // margin: const EdgeInsets.symmetric(vertical: 0.0),
      child: Stack(
        // alignment: Alignment.center,
        children: [
          const FittedBackImage(img: Imags.bc),
          Positioned(
            top: 10.0,
            right: 10.0,
            left: 10.0,
            child: BlurWidget(
              child: Txt(
                name,
                isUseFontSizePrefs: false,
                fontSize: 22.0,
                color: Colors.white,
              ),
            ),
          ),
          isShowAll
              ? Positioned(
                  bottom: 0.0,
                  right: 1.0,
                  left: 1.0,
                  child: InkWell(
                    onTap: () {
                      Push.to(
                        context,
                        const AsmaAllahView(
                          isShowAllNamesOfAllah: true,
                        ),
                      );
                    },
                    child: BlurWidget(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: const [
                          Icon(
                            Icons.arrow_back_ios,
                            color: Colors.white,
                            size: 17.0,
                          ),
                          Txt(
                            'عرض الكل',
                            isUseFontSizePrefs: false,
                            fontSize: 20.0,
                            color: Colors.white,
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              : Positioned(
                  bottom: 30.0,
                  right: 1.0,
                  left: 1.0,
                  child: BlurWidget(
                    child: Txt(
                      meaning,
                      isUseFontSizePrefs: false,
                      fontSize: 20.0,
                      color: Colors.black,
                    ),
                  ),
                )
        ],
      ),
    );
  }
}

class LeadingColor extends StatelessWidget {
  const LeadingColor({
    Key? key,
    required this.color,
  }) : super(key: key);
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 60.0,
      height: 60.0,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(8.0)),
        color: color,
      ),
    );
  }
}
