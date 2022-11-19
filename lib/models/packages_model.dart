import 'categories_model.dart';

class PackagesModel{

  String? title;
  String? price;
  List<CategoriesModel> ?services;
  List<CategoriesModel>? freeCategory;
  String? saved;
  bool? saveByMoney;
  bool? extraService;
  PackagesModel({this.title,this.price,this.freeCategory,this.saved,this.services,this.extraService});
}