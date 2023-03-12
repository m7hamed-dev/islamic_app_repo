// import 'package:flutter/material.dart';
// import 'package:geolocator/geolocator.dart';

// class LocationServiceProvider extends LocationServiceAPIs with ChangeNotifier {
//   //
//   bool isGranted = false;
//   bool _serviceEnabled = false;
//   bool get serviceEnabled => _serviceEnabled;
//   late final LocationPermission locationPermission;
//   // late final PermissionStatus permissionStatus;

//   @override
//   Future<void> checkPermissionsAPI() async {
//     locationPermission = await Geolocator.requestPermission();
//     //
//     if (locationPermission == LocationPermission.denied) {
//       isGranted = false;
//       // permissionStatus = PermissionStatus.denied;
//       notifyListeners();
//     } else {
//       // permissionStatus = PermissionStatus.granted;
//       isGranted = true;
//       notifyListeners();
//     }
//   }

//   @override
//   Future<void> locationIsEnabledAPI() async {
//     _serviceEnabled = await Geolocator.isLocationServiceEnabled();
//     notifyListeners();
//   }

//   @override
//   Future<void> openSettingsAPI() async {
//     await Geolocator.openLocationSettings();
//   }
// }

// abstract class LocationServiceAPIs {
//   Future<void> locationIsEnabledAPI();
//   Future<void> openSettingsAPI();
//   Future<void> checkPermissionsAPI();
// }
