import 'package:flutter/material.dart';
import 'package:quran/styles/txt_style.dart';
import 'package:quran/tools/utils.dart';

class InfoTime extends StatelessWidget {
  //
  const InfoTime(this.name, this.time, {Key? key}) : super(key: key);
  //
  final String name;
  final String time;

  ///
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(.03),
            spreadRadius: 5.0,
            blurRadius: 5.0,
            offset: const Offset(.0, 2.0),
          )
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            Utils.getImageByPrayerName(name),
            width: 40.0,
          ),
          Text(
            Utils.translateToArabic(name),
            style: TxtStyle.customStyle(
              // color: Colors.white,
              fontSize: 20.0,
            ),
          ),
          Text(
            time,
            style: TxtStyle.customStyle(
              color: const Color.fromARGB(255, 79, 75, 75),
              fontWeight: FontWeight.bold,
              fontSize: 16.0,
            ),
          ),
        ],
      ),
    );
  }
}
