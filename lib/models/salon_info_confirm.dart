import 'dart:io';

class SalonInfoRegistration{
  String ?titleAr;
  String ?titleEn;
  String ?phone;
  String ?anotherPhone;
  String ?password;
  File? logoImg;
  int? countryId;
  int? cityId;
  int? areaId;
  String? street;
  double? lat;
  double? lng;
  String? descriptionAr;
  String? descriptionEn;
  String? startExperience;
  List<String> ? holidays;
  String? openAt;
  String? closeAt;
  File? licenseImage;
  File? certificateImage;
  List<File> ?workImages;
  int? type;
  SalonInfoRegistration({this.password,this.phone,this.holidays,this.workImages,
  this.anotherPhone,this.areaId,this.certificateImage,this.cityId,
  this.closeAt,this.countryId,this.descriptionAr,this.descriptionEn,this.lat,this.licenseImage,
  this.lng,this.logoImg,this.openAt,this.startExperience,this.street,this.titleAr,this.titleEn,this.type});




}