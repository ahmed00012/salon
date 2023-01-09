

import 'dart:io';

import 'categories_model.dart';

class ProviderInfoUpdateModel {
  String? id;
  TitleModel? title;
  TitleModel? description;
  String? phone;
  String? type;
  String? phone2;
  String? countryId;
  String? cityId;
  String? areaId;
  String? streetName;
  String? lat;
  String? lng;
  String? startExperience;

  File? image;
  File? certification;
  File? licence;
  List<String> ?holidays;
  String ?open;
  String ?close;



  ProviderInfoUpdateModel(
      {this.id,
        this.title,
        this.description,
        this.phone,
        this.type,
        this.phone2,
        this.countryId,
        this.cityId,
        this.areaId,
        this.streetName,
        this.lat,
        this.lng,
        this.startExperience,
   this.holidays,
      this.image,
      this.open,
      this.close,
      this.certification,
      this.licence});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title_ar'] = this.title!.ar;
    data['title_en'] = this.title!.en;
    data['description_ar'] = this.description!.ar;
    data['description_en'] = this.description!.en;
    data['phone'] = this.phone;
    data['type'] = this.type;
    data['phone2'] = this.phone2;
    data['country_id'] = this.countryId;
    data['city_id'] = this.cityId;
    data['area_id'] = this.areaId;
    data['street_name'] = this.streetName;
    data['lat'] = this.lat;
    data['lng'] = this.lng;
    data['start_experience'] = this.startExperience;
    data['image'] = this.image;
    data['holidays'] = this.holidays;
    data['open_at'] = this.open;
    data['close_at'] = this.close;
    data['license_image'] = this.licence;
    data['certificate_image'] = this.certification;

    return data;
  }
}