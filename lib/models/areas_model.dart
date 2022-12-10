

class Area {
  int? id;
  Title? title;
  double? lat;
  double? lng;
  int? isActive;
  int? cityId;
  String? createdAt;
  String? updatedAt;

  Area(
      {this.id,
        this.title,
        this.lat,
        this.lng,
        this.isActive,
        this.cityId,
        this.createdAt,
        this.updatedAt});

  Area.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'] != null ? new Title.fromJson(json['title']) : null;
    lat = json['lat'];
    lng = json['lng'];
    isActive = json['is_active'];
    cityId = json['city_id'];
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
    data['city_id'] = this.cityId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
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
