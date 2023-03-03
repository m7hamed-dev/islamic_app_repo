// import 'package:flutter/material.dart';

// import '../view/constant.dart';

// class CustomForeContainer extends StatelessWidget {
//   const CustomForeContainer(
//       {Key? key,
//       required this.height1,
//       required this.image,
//       required this.title,
//       required this.color,
//       this.onpressed})
//       : super(key: key);

//   final double height1;
//   final String image;
//   final String title;
//   final Function? onpressed;
//   final Color color;

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () {},
//       child: Container(
//         height: height1,
//         decoration: BoxDecoration(
//           boxShadow: [
//             BoxShadow(
//               color: Colors.grey.withOpacity(0.5),
//               spreadRadius: 5,
//               blurRadius: 7,
//               offset: Offset(1.5, 3), // changes position of shadow
//             ),
//           ],
//           borderRadius: BorderRadius.circular(25),
//           image: const DecorationImage(
//             image: AssetImage('assets/icons/dashboard.png'),
//             fit: BoxFit.fill,
//           ),
//         ),
//         child: Container(
//           decoration: BoxDecoration(
//             color: color.withOpacity(0.8),
//             borderRadius: BorderRadius.circular(25),
//           ),
//           child: Padding(
//             padding: EdgeInsets.symmetric(),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Image(image: AssetImage(image), width: 50.0, height: 50.0),
//                 Spacer(),
//                 Padding(
//                   padding: EdgeInsets.only(left: 10.0),
//                   child: Text(title, style: titleStyle()),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
