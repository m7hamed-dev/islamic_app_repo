import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'info_islamic_model.dart';

class InfoIslamicController extends ChangeNotifier {
  //
  InfoIslamicController() {
    // get random
    // _loadRandomIrshad();
    // get all
    _loadInfoIslmic();
  }
  //
  String emptyTitle = 'اذكر الله';
  List<InfoIslamicModel> info = <InfoIslamicModel>[];
  // InfoIslamicModel _irshad = InfoIslamicModel();
  // IrshadModel getRandomIrshad() => _irshad;
  // List<IrshadModel> getAllIrshad() => info;
  //
  // void _loadRandomIrshad() async {
  //   String jsonString = await rootBundle.loadString('assets/json/info_islamic.json');
  //   final _irshadModel = irshadModelFromJson(jsonString);
  //   _irshad = _irshadModel[Random().nextInt(_irshadModel.length)];
  //   notifyListeners();
  // }

  void _loadInfoIslmic() async {
    String jsonString =
        await rootBundle.loadString('assets/json/info_islamic.json');
    final _irshadModel = infoIslamicModelFromJson(jsonString);
    info = _irshadModel;
    notifyListeners();
  }
}
