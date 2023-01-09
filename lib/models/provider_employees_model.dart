



import 'categories_model.dart';

class ProviderEmployeesModel {
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
  List<Services> ?servicesModel;

  ProviderEmployeesModel(
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
        this.updatedAt,
      this.servicesModel});

  ProviderEmployeesModel.fromJson(Map<String, dynamic> json) {
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


