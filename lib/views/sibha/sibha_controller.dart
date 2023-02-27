import 'package:flutter/material.dart';
import 'package:quran/global/future_string.dart';
import 'package:quran/storage/local_storage.dart';
import '../../models/aya_ebra_model.dart';
import '../../tools/constants.dart';
import '../../tools/custom_message.dart';
import '../../widgets/txt.dart';

class SibhaController extends ChangeNotifier {
  //
  SibhaController() {
    _fetchAyaEbraData();
    getCustomZikrFromLocal();
    getLastCount();
  }
  List<AyaEbraModel> _ayaEbraModel = <AyaEbraModel>[];
  List<AyaEbraModel> get ayaEbraItems => _ayaEbraModel;
  //
  Future<void> _fetchAyaEbraData() async {
    final _jsonString = await FutureString.from('assets/json/aya_ebra.json');
    _ayaEbraModel = ayaEbraModelFromJson(_jsonString);
    notifyListeners();
  }

  ///
  String lastZikr = '';
  int count = 0;
  //
  void saveCustomZikrInLocal(String value) {
    lastZikr = value;
    notifyListeners();
    LocalStorage.saveCusomZikr(zkir: lastZikr);
  }

  void getCustomZikrFromLocal() {
    lastZikr = LocalStorage.getCustomZikr();
    notifyListeners();
  }

  //

  void incrementCount(BuildContext context) {
    count += 1;
    notifyListeners();
    //
    if (count == 118 || count == 170 || count == 200 || count == 300) {
      CustomMessage.showCustomSnackBar(
        context,
        content: const Txt(
          'أسال الله أن يتقبل منك',
          isUseFontSizePrefs: false,
          color: Colors.white,
          fontSize: Constants.txtFontSize + 10,
          fontFamily: 'pfd',
        ),
      );
    }
  }

  void getLastCount() {
    count = LocalStorage.getCountSibha();
    notifyListeners();
  }

  void resetCount() {
    LocalStorage.resetCountSibha();
    count = 0;

    notifyListeners();
  }
}
