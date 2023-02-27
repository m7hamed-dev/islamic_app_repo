import 'package:flutter/material.dart';
import 'package:quran/tools/constants.dart';
import 'package:quran/widgets/app_bar_title.dart';
import '../../home/widgets/card_home_item.dart';
import '../calc_zkat/calc_zka_view.dart';
import '../inof_islamic/info_islamic_view.dart';
import '../irshad/irshad_view.dart';
// import '../read_books/read_books_online_view.dart';

class DifferentsView extends StatelessWidget {
  const DifferentsView({Key? key}) : super(key: key);
  static const pageName = '/differents_view';
  //
  @override
  Widget build(BuildContext context) {
    //
    return Scaffold(
      appBar: AppBar(
        title: const AppBarTitle('منوعات'),
      ),
      body: GridView.count(
        crossAxisCount: 3,
        mainAxisSpacing: 0.0,
        crossAxisSpacing: 0.0,
        children: const [
          CardHomeItem(
            title: 'irshad',
            image: 'home/peace.jpeg',
            page: IrshadView(),
          ),
          CardHomeItem(
            title: 'Calck Zka',
            image: 'home/zkat.jpeg',
            page: ZkatView(),
          ),
          CardHomeItem(
            title: Constants.infoIslamic,
            image: 'azkar.png',
            page: InfoIslamicView(),
          ),
        ],
      ),
    );
  }
}
