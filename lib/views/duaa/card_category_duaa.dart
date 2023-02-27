import 'package:flutter/material.dart';
import '../../tools/constants.dart';
import '../../widgets/custom_card.dart';
import '../../widgets/txt.dart';


//
String _currentImg(int index) {
  String imageUrl = '';
  switch (index) {
    case 0:
      //
      imageUrl = 'night';
      break;
    //
    case 1:
      imageUrl = 'night';
      break;
    //
    case 2:
      imageUrl = 'prayer';
      break;
    //
    case 3:
      //
      imageUrl = 'sleeping';
      break;
    //
    case 4:
      imageUrl = 'sleeping';
      break;
    //
    case 13:
      imageUrl = 'home';
      break;
    //
    case 14:
      imageUrl = 'food-blogger';
      break;
    //
    case 9:
      imageUrl = 'praying';
      break;
    //
    case 11:
      imageUrl = 'wash-your-hands';
      break;
    //
    default:
      imageUrl = 'prayer';
    // break;
  }
  return 'assets/duaa_imgs/$imageUrl.png';
}

//
class CardDuaaCategory extends StatelessWidget {
  ///
  const CardDuaaCategory({
    Key? key,
    required this.title,
    required this.index,
  }) : super(key: key);

  ///
  final String title;
  final int index;

  ///
  @override
  Widget build(BuildContext context) {
    // debugPrint('${images[index]}');
    return CustomCard(
      margin: const EdgeInsets.symmetric(
        horizontal: 5.0,
        vertical: 5.0,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image.asset(
            _currentImg(index),
            width: 50.0,
            height: 50.0,
          ),
          const SizedBox(height: 10.0),
          Txt(
            title,
            isUseFontSizePrefs: false,
            fontSize: Constants.txtFontSize,
          ),
        ],
      ),
    );
  }
}
