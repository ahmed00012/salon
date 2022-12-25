import 'dart:convert';

import 'package:beauty_center/constants.dart';
import 'package:beauty_center/local_storage.dart';
import 'package:beauty_center/models/employee_model.dart';
import 'package:http/http.dart' as http;
import 'package:async/async.dart';
import 'package:path/path.dart';
import 'dart:async';


abstract class EmployeeRepository{

  Future storeEmployee(EmployeeModel employee);
  Future getServices();

}


class EmployeeRepo extends EmployeeRepository{


  @override
  Future storeEmployee(EmployeeModel employee) async {

    var multipartFileImg;
    var streamImg;
    var lengthImg;

    print(employee.name.toString()+'slsllsa');
    print(employee.phone.toString()+'slsllsa');
    print(employee.photo.toString()+'slsllsa');
    print(employee.holidays.toString().replaceAll('[', '').replaceAll(']', '')+'slsllsa');
    print(employee.services.toString()+'slsllsa');
    print(employee.availableFrom.toString().substring(10,15)+'slsllsa');
    print(employee.availableTo.toString()+'slsllsa');
    print(employee.workOut.toString()+'slsllsa');

    http.MultipartRequest request = new http.MultipartRequest('POST', Constants.STOREEMPLOYEE);

    request.fields['name'] = employee.name.toString();
    request.fields['phone'] =  employee.phone.toString();
    request.fields['work_from'] = employee.availableFrom.toString().substring(10,15);
    request.fields['work_to'] = employee.availableTo.toString().substring(10,15);
    request.fields['holidays'] = employee.holidays.toString().replaceAll('[', '').replaceAll(']', '');
     request.fields['service_ids'] = employee.services.toString();
    for (String item in employee.services!) {
      request.files.add(http.MultipartFile.fromString('service_ids', item));
    }
    request.fields['work_out'] = employee.workOut!?'1':'0';
    request.headers["Authorization"] =LocalStorage.getData(key: 'token');
    request.headers["Accept"] ='application/json';

    if (employee.photo != null) {

      streamImg =
      new http.ByteStream(DelegatingStream.typed(employee.photo!.openRead()));
      lengthImg = await employee.photo!.length();
      multipartFileImg = new http.MultipartFile('image', streamImg , lengthImg ,
          filename: basename(employee.photo!.path));
      request.files.add(multipartFileImg);
    }


    if(employee.workImages!=null)
    {
      List<http.MultipartFile> newList = [];

      for (int i = 0; i < employee.workImages!.length; i++) {
        var stream = new http.ByteStream(employee.workImages![i].openRead());
        var length = await employee.workImages![i].length();

        var multipartFile = new http.MultipartFile("work_images", stream, length,
            filename: basename(employee.workImages![i].path));
        newList.add(multipartFile);
      }

      request.files.addAll(newList);
    }

    var response = await request.send();
    http.Response response2 = await http.Response.fromStream(response);
    print("Result: ${response2.statusCode}");
    print("Result: ${response2.body}");
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