

import 'categories_model.dart';

class Country {
  int? id;
  TitleModel? title;
  int? order;
  int? isActive;
  String? createdAt;
  String? updatedAt;
  List<Cities>? cities;

  Country(
      {this.id,
        this.title,
        this.order,
        this.isActive,
        this.createdAt,
        this.updatedAt,
        this.cities});

  Country.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'] != null ? new TitleModel.fromJson(json['title']) : null;
    order = json['order'];
    isActive = json['is_active'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    if (json['cities'] != null) {
      cities = <Cities>[];
      json['cities'].forEach((v) {
        cities!.add(new Cities.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    if (this.title != null) {
      data['title'] = this.title!.toJson();
    }
    data['order'] = this.order;
    data['is_active'] = this.isActive;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.cities != null) {
      data['cities'] = this.cities!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}



class Cities {
  int? id;
  TitleModel? title;
  String? lat;
  String? lng;
  int? isActive;
  int? countryId;
  String? createdAt;
  String? updatedAt;

  Cities(
      {this.id,
        this.title,
        this.lat,
        this.lng,
        this.isActive,
        this.countryId,
        this.createdAt,
        this.updatedAt});

  Cities.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'] != null ? new TitleModel.fromJson(json['title']) : null;
    lat = json['lat'];
    lng = json['lng'];
    isActive = json['is_active'];
    countryId = json['country_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    if (this.title != null) {
      data['title'] = this.title!.toJson();
    }
    data['lat'] = this.lat;
    data['lng'] = this.lng;
    data['is_active'] = this.isActive;
    data['country_id'] = this.countryId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
