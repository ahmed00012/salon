
import 'dart:convert';

import 'package:beauty_center/constants.dart';
import 'package:http/http.dart' as http;

abstract class SalonInfoRepository{
  Future getCountries();
  Future getCities(int country);
  Future getAreas(int city);
}

class SalonInfoRepo extends SalonInfoRepository{
  @override
  Future getAreas(int city) async{
    Uri uri = Uri.parse('${Constants.AREAS}$city');
    var response = await http.get(uri);
    if(response.statusCode==200){
      var data = json.decode(response.body);
      return data['data'];
    }
    else{
      return false;
    }
  }

  @override
  Future getCities(int country) async{
    Uri uri = Uri.parse('${Constants.CITIES}$country');
    var response = await http.get(uri);
    if(response.statusCode==200){
      var data = json.decode(response.body);
      return data['data'];
    }
    else{
      return false;
    }
  }

  @override
  Future getCountries() async{

    var response = await http.get(Constants.COUNTRIES);
    if(response.statusCode==200){
      var data = json.decode(response.body);
      return data['data'];
    }
    else{
      return false;
    }
  }

}