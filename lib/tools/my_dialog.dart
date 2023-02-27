import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';
import 'package:quran/views/sibha/sibha_controller.dart';
import 'package:quran/widgets/btn.dart';
import 'package:quran/widgets/input.dart';

import '../widgets/txt.dart';

class MyDialog {
  static String _zikr = '';
  static Future<void> addYourZikr(BuildContext context) async {
    // final sibhaController = context.read<SibhaController>();
    return await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Txt(
            'اضافة زكر',
            isUseFontSizePrefs: false,
            fontSize: 15.0,
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Input(
                onChanged: (value) {
                  _zikr = value;
                },
                hintText: 'اكتبه هنا',
              ),
              const SizedBox(height: 20.0),
              Btn(
                child: const Text('اضافة'),
                onPressed: () async {
                  context.read<SibhaController>().saveCustomZikrInLocal(_zikr);
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
