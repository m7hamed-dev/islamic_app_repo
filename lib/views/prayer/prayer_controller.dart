import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'prayer_model.dart';

class PrayerController extends ChangeNotifier {
  PrayerController() {
    getPrayerTime(seletedCity);
  }
  String seletedCity = 'Khartoum';
  List<String> cities = ['Riyadh', 'Cairo', 'Khartoum'];
  //
  void onSeletedCity(String? value) {
    seletedCity = value!;
    getPrayerTime(seletedCity);
    notifyListeners();
  }

  //
  String fajr = '', dhuhr = '';
  late Times times = Times(
    imsak: 'imsak',
    sunrise: 'sunrise',
    fajr: fajr,
    dhuhr: dhuhr,
    asr: 'asr',
    sunset: 'sunset',
    maghrib: 'maghrib',
    isha: 'isha',
    midnight: 'midnight',
  );
  //
  bool isLoading = true;
  bool isInternetConnectionError = false;
  bool isError = false;
  //
  late Location location = Location(
    latitude: 0.0,
    longitude: 0.0,
    elevation: '',
    city: '',
    country: '',
    countryCode: '',
    timezone: '',
    localOffset: '',
  );
  late Date datebyHijri = Date(
    timestamp: 'timestamp',
    gregorian: 'gregorian',
    hijri: 'hijri',
  );
  //
  String error = 'error';
  //
  Future<void> getPrayerTime(String city) async {
    try {
      String url = 'https://api.pray.zone/v2/times/today.json?city=$city';
      var response = await http.get(Uri.parse(url));
      print('response = ${response.body}');
      print('response = ${response.statusCode}');
      if (response.statusCode == 200) {
        final _prayerTimeModel = prayerTimeModelFromJson(response.body);
        times = _prayerTimeModel.results.datetime[0].times;
        datebyHijri = _prayerTimeModel.results.datetime[0].date;
        location = _prayerTimeModel.results.location;
        isLoading = false;
        notifyListeners();
      }
      if (response.statusCode != 200) {
        isLoading = false;
        isError = true;
        error = 'Oops Error Accoured !!';
        notifyListeners();
      }
    } catch (excption) {
      print('excption = $excption');
      // error = Constants.internetErro;
      error = excption.toString();
      isLoading = false;
      isInternetConnectionError = true;
      notifyListeners();
    }
  }
}
