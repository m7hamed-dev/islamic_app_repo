class SurahLogic {
  //
  static String convertPlaceToArabic(String type) =>
      type != 'Mecca' ? 'مدنية' : 'مكية';
  //
  static String getUrlMekiaOrMednia(String type) =>
      type == 'Mecca' ? 'Mecca.png' : 'Medina.png';
}
