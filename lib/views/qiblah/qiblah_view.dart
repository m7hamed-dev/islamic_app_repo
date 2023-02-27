// import 'package:flutter/material.dart';
// import 'package:flutter_compass/flutter_compass.dart';
// import 'dart:math' as math;

// import 'package:flutter_svg/svg.dart';

// //
// class QiblahView extends StatefulWidget {
//   const QiblahView({Key? key}) : super(key: key);
//   static const pageName = '/qiblah_view';
//   //
//   @override
//   State<QiblahView> createState() => _QiblahViewState();
// }

// class _QiblahViewState extends State<QiblahView> {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: Scaffold(
//         backgroundColor: const HSLColor.fromAHSL(1, 0, 0, 0.05).toColor(),
//         body: Builder(builder: (context) {
//           return Column(
//             children: <Widget>[
//               Expanded(child: _buildCompass()),
//             ],
//           );
//         }),
//       ),
//     );
//   }

//   Widget _buildCompass() {
//     double width = MediaQuery.of(context).size.width;
//     double height = MediaQuery.of(context).size.height;
//     // might need to accound for padding on iphones
//     //var padding = MediaQuery.of(context).padding;
//     return StreamBuilder<CompassEvent>(
//       stream: FlutterCompass.events,
//       builder: (context, snapshot) {
//         if (snapshot.hasError) {
//           return Text('Error reading heading: ${snapshot.error}');
//         }

//         if (snapshot.connectionState == ConnectionState.waiting) {
//           return const Center(
//             child: CircularProgressIndicator(),
//           );
//         }

//         double direction = snapshot.data!.heading!;

//         // if direction is null, then device does not support this sensor
//         // show error message
//         if (direction == null)
//           return Center(
//             child: Text("Device does not have sensors !"),
//           );

//         int ang = (direction.round());
//         return Stack(
//           children: [
//             Container(
//               padding: const EdgeInsets.all(5.0),
//               alignment: Alignment.center,
//               decoration: BoxDecoration(
//                 shape: BoxShape.circle,
//                 color: const Color(0xFFEBEBEB),
//               ),
//               child: Transform.rotate(
//                 angle: ((direction) * (math.pi / 180) * -1),
//                 child: SvgPicture.asset('assets/elqibla/compass.svg'),
//               ),
//             ),
//             Center(
//               child: Text(
//                 "$ang",
//                 style: const TextStyle(
//                   color: Color(0xFFEBEBEB),
//                   fontSize: 56,
//                 ),
//               ),
//             ),
//             Positioned(
//               // center of the screen - half the width of the rectangle
//               left: (width / 2) - ((width / 80) / 2),
//               // height - width is the non compass vertical space, half of that
//               top: (height - width) / 2,
//               child: SizedBox(
//                 width: width / 80,
//                 height: width / 10,
//                 child: Container(
//                   //color: HSLColor.fromAHSL(0.85, 0, 0, 0.05).toColor(),
//                   color: const Color(0xBBEBEBEB),
//                 ),
//               ),
//             ),
//           ],
//         );
//       },
//     );
//   }
// }
