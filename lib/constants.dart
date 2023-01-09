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
 static Uri STOREEMPLOYEE = Uri.parse(BASE +'employee');
 static Uri STOREPACKAGE = Uri.parse(BASE +'package');
 static Uri PROVIDERSERVICES = Uri.parse(BASE +'provider/services');
 static Uri GETROLES = Uri.parse(BASE +'features/all');
 static Uri STOREROLES = Uri.parse(BASE +'features/store');
 static Uri GETORDERS = Uri.parse(BASE +'provider/orders');
 static Uri SCHEDULE = Uri.parse(BASE +'getEmployeesAvailableTimes');
 static Uri LOGIN = Uri.parse(BASE +'auth/login');
 static Uri VERIFY = Uri.parse(BASE +'auth/verify');
 static Uri FORGETPASSWORD = Uri.parse(BASE +'auth/forgetPassword');
 static Uri POVIDERDATA = Uri.parse(BASE +'providerData');
 static Uri UPDATEPOVIDERDATA = Uri.parse(BASE +'provider/update');
 static Uri GetWORKINGIMAGES = Uri.parse(BASE +'provider/images');
 static Uri GetPROVIDERSERVICES = Uri.parse(BASE +'provider/services');
 static Uri UPDATEWORKINGIMAGES = Uri.parse(BASE +'provider/saveWorkImages');
 static Uri GETEMPLOYEES = Uri.parse(BASE +'provider/employees');







}