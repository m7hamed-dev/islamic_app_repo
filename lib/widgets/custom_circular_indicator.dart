import 'package:flutter/material.dart';
import 'package:quran/widgets/custom_card.dart';

class CustomLoading extends StatelessWidget {
  const CustomLoading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CustomCard(
        // height: MediaQuery.of(context).size.height / 5,
        // width: MediaQuery.of(context).size.width / 2,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            CircularProgressIndicator(),
            SizedBox(height: 10.0),
            Text('please waiting ..')
          ],
        ),
      ),
    );
  }
}
