import 'package:flutter/material.dart';
import 'package:quran/styles/txt_style.dart';
import 'package:quran/widgets/input.dart';
import 'package:quran/widgets/txt.dart';

class ZkatController extends ChangeNotifier {
  // constructor
  ZkatController() {
    setZero(weightByGramController);
    setZero(priceByGramController);
  }
  void setZero(TextEditingController controller) {
    controller.text = '0.0';
  }

  final List<String> categories = <String>[
    'زكاة الذهب',
    'زكاة المال',
    'زكاة الفصة',
    'زكاة الاستثمارات العقارية',
    'زكاة الاعمال',
    'زكاة',
    'زكاة',
    'manager zkat'
  ];

  /// -------    all controllers  ---------   /////
  /// fidah
  TextEditingController weightByGramController = TextEditingController();
  TextEditingController priceByGramController = TextEditingController();

  /// money
  TextEditingController actualPriceController = TextEditingController();

  /// all results
  double resultofZkatMoney = 0.0;
  double resultofZkatFidah = 0.0;

  /// all methods
  // zkat money
  void calcZkatMony(double actualPriceMoney, double priceofGold) {
    resultofZkatMoney = actualPriceMoney / priceofGold;
    notifyListeners();
  } // زكاة الفصة

  void calcZkatFidah(double weightByGram, double priceByGram) {
    resultofZkatFidah = weightByGram * priceByGram;
    notifyListeners();
  }

  List<bool> checkList = <bool>[false, false, false];
  //
  void changeStatusIaarOfGold(int index, bool e) {
    if (e == true) {
      e = false;
      notifyListeners();
    } else {
      e = true;
      notifyListeners();
    }
  }

  bool isss = false;

  /// part calc zkat page
  String pageTitle = '';
  //
  Widget contentPage(int index) {
    if (index == 0) {
      pageTitle = 'gold';
      return ListView(
        children: [
          Row(
              children: List.generate(
            3,
            (index) => Expanded(
              child: CheckboxListTile(
                title: Text('24', style: TxtStyle.normalStyle()),
                value: isss,
                onChanged: (v) {
                  isss = !isss;
                  notifyListeners();
                },
              ),
            ),
          )),
          Input(
            controller: actualPriceController,
            hintText: 'actualPriceController',
            keyboardType: TextInputType.number,
          ),
          Input(
            controller: priceByGramController,
            hintText: 'priceByGramController',
            keyboardType: TextInputType.number,
            onChanged: (price) {
              if (price.isNotEmpty || weightByGramController.text.isNotEmpty) {
                calcZkatMony(
                  double.parse(actualPriceController.text),
                  double.parse(price),
                );
              }
            },
          ),
          Txt(
            'resultofZkatMoney = $resultofZkatMoney',
            color: Colors.black,
          )
        ]
            .map((e) => Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: e,
                ))
            .toList(),
      );
    }
    if (index == 1) {
      pageTitle = 'money';
      return ListView(
        children: [
          Input(
            controller: actualPriceController,
            hintText: 'actualPriceController',
            keyboardType: TextInputType.number,
          ),
          Input(
            controller: priceByGramController,
            hintText: 'priceByGramController',
            keyboardType: TextInputType.number,
            onChanged: (price) {
              if (price.isNotEmpty || weightByGramController.text.isNotEmpty) {
                calcZkatMony(
                  double.parse(actualPriceController.text),
                  double.parse(price),
                );
              }
            },
          ),
          Txt(
            'resultofZkatMoney = $resultofZkatMoney',
            color: Colors.black,
          )
        ],
      );
    }
    if (index == 2) {
      pageTitle = 'fida';
      //
      return ListView(
        children: [
          Input(
            controller: weightByGramController,
            hintText: 'weightByGramController',
            keyboardType: TextInputType.number,
          ),
          Input(
            controller: priceByGramController,
            hintText: 'priceByGramController',
            keyboardType: TextInputType.number,
            onChanged: (price) {
              if (price.isNotEmpty || weightByGramController.text.isNotEmpty) {
                calcZkatFidah(
                  double.parse(weightByGramController.text),
                  double.parse(price),
                );
              }
            },
          ),
          Txt(
            'resultofZkatFidah = $resultofZkatFidah',
            color: Colors.black,
          )
        ],
      );
    }
    return const SizedBox();
  }
}
