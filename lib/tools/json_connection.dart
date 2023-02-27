import 'dart:convert';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:geolocator/geolocator.dart';
import 'package:quran/models/data.dart';

class JsonConnection {
  JsonConnection() {
    debugPrint('create new instance form JsonConnection');
  }
  static double? pLat;
  static double? pLong;

  late Data list;

  Future<Data> getPTLocation() async {
    final position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.medium);

    pLat = position.latitude;
    pLong = position.longitude;

    String date = DateTime.now().toIso8601String();
    int method = 4;

    final url =
        "http://api.aladhan.com/v1/timings/$date?latitude=$pLat&longitude=$pLong&method=$method";

    http.Response res =
        await http.get(Uri.parse(Uri.encodeFull(url)), headers: {
      "Accept":
          "text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8"
    });
    final data = json.decode(res.body);
    list = Data.fromJson(data);
    debugPrint('list = ${list.data}');
    return list;
  }
}
