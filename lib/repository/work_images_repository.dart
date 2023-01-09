import 'dart:convert';
import 'dart:io';

import 'package:beauty_center/constants.dart';
import 'package:beauty_center/local_storage.dart';
import 'package:http/http.dart' as http;
import 'package:async/async.dart';
import 'package:path/path.dart';
import 'dart:async';


abstract class WorkImagesRepository{
  Future getWorkImages();
  Future storeWorkImages(List<File> images);

}


class WorkImagesRepo extends WorkImagesRepository{

  @override
  Future getWorkImages() async{
    var response = await http.get(Constants.GetWORKINGIMAGES,
    headers: {
      'Authorization':LocalStorage.getData(key: 'token')
    });

    if(response.statusCode==200){
      var data =json.decode(response.body);
      return data['data'];
    }
    else return false;
  }

  @override
  Future storeWorkImages(List<File> images) async {
    http.MultipartRequest request =  http.MultipartRequest('POST', Constants.UPDATEWORKINGIMAGES);
      List<http.MultipartFile> newList = [];
      for (int i = 0; i < images.length; i++) {
        var stream =  http.ByteStream(images[i].openRead());
        var length = await images[i].length();

        var multipartFile =  http.MultipartFile("work_images", stream, length,
            filename: basename(images[i].path));
        newList.add(multipartFile);
      }

      request.files.addAll(newList);
    request.headers["Authorization"]=LocalStorage.getData(key: 'token');
    request.headers["Accept"]='application/json';

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
}