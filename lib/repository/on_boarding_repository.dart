import 'dart:convert';

import 'package:http/http.dart' as http;

import '../constants.dart';

abstract class OnBoardingRepository {
  Future getIntro({int? gender});
}

class OnBoardingRepo extends OnBoardingRepository{


  @override
  Future getIntro({int? gender}) async{
    Uri uri = gender==null?
        Constants.INTRO: Uri.parse('${Constants.INTRO}?type=$gender');

    var response = await http.get(uri);
    if(response.statusCode==200){
      var data = json.decode(response.body);
      return data['data'];
    }
    else{
      return false;
    }
  }

}