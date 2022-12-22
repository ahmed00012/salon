import 'dart:convert';

import 'package:beauty_center/constants.dart';
import 'package:beauty_center/local_storage.dart';
import 'package:http/http.dart' as http;

abstract class ServicesRepository{
  Future getCategories();
  Future storeServices(Map serviceJson);
  
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

  @override
  Future storeServices(Map serviceJson) async{
    print(serviceJson);
    var response = await http.post(Constants.STORESERVICES,
        body: jsonEncode(serviceJson),
    headers: {
      'Authorization':LocalStorage.getData(key: 'token'),
      'Accept':'application/json',
      'Content-type': 'application/json',
    });

    print(response.body);

    if(response.statusCode==200){
      var data =json.decode(response.body);
      return data['data'];
    }
    else return false;
  }
  
}