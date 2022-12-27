import 'dart:convert';

import 'package:beauty_center/constants.dart';
import 'package:beauty_center/local_storage.dart';
import 'package:beauty_center/models/employee_model.dart';
import 'package:http/http.dart' as http;
import 'package:async/async.dart';
import 'package:path/path.dart';
import 'dart:async';


abstract class OrdersRepository{

  Future getOrders();

}


class OrdersRepo extends OrdersRepository{




  @override
  Future getOrders() async{
    print(LocalStorage.getData(key: 'token').toString()+'dknjkcdj');
    var response = await http.get(Constants.PROVIDERSERVICES,
        headers: {
          'Authorization':LocalStorage.getData(key: 'token'),
        });

    print(response.body);

    if(response.statusCode==200){
      var data =json.decode(response.body);
      return data['data'];
    }
    else return false;
  }

}