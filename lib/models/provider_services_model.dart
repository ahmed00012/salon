

class ProviderServicesModel {
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
  Pivot? pivot;

  ProviderServicesModel(
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
        this.pivot});

  ProviderServicesModel.fromJson(Map<String, dynamic> json) {
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
    pivot = json['pivot'] != null ? new Pivot.fromJson(json['pivot']) : null;
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
    if (this.pivot != null) {
      data['pivot'] = this.pivot!.toJson();
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

class Pivot {
  String? providerId;
  String? serviceId;
  int? priceFrom;
  int? priceTo;
  int? duration;

  Pivot(
      {this.providerId,
        this.serviceId,
        this.priceFrom,
        this.priceTo,
        this.duration});

  Pivot.fromJson(Map<String, dynamic> json) {
    providerId = json['provider_id'];
    serviceId = json['service_id'];
    priceFrom = json['price_from'];
    priceTo = json['price_to'];
    duration = json['duration'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['provider_id'] = this.providerId;
    data['service_id'] = this.serviceId;
    data['price_from'] = this.priceFrom;
    data['price_to'] = this.priceTo;
    data['duration'] = this.duration;
    return data;
  }
}
