import 'package:hijri/hijri_calendar.dart';

class MyHijriCalendar {
  final _today = HijriCalendar.now();
  //
  String get getFullDateName =>
      '${_today.dayWeName} ${_today.hDay} ${_today.longMonthName}\t${_today.hYear}';

  ///
  bool get thisMonthIsRamdan => _today.longMonthName == 'رمضان';

  ///
  String get getRemaingOfRamadn => remainOfRmadn.toString();

  ///
  int get remainOfRmadn =>
      _today.getDaysInMonth(_today.hYear, _today.hMonth) - _today.hDay;
}
