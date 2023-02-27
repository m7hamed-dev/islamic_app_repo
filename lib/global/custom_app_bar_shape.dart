// import 'package:flutter/material.dart';

// class CustomAppBarShape extends ContinuousRectangleBorder {
//   //
//   @override
//   Path getOuterPath(Rect rect, {TextDirection? textDirection}) {
//     //
//     double height = rect.height;
//     double width = rect.width;
//     //
//     var path = Path();
//     path.lineTo(0, height + width * 0.9);
//     //
//     path.arcToPoint(
//       Offset(width * 0.1, height),
//       radius: Radius.circular(width * 0.1),
//     );
//     //
//     path.lineTo(width * 0.9, height);
//     //
//     path.arcToPoint(
//       Offset(width, height + width * 0.1),
//       // radius: Radius.circular(width * 0.1),
//       radius: Radius.circular(width * 0.1),
//     );
//     //
//     path.lineTo(width, 0);
//     path.close();

//     return path;
//   }
// }
