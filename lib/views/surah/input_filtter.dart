import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quran/tools/hide_keyborad.dart';
import 'package:quran/views/surah/surah_controller.dart';
import 'package:quran/widgets/input.dart';

class InputFiltter extends StatelessWidget {
  const InputFiltter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Input(
      hintText: 'enter surah name',
      onChanged: context.read<SurahController>().onChane,
      prefixIcon: context.read<SurahController>().searchValue.isEmpty
          ? null
          : InkWell(
              onTap: () {
                final _controller = context.watch<SurahController>();
                _controller.filtteSurahByPlace('all');
                _controller.clearTexr();
                HideKeyBoard.hide(context);
                // surahController.textEditingController.clear();
              },
              child: const Icon(Icons.close),
            ),
    );
  }
}
