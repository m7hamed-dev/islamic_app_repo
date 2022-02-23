import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:quran/views/irshad/listview_irshad.dart';
import 'package:quran/widgets/custom_circular_indicator.dart';
import 'irshad_model.dart';

class IrshadController extends ChangeNotifier {
  //
  IrshadController() {
    debugPrint('instance from IrshadController() is creation ...... ');
    futureData();
  }
  //
  List<IrshadModel> irshads = <IrshadModel>[];
  //
  Future<List<IrshadModel>> futureData() async {
    //
    return Future.value(rootBundle.loadString('assets/json/irshad.json'))
        .then((value) {
      irshads = irshadModelFromJson(value);
      notifyListeners();
      return irshadModelFromJson(value);
    });
  }

  //
  Widget getIrshaDatas() {
    debugPrint('getIrshaData');
    return FutureBuilder(
      future: futureData(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        //
        if (snapshot.data == null) {
          return const CustomLoading();
        }
        //
        if (snapshot.hasData) {
          final data = irshadModelFromJson(snapshot.data!);
          if (data.length < 4) {
            data.map((e) {
              debugPrint('data = $e');
            });
          }
          irshads = data;
          return const ListviewIrshad();
        }
        //
        if (snapshot.hasError) {
          debugPrint('${snapshot.error}');
        }
        return const CustomLoading();
      },
      //  return const Center(child: CustomLoading());
    );
  }
}
