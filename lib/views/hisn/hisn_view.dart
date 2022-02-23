import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'hisn_model.dart';
import 'listview_hisn.dart';

class HisnView extends StatefulWidget {
  const HisnView({Key? key}) : super(key: key);
  static const pageName = '/HisnView';
  @override
  State<HisnView> createState() => _HisnViewState();
}

class _HisnViewState extends State<HisnView> {
  //
  Future _loadListZkr() async {
    String jsonString = await rootBundle.loadString('assets/json/hisn.json');
    // print('raw = $jsonString');
    final hisnModel = hisnModelFromJson(jsonString).english;
    // print(
    //     '============================ \n ${hisnModel.english.length} \n ============================');
    if (!mounted) {
      return;
    } else {
      _hisList = hisnModel;
      setState(() {});
    }
  }

  List<English> _hisList = [];
  //
  @override
  void initState() {
    super.initState();
    _loadListZkr();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListviewHisn(hisnList: _hisList),
    );
  }
}
