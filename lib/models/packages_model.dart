import 'dart:io';
import 'categories_model.dart';

class PackagesModel{

  String? titleAr;
  String? titleEn;
  String? descriptionAr;
  String? descriptionEn;
  String? price;
  String? newPrice;
  File? image;
  bool? isPride;
  bool? nonPride;
  String? from;
  String? to;
  int? type;
  List<String> ? services;
  List<Services> ?servicesModel;

  bool? saved;

  PackagesModel({this.titleEn,this.type,this.services,this.from,this.servicesModel,this.descriptionEn,
  this.descriptionAr,this.titleAr,this.image,this.saved,this.price,this.isPride,this.newPrice,this.to,
  this.nonPride});
}