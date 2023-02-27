import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quran/animation/bottom_animation.dart';
import 'package:quran/global/depency_injection.dart';
import 'package:quran/tools/custom_share.dart';
import 'package:quran/tools/my_dialog.dart';
import 'package:quran/views/sibha/sibha_controller.dart';
import 'package:quran/views/sibha/sibha_drop_items.dart';
import 'package:quran/widgets/app_bar_title.dart';
import 'package:quran/widgets/icon_switch_vibrate.dart';
import '../../global/vibrate_apis.dart';
import '../../widgets/icon_leading.dart';
import 'sibha_body.dart';

class SibhaView extends StatefulWidget {
  const SibhaView({Key? key}) : super(key: key);

  @override
  State<SibhaView> createState() => _SibhaViewState();
}

class _SibhaViewState extends State<SibhaView> {
  @override
  void initState() {
    ///
    _sibha = Provider.of<SibhaController>(context, listen: false);
    _vibrateAPIsProvider =
        Provider.of<VibrateAPIsProvider>(context, listen: false);

    ///
    super.initState();
  }

  late SibhaController _sibha;
  late VibrateAPIsProvider _vibrateAPIsProvider;

  ///
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const AppBarTitle('السبحه '),
        actions: const [Actions()],
        // shape: CustomAppBarShape(),
        leading: const IconLeading(),
      ),
      body: InkWell(
        splashColor: DI.primaryColor(context).withOpacity(.08),
        onTap: () {
          _sibha.incrementCount(context);
          _vibrateAPIsProvider.runVibrate();
        },
        child: Column(
          children: const [
            SibhaDropItems(),
            SibhaBody(),
          ].map((e) {
            return BottomAnimator(
              time: const Duration(milliseconds: 300),
              child: e,
            );
          }).toList(),
        ),
      ),
      bottomNavigationBar: const BottomAnimator(
        time: Duration(milliseconds: 800),
        child: Padding(
          padding: EdgeInsets.all(10.0),
          child: IconSwitchVibrate(),
        ),
      ),
    );
  }
}

class Actions extends StatelessWidget {
  const Actions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        InkWell(
          child: const Icon(Icons.add),
          onTap: () {
            MyDialog.addYourZikr(context);
          },
        ),
        InkWell(
          customBorder: Border.all(
            width: 30.0,
          ),
          onTap: () => CustomShare.shareTxt(
            'sibha',
            subject: context.read<SibhaController>().count.toString(),
          ),
          child: const Icon(Icons.share),
        ),
        InkWell(
          onTap: context.read<SibhaController>().resetCount,
          child: const Icon(
            Icons.restore,
          ),
        ),
      ].map((e) {
        return Padding(
          padding: const EdgeInsets.all(5.0),
          child: e,
        );
      }).toList(),
    );
  }
}
