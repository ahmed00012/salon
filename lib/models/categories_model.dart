class CategoriesModel{
  int ?id;
  String ?name;
  bool? choose;
 List<CategoriesModel>? subcategory;
CategoriesModel({this.id,this.name,this.subcategory,this.choose});
}