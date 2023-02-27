import 'package:flutter/material.dart';
import 'package:quran/widgets/txt.dart';

//
class SibhaDropItems extends StatelessWidget {
  const SibhaDropItems({Key? key}) : super(key: key);
  //
  static final items = [
    'سبحان الله',
    'الحمد لله',
    'لا إله إلا الله',
    'الله أكبر',
    'سبحان الله وبحمده',
    ' سبحان الله العظيم',
    'اللهم صل علي سيدنا محمد',
  ];
  //
  static final _selectedValue = ValueNotifier<String>('سبحان الله');

  //
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30.0),
      child: ValueListenableBuilder(
        valueListenable: _selectedValue,
        builder: (BuildContext context, String value, _) {
          return DropdownButton<String>(
            // dropdownColor: Theme.of(context).primaryColor.withOpacity(.8),
            // isDense: true,
            isExpanded: true,
            hint: Txt(
              value,
              isUseFontSizePrefs: false,
              fontSize: 22.0,
            ),
            borderRadius: const BorderRadius.all(Radius.circular(10.0)),
            items: items.map((value) {
              return DropdownMenuItem<String>(
                child: Txt(
                  value,
                  isUseFontSizePrefs: false,
                  fontSize: 22.0,
                  // color: Colors.black,
                ),
                value: value,
              );
            }).toList(),
            onChanged: (newValue) => _selectedValue.value = newValue!,
          );
        },
      ),
    );
  }
}
