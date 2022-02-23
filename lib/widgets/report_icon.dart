import 'package:flutter/material.dart';

class ReportIcon extends StatelessWidget {
  const ReportIcon({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: const Icon(
        Icons.report_problem_rounded,
        color: Colors.amber,
      ),
      onTap: () {},
    );
  }
}
