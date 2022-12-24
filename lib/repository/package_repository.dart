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

}


class PackageRepo extends PackageRepository{


  @override
  Future storePackage(PackagesModel package) async {

    var multipartFileImg;
    var streamImg;
    var lengthImg;


    http.MultipartRequest request = new http.MultipartRequest('POST', Constants.STOREPACKAGE);




    // if (package.image != null) {
    //
    //   streamImg =
    //   new http.ByteStream(DelegatingStream.typed(employee.photo!.openRead()));
    //   lengthImg = await employee.photo!.length();
    //   multipartFileImg = new http.MultipartFile('image', streamImg , lengthImg ,
    //       filename: basename(employee.photo!.path));
    //   request.files.add(multipartFileImg);
    // }

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

}