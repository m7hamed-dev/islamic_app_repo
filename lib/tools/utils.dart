class Utils {
  static String getImageByPrayerName(String name) {
    String path = '';
    //
    switch (name) {
      // case 'Imsak':
      //   path = 'subuh';
      //   break;
      case 'sunrise':
        path = 'sunrise';
        break;
      case 'shubuh':
        path = 'subuh';
        break;
      //
      case 'dhuhr':
        path = 'zhur';
        break;
      //
      case 'asr':
        path = 'asr';
        break;
      // //
      // case 'sunSet':
      //   path = 'sunset';
      //   break;
      //
      case 'maghrib':
        path = 'magrib';
        break;
      //
      case 'isha':
        path = 'isyah';
        break;
      //
      case 'fajr':
        path = 'subuh';
    }
    return 'assets/praying_time/$path.png';
  }

  static String translateToArabic(String word) {
    switch (word) {
      case 'fajr':
        word = 'الصبح';
        break;
      case 'dhuhr':
        word = 'الظهر';
        break;
      case 'asr':
        word = 'العصر';
        break;
      case 'maghrib':
        word = 'المغرب';
        break;
      case 'isha':
        word = 'العشاء';
    }
    return word;
  }
}
