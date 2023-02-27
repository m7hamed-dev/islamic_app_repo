import 'package:flutter/material.dart';
import 'package:quran/widgets/txt.dart';

class EmptyWidget extends StatelessWidget {
  const EmptyWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: const [
          Icon(
            Icons.favorite,
            size: 90.0,
          ),
          SizedBox(height: 20.0),
          Txt(
            'لم تقم باضافة بيانات الي مفضلتك',
            isUseFontSizePrefs: false,
            fontSize: 20.0,
          )
        ],
      ),
    );
  }
}
