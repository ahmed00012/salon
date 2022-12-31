import 'dart:convert';

import 'package:beauty_center/constants.dart';
import 'package:beauty_center/local_storage.dart';
import 'package:http/http.dart' as http;

import 'dart:async';


abstract class HomeRepository{
  Future getSchedule({String ?date});


}


class HomeRepo extends HomeRepository{

  @override
  Future getSchedule({String ?date}) async{

    date ??= DateTime.now().toString().substring(0, 10);
    Uri uri = Uri.parse('${Constants.SCHEDULE}?date=$date');

    var response = await http.get(uri,
        headers: {
          'Authorization':LocalStorage.getData(key: 'token'),
        });
      print(date.toString()+'alxnklnjd');
    print(response.body);

    if(response.statusCode==200){
      var data =json.decode(response.body);
      return data['data'];
    }
    else return false;
  }



}