import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quran/views/prayer/location_serivce.dart';
import 'package:quran/widgets/btn.dart';
import '../../widgets/txt.dart';

class WidgetLocationDisable extends StatelessWidget {
  const WidgetLocationDisable({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.location_off,
            size: 120.0,
          ),
          const SizedBox(height: 20.0),
          const Txt(
            'تاكد من فتح الموقع وتوفر الانترنت لديك',
            isUseFontSizePrefs: false,
            fontSize: 20.0,
          ),
          const SizedBox(height: 20.0),
          const Txt(
            'لكي تتمكن من معرفة توقيت البلد المتواجد فيه امنحنا فقط صلاحية الوصول لموقعك',
            isUseFontSizePrefs: false,
            fontSize: 16.0,
            color: Colors.grey,
          ),
          const SizedBox(height: 20.0),
          Consumer<LocationServiceProvider>(
            builder: (context, service, _) => Btn(
              height: 60.0,
              onPressed: service.openSettingsAPI,
              child: const Txt(
                'الذهاب الي الاعدادات الخاصة بهاتفك',
                isUseFontSizePrefs: false,
                fontSize: 16.0,
                color: Colors.white,
              ),
            ),
          )
        ],
      ),
    );
  }
}
