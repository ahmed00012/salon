class CategoriesModel{
  int ?id;
  String ?name;
  bool? choose;
  bool? inHome;
  bool? inSalon;
  double? price;
  int? duration;
 List<CategoriesModel>? subcategory;
CategoriesModel({this.id,this.name,this.subcategory,this.choose,
  this.inHome,this.inSalon,this.price,this.duration});
}