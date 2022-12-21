import 'dart:ui';

class Constants{

  static const Color mainColor = Color(0xfffec326);
  static const Color mainColor2 = Color(0xfffc9b00);
  static const Color secondaryColor = Color(0xff0268CF);
  static const Color colorRed = Color(0xfffe6d73);
  static const Color scaffoldColor = Color(0xffF8F8F8);
  static const Color titleColor = Color(0xff1B4774);
  static const Color titleColor2 = Color(0xff6247aa);


 static String BASE = 'https://beta.poss.app/api/';
 static Uri INTRO = Uri.parse('${BASE}intro');
 static Uri COUNTRIES = Uri.parse(BASE +'country/cities');
 static Uri CITIES = Uri.parse(BASE +'city/byCountry/');
 static Uri AREAS = Uri.parse(BASE +'area/byCity/');
 static Uri SALONINFO = Uri.parse(BASE +'provider');
 static Uri CATEGORIES = Uri.parse(BASE +'categories/all_with_services');
 static Uri STORESERVICES = Uri.parse(BASE +'provider/services');







}