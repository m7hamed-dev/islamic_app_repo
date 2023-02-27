import 'package:flutter/material.dart';

import '../../tools/hijri_time.dart';
import '../../widgets/blur_widget.dart';

class RemainingRamadanWidget extends StatelessWidget {
  const RemainingRamadanWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlurWidget(
      child: RichText(
        text: TextSpan(
          text: ' المتبقي',
          style: const TextStyle(
            // fontWeight: FontWeight.bold,
            fontFamily: 'pfd',
            fontSize: 14.0, color: Colors.teal,
            // color: Colors.grey,
          ),
          children: <TextSpan>[
            const TextSpan(
              text: ' لرمضان ',
              style: TextStyle(
                // fontWeight: FontWeight.bold,
                fontFamily: 'pfd', color: Colors.teal,
                // fontSize: 14.0, color: Colors.grey,
              ),
            ),
            TextSpan(
              text: MyHijriCalendar().getRemaingOfRamadn,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontFamily: 'pfd',
                fontSize: 22.0,
                color: Colors.teal,
                // color: Theme.of(context).primaryColor,
              ),
            ),
            const TextSpan(
              text: ' يوم',
              style: TextStyle(
                // fontWeight: FontWeight.bold,
                fontFamily: 'pfd',
                // fontSize: 14.0, color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
