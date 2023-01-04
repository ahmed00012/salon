

class ProviderInfoModel {
  String? id;
  Title? title;
  Title? description;
  String? phone;
  int? type;
  String? phone2;
  String? image;
  String? licenseImage;
  String? certificateImage;
  int? countryId;
  int? cityId;
  int? areaId;
  String? streetName;
  String? lat;
  String? lng;
  String? startExperience;
  String? holidays;
  String? openAt;
  String? closeAt;
  int? isActive;
  String? createdAt;
  String? updatedAt;
  int? rate;
  int? inFavourite;
  List<Employees>? employees;

  ProviderInfoModel(
      {this.id,
        this.title,
        this.description,
        this.phone,
        this.type,
        this.phone2,
        this.image,
        this.licenseImage,
        this.certificateImage,
        this.countryId,
        this.cityId,
        this.areaId,
        this.streetName,
        this.lat,
        this.lng,
        this.startExperience,
        this.holidays,
        this.openAt,
        this.closeAt,
        this.isActive,
        this.createdAt,
        this.updatedAt,
        this.rate,
        this.inFavourite,
        this.employees});

  ProviderInfoModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'] != null ? new Title.fromJson(json['title']) : null;
    description = json['description'] != null
        ? new Title.fromJson(json['description'])
        : null;
    phone = json['phone'];
    type = json['type'];
    phone2 = json['phone2'];
    image = json['image'];
    licenseImage = json['license_image'];
    certificateImage = json['certificate_image'];
    countryId = json['country_id'];
    cityId = json['city_id'];
    areaId = json['area_id'];
    streetName = json['street_name'];
    lat = json['lat'];
    lng = json['lng'];
    startExperience = json['start_experience'];
    holidays = json['holidays'];
    openAt = json['open_at'];
    closeAt = json['close_at'];
    isActive = json['is_active'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    rate = json['rate'];
    inFavourite = json['in_favourite'];
    if (json['employees'] != null) {
      employees = <Employees>[];
      json['employees'].forEach((v) {
        employees!.add(new Employees.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    if (this.title != null) {
      data['title'] = this.title!.toJson();
    }
    if (this.description != null) {
      data['description'] = this.description!.toJson();
    }
    data['phone'] = this.phone;
    data['type'] = this.type;
    data['phone2'] = this.phone2;
    data['image'] = this.image;
    data['license_image'] = this.licenseImage;
    data['certificate_image'] = this.certificateImage;
    data['country_id'] = this.countryId;
    data['city_id'] = this.cityId;
    data['area_id'] = this.areaId;
    data['street_name'] = this.streetName;
    data['lat'] = this.lat;
    data['lng'] = this.lng;
    data['start_experience'] = this.startExperience;
    data['holidays'] = this.holidays;
    data['open_at'] = this.openAt;
    data['close_at'] = this.closeAt;
    data['is_active'] = this.isActive;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['rate'] = this.rate;
    data['in_favourite'] = this.inFavourite;
    if (this.employees != null) {
      data['employees'] = this.employees!.map((v) => v.toJson()).toList();
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

class Employees {
  String? id;
  String? name;
  String? phone;
  String? providerId;
  String? image;
  String? workFrom;
  String? workTo;
  String? holidays;
  int? workOut;
  int? isActive;
  String? createdAt;
  String? updatedAt;

  Employees(
      {this.id,
        this.name,
        this.phone,
        this.providerId,
        this.image,
        this.workFrom,
        this.workTo,
        this.holidays,
        this.workOut,
        this.isActive,
        this.createdAt,
        this.updatedAt});

  Employees.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    phone = json['phone'];
    providerId = json['provider_id'];
    image = json['image'];
    workFrom = json['work_from'];
    workTo = json['work_to'];
    holidays = json['holidays'];
    workOut = json['work_out'];
    isActive = json['is_active'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['phone'] = this.phone;
    data['provider_id'] = this.providerId;
    data['image'] = this.image;
    data['work_from'] = this.workFrom;
    data['work_to'] = this.workTo;
    data['holidays'] = this.holidays;
    data['work_out'] = this.workOut;
    data['is_active'] = this.isActive;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
