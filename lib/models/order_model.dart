

class OrderModel {
  String? id;
  int? subtotal;
  int? discount;
  String? discountType;
  int? status;
  int? tax;
  int? total;
  int? quantity;
  String? notes;
  int? place;
  String? reservationDate;
  String? startAt;
  int? duration;
  int? clientId;
  String? providerId;
  String? addressId;
  String? createdAt;
  String? updatedAt;
  String? couponId;
  int? uuid;
  List<Details>? details;
  Client? client;

  OrderModel(
      {this.id,
        this.subtotal,
        this.discount,
        this.discountType,
        this.status,
        this.tax,
        this.total,
        this.quantity,
        this.notes,
        this.place,
        this.reservationDate,
        this.startAt,
        this.duration,
        this.clientId,
        this.providerId,
        this.addressId,
        this.createdAt,
        this.updatedAt,
        this.couponId,
        this.uuid,
        this.details,
        this.client});

  OrderModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    subtotal = json['subtotal'];
    discount = json['discount'];
    discountType = json['discount_type'];
    status = json['status'];
    tax = json['tax'];
    total = json['total'];
    quantity = json['quantity'];
    notes = json['notes'];
    place = json['place'];
    reservationDate = json['reservation_date'];
    startAt = json['start_at'];
    duration = json['duration'];
    clientId = json['client_id'];
    providerId = json['provider_id'];
    addressId = json['address_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    couponId = json['coupon_id'];
    uuid = json['uuid'];
    if (json['details'] != null) {
      details = <Details>[];
      json['details'].forEach((v) {
        details!.add(new Details.fromJson(v));
      });
    }
    client =
    json['client'] != null ? new Client.fromJson(json['client']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['subtotal'] = this.subtotal;
    data['discount'] = this.discount;
    data['discount_type'] = this.discountType;
    data['status'] = this.status;
    data['tax'] = this.tax;
    data['total'] = this.total;
    data['quantity'] = this.quantity;
    data['notes'] = this.notes;
    data['place'] = this.place;
    data['reservation_date'] = this.reservationDate;
    data['start_at'] = this.startAt;
    data['duration'] = this.duration;
    data['client_id'] = this.clientId;
    data['provider_id'] = this.providerId;
    data['address_id'] = this.addressId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['coupon_id'] = this.couponId;
    data['uuid'] = this.uuid;
    if (this.details != null) {
      data['details'] = this.details!.map((v) => v.toJson()).toList();
    }
    if (this.client != null) {
      data['client'] = this.client!.toJson();
    }
    return data;
  }
}

class Details {
  String? id;
  int? total;
  int? price;
  int? quantity;
  String? note;
  String? startAt;
  String? orderId;
  String? employeeId;
  String? itemableType;
  String? itemableId;
  String? endAt;
  Itemable? itemable;
  Employee? employee;

  Details(
      {this.id,
        this.total,
        this.price,
        this.quantity,
        this.note,
        this.startAt,
        this.orderId,
        this.employeeId,
        this.itemableType,
        this.itemableId,
        this.endAt,
        this.itemable,
        this.employee});

  Details.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    total = json['total'];
    price = json['price'];
    quantity = json['quantity'];
    note = json['note'];
    startAt = json['start_at'];
    orderId = json['order_id'];
    employeeId = json['employee_id'];
    itemableType = json['itemable_type'];
    itemableId = json['itemable_id'];
    endAt = json['end_at'];
    itemable = json['itemable'] != null
        ? new Itemable.fromJson(json['itemable'])
        : null;
    employee = json['employee'] != null
        ? new Employee.fromJson(json['employee'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['total'] = this.total;
    data['price'] = this.price;
    data['quantity'] = this.quantity;
    data['note'] = this.note;
    data['start_at'] = this.startAt;
    data['order_id'] = this.orderId;
    data['employee_id'] = this.employeeId;
    data['itemable_type'] = this.itemableType;
    data['itemable_id'] = this.itemableId;
    data['end_at'] = this.endAt;
    if (this.itemable != null) {
      data['itemable'] = this.itemable!.toJson();
    }
    if (this.employee != null) {
      data['employee'] = this.employee!.toJson();
    }
    return data;
  }
}

class Itemable {
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

  Itemable(
      {this.id,
        this.title,
        this.isActive,
        this.order,
        this.priceFrom,
        this.priceTo,
        this.categoryId,
        this.type,
        this.createdAt,
        this.updatedAt});

  Itemable.fromJson(Map<String, dynamic> json) {
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

class Employee {
  String? id;
  String? name;

  Employee({this.id, this.name});

  Employee.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    return data;
  }
}

class Client {
  int? id;
  String? name;
  String? phone;
  Null? image;

  Client({this.id, this.name, this.phone, this.image});

  Client.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    phone = json['phone'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['phone'] = this.phone;
    data['image'] = this.image;
    return data;
  }
}
