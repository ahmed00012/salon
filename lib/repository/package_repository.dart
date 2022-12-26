import 'dart:convert';

import 'package:beauty_center/constants.dart';
import 'package:beauty_center/local_storage.dart';
import 'package:beauty_center/models/employee_model.dart';
import 'package:http/http.dart' as http;
import 'package:async/async.dart';
import 'package:path/path.dart';
import 'dart:async';

import '../models/packages_model.dart';


abstract class PackageRepository{

  Future storePackage(PackagesModel package);
  Future getServices();
  Future getRules();
  Future storeRules(List<String> rules);
}


class PackageRepo extends PackageRepository{


  @override
  Future storePackage(PackagesModel package) async {

    var multipartFileImg;
    var streamImg;
    var lengthImg;


    http.MultipartRequest request = new http.MultipartRequest('POST', Constants.STOREPACKAGE);

    request.fields['title_ar'] = package.titleAr.toString();
    request.fields['title_en'] =  package.titleEn.toString();
    request.fields['price'] = package.price.toString();
    request.fields['new_price'] = package.newPrice.toString();
    request.fields['is_bride'] = package.isPride!?'1':'0';
    for(int i = 0; i < package.services!.length; i++){
      request.fields['service_ids[$i]'] = '${package.services![i]}';
    }
    request.fields['date_from'] = package.from.toString();
    request.fields['date_to'] = package.to.toString();
    request.fields['type'] = LocalStorage.getData(key: 'gender')=='man'?'1':'2';
    request.fields['description_ar'] = package.descriptionAr.toString();
    request.fields['description_en'] = package.descriptionEn.toString();
    request.headers["Authorization"] =LocalStorage.getData(key: 'token');
    request.headers["Accept"] ='application/json';
    request.headers["Content-Type"] ='application/json';


    if (package.image != null) {

      streamImg =
      new http.ByteStream(DelegatingStream.typed(package.image!.openRead()));
      lengthImg = await package.image!.length();
      multipartFileImg = new http.MultipartFile('image', streamImg , lengthImg ,
          filename: basename(package.image!.path));
      request.files.add(multipartFileImg);
    }

    var response = await request.send();
    http.Response response2 = await http.Response.fromStream(response);
    print("Result: ${response2.statusCode}");
    if (response.statusCode == 200) {
      var data = json.decode(response2.body);
      return data['data'];
    } else {

      return false;

    }



  }

  @override
  Future getServices() async{
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

  @override
  Future getRules() async{
    var response = await http.get(Constants.GETROLES,
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


  @override
  Future storeRules(List<String> rules) async {
    http.MultipartRequest request = new http.MultipartRequest('POST', Constants.STOREROLES);

    for(int i = 0; i < rules.length; i++){
      request.fields['features[$i]'] = rules[i];
    }

    request.headers["Authorization"] =LocalStorage.getData(key: 'token');
    request.headers["Accept"] ='application/json';
    request.headers["Content-Type"] ='application/json';
    var response = await request.send();
    http.Response response2 = await http.Response.fromStream(response);
    print("Result: ${response2.statusCode}");
    if (response.statusCode == 200) {
      var data = json.decode(response2.body);
      return data['data'];
    } else {

      return false;

    }



  }


}