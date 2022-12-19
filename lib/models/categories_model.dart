

class CategoriesModel {
  String? id;
  Title? title;
  int? isActive;

  int? order;
  int? type;
  String? createdAt;
  String? updatedAt;
  int? categoryId;
  List<Services>? services;
  bool? choose ;

  CategoriesModel(
      {this.id,
        this.title,
        this.isActive,

        this.order,
        this.type,
        this.createdAt,
        this.updatedAt,
        this.categoryId,
        this.services,
      this.choose});

  CategoriesModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'] != null ? new Title.fromJson(json['title']) : null;
    isActive = json['is_active'];

    order = json['order'];
    type = json['type'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    categoryId = json['category_id'];
    if (json['services'] != null) {
      services = <Services>[];
      json['services'].forEach((v) {
        services!.add(new Services.fromJson(v));
      });
      choose = false;
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    if (this.title != null) {
      data['title'] = this.title!.toJson();
    }
    data['is_active'] = this.isActive;

    data['order'] = this.order;
    data['type'] = this.type;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['category_id'] = this.categoryId;
    if (this.services != null) {
      data['services'] = this.services!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Title {
  String? en;
  String? ar;

  Title({this.en, this.ar});

  Title.fromJson(Map<String, dynamic> json) {
    en = json['en'];
    ar = json['ar'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['en'] = this.en;
    data['ar'] = this.ar;
    return data;
  }
}

class Services {
  String? id;
  Title? title;
  int? isActive;
  int? order;
  int? priceFrom;
  int? priceTo;
  String? categoryId;
  int? type;
  String? createdAt;
  String? updatedAt;
  bool? choose ;

  Services(
      {this.id,
        this.title,
        this.isActive,
        this.order,
        this.priceFrom,
        this.priceTo,
        this.categoryId,
        this.type,
        this.createdAt,
        this.updatedAt,
      this.choose});

  Services.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'] != null ? new Title.fromJson(json['title']) : null;
    isActive = json['is_active'];
    order = json['order'];
    priceFrom = json['price_from'];
    priceTo = json['price_to'];
    categoryId = json['category_id'];
    type = json['type'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    choose = false;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    if (this.title != null) {
      data['title'] = this.title!.toJson();
    }
    data['is_active'] = this.isActive;
    data['order'] = this.order;
    data['price_from'] = this.priceFrom;
    data['price_to'] = this.priceTo;
    data['category_id'] = this.categoryId;
    data['type'] = this.type;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
