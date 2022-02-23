class Utils {
  static String getImageByPrayerName(String name) {
    String path = '';
    //
    switch (name) {
      case 'Imsak':
        path = 'subuh';
        break;
      case 'SunRise':
        path = 'sunrise';
        break;
      case 'Shubuh':
        path = 'subuh';
        break;
      case 'Dhuhur':
        path = 'zhur';
        break;
      case 'Ashar':
        path = 'asr';
        break;
      case 'SunSet':
        path = 'sunset';
        break;
      case 'Maghrib':
        path = 'magrib';
        break;
      case 'Isya':
        path = 'isyah';
    }
    return 'assets/praying_time/' + path + '.png';
  }

  static String translateToArabic(String word) {
    switch (word) {
      case 'Shubuh':
        word = 'الصبح';
        break;
      case 'Dhuhur':
        word = 'الظهر';
        break;
      case 'Ashar':
        word = 'العصر';
        break;
      case 'المغرب':
        word = 'subuh';
    }
    return word;
  }
}
