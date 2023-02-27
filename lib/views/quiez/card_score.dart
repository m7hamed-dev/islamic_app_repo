import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'quiez_controller.dart';

class CardScore extends StatelessWidget {
  const CardScore({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<QuiezController>(
        builder: (context, qnController,
                _) => // SvgPicture.asset("assets/icons/bg.svg", fit: BoxFit.fill),
            Column(
              children: [
                const Text(
                  "Score",
                ),
                Text(
                  "${qnController.correctAns * 10}/${qnController.questions.length * 10}",
                ),
              ],
            ));
  }
}
