import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quran/widgets/txt.dart';
import 'quiez_controller.dart';
import 'quiez_view.dart';

class CardOption extends StatelessWidget {
  const CardOption({
    Key? key,
    required this.text,
    required this.index,
    required this.press,
  }) : super(key: key);
  //
  final String text;
  final int index;
  final void Function() press;

  @override
  Widget build(BuildContext context) {
    return Consumer<QuiezController>(builder: (context, qnController, _) {
      //
      Color getTheRightColor() {
        if (qnController.isAnswered) {
          if (index == qnController.correctAns) {
            return kGreenColor;
          } else if (index == qnController.selectedAns &&
              qnController.selectedAns != qnController.correctAns) {
            return kRedColor;
          }
        }
        return kGrayColor;
      }

      IconData getTheRightIcon() {
        return getTheRightColor() == kRedColor ? Icons.close : Icons.done;
      }

      return InkWell(
        onTap: press,
        child: Container(
          margin: const EdgeInsets.all(10.0),
          padding: const EdgeInsets.all(18.0),
          decoration: BoxDecoration(
            border: Border.all(color: getTheRightColor()),
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Txt(
                "${index + 1}. $text",
                isUseFontSizePrefs: false,
                fontSize: 18.0,
                color: getTheRightColor(),
              ),
              AnimatedContainer(
                duration: const Duration(milliseconds: 600),
                height: 26,
                width: 26,
                decoration: BoxDecoration(
                  color: getTheRightColor() == kGrayColor
                      ? Colors.transparent
                      : getTheRightColor(),
                  borderRadius: BorderRadius.circular(50),
                  border: Border.all(color: getTheRightColor()),
                ),
                child: getTheRightColor() == kGrayColor
                    ? null
                    : Icon(getTheRightIcon(), size: 16),
              )
            ],
          ),
        ),
      );
    });
  }
}
