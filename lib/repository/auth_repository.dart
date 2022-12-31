
import 'dart:convert';

import 'package:beauty_center/constants.dart';
import 'package:beauty_center/local_storage.dart';
import 'package:http/http.dart' as http;

abstract class AuthRepository{
  Future login(Map userData);

}

class AuthRepo extends AuthRepository{

  @override
  Future login(Map userData)async{

    var response = await http.post(Constants.LOGIN,
    body: userData);

    if(response.statusCode==200){
      var data =json.decode(response.body);
      LocalStorage.saveData(key: 'token', value: 'Bearer ${data['data']['access_token']}');
      LocalStorage.saveData(key: 'titleEn', value: data['data']['provider']['title']['en']);
      LocalStorage.saveData(key: 'titleAr', value: data['data']['provider']['title']['ar']);
      LocalStorage.saveData(key: 'phone', value: data['data']['provider']['phone']);
      return data['data'];
    }
    else {
      return false;
    }

  }

}