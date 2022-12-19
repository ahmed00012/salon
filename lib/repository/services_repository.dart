import 'dart:convert';

import 'package:beauty_center/constants.dart';
import 'package:http/http.dart' as http;

abstract class ServicesRepository{
  Future getCategories();
  
}


class ServicesRepo extends ServicesRepository{

  @override
  Future getCategories() async{
  var response = await http.get(Constants.CATEGORIES);

  if(response.statusCode==200){
    var data =json.decode(response.body);
    return data['data'];
  }
  else return false;
  }
  
}