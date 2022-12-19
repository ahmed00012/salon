import 'categories0_model.dart';

class PackagesModel{

  String? title;
  String? price;
  List<CategoriesModel0> ?services;
  List<CategoriesModel0>? freeCategory;
  String? saved;
  bool? saveByMoney;
  bool? extraService;
  PackagesModel({this.title,this.price,this.freeCategory,this.saved,this.services,this.extraService});
}