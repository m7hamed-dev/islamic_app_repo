import 'dart:convert';

PrayerTimeModel prayerTimeModelFromJson(String str) =>
    PrayerTimeModel.fromJson(json.decode(str));

class PrayerTimeModel {
  PrayerTimeModel({
    required this.code,
    required this.status,
    required this.results,
  });

  int code;
  String status;
  Results results;

  factory PrayerTimeModel.fromJson(Map<String, dynamic> json) =>
      PrayerTimeModel(
        code: json["code"],
        status: json["status"],
        results: Results.fromJson(json["results"]),
      );
}

class Results {
  Results({
    required this.datetime,
    required this.location,
    required this.settings,
  });

  List<Datetime> datetime;
  Location location;
  Settings settings;

  factory Results.fromJson(Map<String, dynamic> json) => Results(
        datetime: List<Datetime>.from(
            json["datetime"].map((x) => Datetime.fromJson(x))),
        location: Location.fromJson(json["location"]),
        settings: Settings.fromJson(json["settings"]),
      );
}

class Datetime {
  Datetime({
    required this.times,
    required this.date,
  });

  Times times;
  Date date;

  factory Datetime.fromJson(Map<String, dynamic> json) => Datetime(
        times: Times.fromJson(json["times"]),
        date: Date.fromJson(json["date"]),
      );
}

class Date {
  Date({
    required this.timestamp,
    required this.gregorian,
    required this.hijri,
  });

  dynamic timestamp;
  dynamic gregorian;
  dynamic hijri;

  factory Date.fromJson(Map<String, dynamic> json) => Date(
        timestamp: json["timestamp"],
        gregorian: DateTime.parse(json["gregorian"]),
        hijri: DateTime.parse(json["hijri"]),
      );
}

class Times {
  Times({
    required this.imsak,
    required this.sunrise,
    required this.fajr,
    required this.dhuhr,
    required this.asr,
    required this.sunset,
    required this.maghrib,
    required this.isha,
    required this.midnight,
  });

  String imsak;
  String sunrise;
  String fajr;
  String dhuhr;
  String asr;
  String sunset;
  String maghrib;
  String isha;
  String midnight;

  factory Times.fromJson(Map<String, dynamic> json) => Times(
        imsak: json["Imsak"],
        sunrise: json["Sunrise"],
        fajr: json["Fajr"],
        dhuhr: json["Dhuhr"],
        asr: json["Asr"],
        sunset: json["Sunset"],
        maghrib: json["Maghrib"],
        isha: json["Isha"],
        midnight: json["Midnight"],
      );
}

class Location {
  Location({
    required this.latitude,
    required this.longitude,
    required this.elevation,
    required this.city,
    required this.country,
    required this.countryCode,
    required this.timezone,
    required this.localOffset,
  });

  dynamic latitude;
  dynamic longitude;
  dynamic elevation;
  dynamic city;
  dynamic country;
  dynamic countryCode;
  dynamic timezone;
  dynamic localOffset;

  factory Location.fromJson(Map<String, dynamic> json) => Location(
        latitude: json["latitude"].toDouble(),
        longitude: json["longitude"].toDouble(),
        elevation: json["elevation"],
        city: json["city"],
        country: json["country"],
        countryCode: json["country_code"],
        timezone: json["timezone"],
        localOffset: json["local_offset"],
      );
}

class Settings {
  Settings({
    required this.timeformat,
    required this.school,
    required this.juristic,
    required this.highlat,
    required this.fajrAngle,
    required this.ishaAngle,
  });

  dynamic timeformat;
  dynamic school;
  dynamic juristic;
  dynamic highlat;
  dynamic fajrAngle;
  dynamic ishaAngle;

  factory Settings.fromJson(Map<String, dynamic> json) => Settings(
        timeformat: json["timeformat"],
        school: json["school"],
        juristic: json["juristic"],
        highlat: json["highlat"],
        fajrAngle: json["fajr_angle"],
        ishaAngle: json["isha_angle"],
      );
}
