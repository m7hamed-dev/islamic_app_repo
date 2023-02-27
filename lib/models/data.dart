// To parse this JSON data, do
//
//     final data = dataFromJson(jsonString);

import 'dart:convert';

class Data {
  final int code;
  final String status;
  final DataClass data;

  Data({
    required this.code,
    required this.status,
    required this.data,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        code: json["code"],
        status: json["status"],
        data: DataClass.fromJson(json["data"]),
      );
}

class DataClass {
  final Timings timings;
  final Date date;
  final Meta meta;

  DataClass({required this.timings, required this.date, required this.meta});

  factory DataClass.fromRawJson(String str) =>
      DataClass.fromJson(json.decode(str));

  factory DataClass.fromJson(Map<String, dynamic> json) => DataClass(
        timings: Timings.fromJson(json["timings"]),
        date: Date.fromJson(json["date"]),
        meta: Meta.fromJson(json["meta"]),
      );
}

class Date {
  final String readable;
  final String timestamp;
  final Hijri hijri;
  final Gregorian gregorian;

  Date({
    required this.readable,
    required this.timestamp,
    required this.hijri,
    required this.gregorian,
  });

  factory Date.fromRawJson(String str) => Date.fromJson(json.decode(str));

  factory Date.fromJson(Map<String, dynamic> json) => Date(
        readable: json["readable"],
        timestamp: json["timestamp"],
        hijri: Hijri.fromJson(json["hijri"]),
        gregorian: Gregorian.fromJson(json["gregorian"]),
      );
}

class Gregorian {
  final String date;
  final String format;
  final String day;
  final GregorianWeekday weekday;
  final GregorianMonth month;
  final String year;
  final Designation designation;

  Gregorian({
    required this.date,
    required this.format,
    required this.day,
    required this.weekday,
    required this.month,
    required this.year,
    required this.designation,
  });

  factory Gregorian.fromRawJson(String str) =>
      Gregorian.fromJson(json.decode(str));

  factory Gregorian.fromJson(Map<String, dynamic> json) => Gregorian(
        date: json["date"],
        format: json["format"],
        day: json["day"],
        weekday: GregorianWeekday.fromJson(json["weekday"]),
        month: GregorianMonth.fromJson(json["month"]),
        year: json["year"],
        designation: Designation.fromJson(json["designation"]),
      );
}

class Designation {
  final String abbreviated;
  final String expanded;

  Designation({required this.abbreviated, required this.expanded});

  factory Designation.fromRawJson(String str) =>
      Designation.fromJson(json.decode(str));

  factory Designation.fromJson(Map<String, dynamic> json) => Designation(
        abbreviated: json["abbreviated"],
        expanded: json["expanded"],
      );
}

class GregorianMonth {
  final int number;
  final String en;

  GregorianMonth({required this.number, required this.en});

  factory GregorianMonth.fromRawJson(String str) =>
      GregorianMonth.fromJson(json.decode(str));

  factory GregorianMonth.fromJson(Map<String, dynamic> json) => GregorianMonth(
        number: json["number"],
        en: json["en"],
      );
}

class GregorianWeekday {
  final String en;

  const GregorianWeekday({required this.en});

  factory GregorianWeekday.fromRawJson(String str) =>
      GregorianWeekday.fromJson(json.decode(str));

  factory GregorianWeekday.fromJson(Map<String, dynamic> json) =>
      GregorianWeekday(
        en: json["en"],
      );
}

class Hijri {
  final String date;
  final String format;
  final String day;
  final HijriWeekday weekday;
  final HijriMonth month;
  final String year;
  final Designation designation;
  final List<dynamic> holidays;

  const Hijri(
      {required this.date,
      required this.format,
      required this.day,
      required this.weekday,
      required this.month,
      required this.year,
      required this.designation,
      required this.holidays});

  factory Hijri.fromRawJson(String str) => Hijri.fromJson(json.decode(str));

  factory Hijri.fromJson(Map<String, dynamic> json) => Hijri(
        date: json["date"],
        format: json["format"],
        day: json["day"],
        weekday: HijriWeekday.fromJson(json["weekday"]),
        month: HijriMonth.fromJson(json["month"]),
        year: json["year"],
        designation: Designation.fromJson(json["designation"]),
        holidays: List<dynamic>.from(json["holidays"].map((x) => x)),
      );
}

class HijriMonth {
  final int number;
  final String en;
  final String ar;

  HijriMonth({
    required this.number,
    required this.en,
    required this.ar,
  });

  factory HijriMonth.fromRawJson(String str) =>
      HijriMonth.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory HijriMonth.fromJson(Map<String, dynamic> json) => HijriMonth(
        number: json["number"],
        en: json["en"],
        ar: json["ar"],
      );

  Map<String, dynamic> toJson() => {
        "number": number,
        "en": en,
        "ar": ar,
      };
}

class HijriWeekday {
  final String en;
  final String ar;

  HijriWeekday({
    required this.en,
    required this.ar,
  });

  factory HijriWeekday.fromRawJson(String str) =>
      HijriWeekday.fromJson(json.decode(str));

  factory HijriWeekday.fromJson(Map<String, dynamic> json) => HijriWeekday(
        en: json["en"],
        ar: json["ar"],
      );
}

class Meta {
  final double latitude;
  final double longitude;
  final String timezone;
  final Method method;
  final String latitudeAdjustmentMethod;
  final String midnightMode;
  final String school;
  final Offset offset;

  Meta({
    required this.latitude,
    required this.longitude,
    required this.timezone,
    required this.method,
    required this.latitudeAdjustmentMethod,
    required this.midnightMode,
    required this.school,
    required this.offset,
  });

  factory Meta.fromRawJson(String str) => Meta.fromJson(json.decode(str));

  factory Meta.fromJson(Map<String, dynamic> json) => Meta(
        latitude: json["latitude"].toDouble(),
        longitude: json["longitude"].toDouble(),
        timezone: json["timezone"],
        method: Method.fromJson(json["method"]),
        latitudeAdjustmentMethod: json["latitudeAdjustmentMethod"],
        midnightMode: json["midnightMode"],
        school: json["school"],
        offset: Offset.fromJson(json["offset"]),
      );
}

class Method {
  final int id;
  final String name;
  final Params params;

  Method({
    required this.id,
    required this.name,
    required this.params,
  });

  factory Method.fromRawJson(String str) => Method.fromJson(json.decode(str));

  factory Method.fromJson(Map<String, dynamic> json) => Method(
        id: json["id"],
        name: json["name"],
        params: Params.fromJson(json["params"]),
      );
}

class Params {
  final double fajr;
  final dynamic isha;

  Params({
    required this.fajr,
    this.isha,
  });

  factory Params.fromRawJson(String str) => Params.fromJson(json.decode(str));

  factory Params.fromJson(Map<String, dynamic> json) => Params(
        fajr: json["Fajr"].toDouble(),
        isha: json["Isha"],
      );
}

class Offset {
  final int imsak;
  final int fajr;
  final int sunrise;
  final int dhuhr;
  final int asr;
  final int maghrib;
  final int sunset;
  final int isha;
  final int midnight;

  Offset({
    required this.imsak,
    required this.fajr,
    required this.sunrise,
    required this.dhuhr,
    required this.asr,
    required this.maghrib,
    required this.sunset,
    required this.isha,
    required this.midnight,
  });

  factory Offset.fromRawJson(String str) => Offset.fromJson(json.decode(str));

  factory Offset.fromJson(Map<String, dynamic> json) => Offset(
        imsak: json["Imsak"],
        fajr: json["Fajr"],
        sunrise: json["Sunrise"],
        dhuhr: json["Dhuhr"],
        asr: json["Asr"],
        maghrib: json["Maghrib"],
        sunset: json["Sunset"],
        isha: json["Isha"],
        midnight: json["Midnight"],
      );
}

class Timings {
  final String fajr;
  final String sunrise;
  final String dhuhr;
  final String asr;
  final String sunset;
  final String maghrib;
  final String isha;
  final String imsak;
  final String midnight;

  const Timings({
    required this.fajr,
    required this.sunrise,
    required this.dhuhr,
    required this.asr,
    required this.sunset,
    required this.maghrib,
    required this.isha,
    required this.imsak,
    required this.midnight,
  });

  factory Timings.fromRawJson(String str) => Timings.fromJson(json.decode(str));

  factory Timings.fromJson(Map<String, dynamic> json) => Timings(
        fajr: json["Fajr"],
        sunrise: json["Sunrise"],
        dhuhr: json["Dhuhr"],
        asr: json["Asr"],
        sunset: json["Sunset"],
        maghrib: json["Maghrib"],
        isha: json["Isha"],
        imsak: json["Imsak"],
        midnight: json["Midnight"],
      );
}
