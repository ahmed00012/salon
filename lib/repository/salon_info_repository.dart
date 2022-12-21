
import 'dart:convert';
import 'dart:io';

import 'package:beauty_center/constants.dart';
import 'package:beauty_center/models/salon_info_confirm.dart';
import 'package:http/http.dart' as http;
import 'package:async/async.dart';
import 'package:path/path.dart';
import 'dart:async';


abstract class SalonInfoRepository{
  Future getCountries();
  Future getCities(int country);
  Future getAreas(int city);
  uploadImageToServer(SalonInfoRegistration salonInfo);
}

class SalonInfoRepo extends SalonInfoRepository{
  @override
  Future getAreas(int city) async{
    Uri uri = Uri.parse('${Constants.AREAS}$city');
    var response = await http.get(uri);
    if(response.statusCode==200){
      var data = json.decode(response.body);
      return data['data'];
    }
    else{
      return false;
    }
  }

  @override
  Future getCities(int country) async{
    Uri uri = Uri.parse('${Constants.CITIES}$country');
    var response = await http.get(uri);
    if(response.statusCode==200){
      var data = json.decode(response.body);
      return data['data'];
    }
    else{
      return false;
    }
  }

  @override
  Future getCountries() async{

    var response = await http.get(Constants.COUNTRIES);
    if(response.statusCode==200){
      var data = json.decode(response.body);
      return data['data'];
    }
    else{
      return false;
    }
  }

  @override
  Future uploadImageToServer(SalonInfoRegistration salonInfo) async {
    var multipartFileLicense;
    var streamLicense;
    var lengthLicense;
    var multipartFileCertification;
    var streamCertification;
    var lengthCertification;
    var multipartFileLogo;
    var streamLogo;
    var lengthLogo;


      http.MultipartRequest request = new http.MultipartRequest('POST', Constants.SALONINFO);
print(salonInfo.titleAr);
print(salonInfo.titleEn);
print(salonInfo.phone);
print(salonInfo.anotherPhone);
print(salonInfo.password);
print(salonInfo.countryId);
print(salonInfo.cityId);
print(salonInfo.holidays);
print(salonInfo.openAt);
print(salonInfo.type);
print(salonInfo.workImages);
print(salonInfo.licenseImage);
print(salonInfo.logoImg);
print(salonInfo.type);
      request.fields['title_ar'] = salonInfo.titleAr.toString();
      request.fields['title_en'] = salonInfo.titleEn.toString();
      request.fields['phone'] =  salonInfo.phone.toString();
      request.fields['phone2'] = salonInfo.anotherPhone.toString();
      request.fields['password'] = salonInfo.password.toString();
      request.fields['country_id'] = salonInfo.countryId.toString();
      request.fields['city_id'] = salonInfo.cityId.toString();
      request.fields['area_id'] = '1';
      request.fields['street_name'] =salonInfo.street.toString();
      request.fields['lat'] = salonInfo.lat.toString();
      request.fields['lng'] = salonInfo.lng.toString();
      request.fields['start_experience'] = '1998';
      request.fields['holidays'] = salonInfo.holidays.toString();
      request.fields['open_at'] = salonInfo.openAt.toString();
      request.fields['close_at'] = salonInfo.closeAt.toString();
      request.fields['description_ar'] = salonInfo.descriptionAr.toString();
      request.fields['description_en'] = salonInfo.descriptionEn.toString();
      request.fields['type'] = salonInfo.type.toString();


      if (salonInfo.logoImg != null) {

        streamLogo =
        new http.ByteStream(DelegatingStream.typed(salonInfo.logoImg!.openRead()));
        lengthLogo = await salonInfo.logoImg!.length();
        multipartFileLogo = new http.MultipartFile('image', streamLogo , lengthLogo ,
            filename: basename(salonInfo.logoImg!.path));
        request.files.add(multipartFileLogo);
      }
      if (salonInfo.certificateImage != null) {
        streamCertification =
        new http.ByteStream(DelegatingStream.typed(salonInfo.certificateImage!.openRead()));
        lengthCertification = await salonInfo.certificateImage!.length();
        multipartFileCertification = new http.MultipartFile('certificate_image', streamCertification, lengthCertification,
            filename: basename(salonInfo.certificateImage!.path));
        request.files.add(multipartFileCertification);
      }

      if (salonInfo.licenseImage != null) {
        streamLicense =
        new http.ByteStream(DelegatingStream.typed(salonInfo.licenseImage!.openRead()));
        lengthLicense = await salonInfo.licenseImage!.length();
        multipartFileLicense = new http.MultipartFile('license_image', streamLicense, lengthLicense,
            filename: basename(salonInfo.licenseImage!.path));
        request.files.add(multipartFileLicense);
      }

if(salonInfo.workImages!=null)
      {
        List<http.MultipartFile> newList = [];

        for (int i = 0; i < salonInfo.workImages!.length; i++) {
          var stream = new http.ByteStream(salonInfo.workImages![i].openRead());
          var length = await salonInfo.workImages![i].length();

          var multipartFile = new http.MultipartFile("work_images", stream, length,
              filename: basename(salonInfo.workImages![i].path));
          newList.add(multipartFile);
        }

        request.files.addAll(newList);
      }

      var response = await request.send();



    http.Response response2 = await http.Response.fromStream(response);
    print("Result: ${response2.statusCode}");



    // print(res.body.toString()+'slslksll') ;
    // print(res.statusCode.toString()+'slslksll') ;
      if (response.statusCode == 200) {
       var data = json.decode(response2.body);
       return data['data'];
      } else {

       return false;

      }



  }

}