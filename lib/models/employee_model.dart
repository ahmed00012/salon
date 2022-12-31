import 'dart:io';

import 'package:beauty_center/models/order_model.dart';

import 'package:flutter/material.dart';

import 'categories0_model.dart';
import 'categories_model.dart';
import 'employee_time.dart';

class EmployeeModel{
  String? name;
  String? phone;
  String? image;
  File? photo;
  TimeOfDay? availableFrom;
  TimeOfDay? availableTo;
  List<File>? workImages;
  bool ?canWorkInHome;
  List<CategoriesModel0>? categories;
  List<String> ? services;
  List<String> ?holidays;
  List<OrderModel>? orders;
  List<EmployeeTime>? times;
  bool? workOut;
  int? imageLength;
  List<Services> ?servicesModel;
  bool? stored;


  EmployeeModel({this.name,this.phone,this.availableTo,this.availableFrom,
  this.categories,this.canWorkInHome,this.holidays,this.photo,this.workImages,this.orders,
    this.image,this.times,this.services,this.workOut,this.imageLength,this.servicesModel,this.stored});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    data['name'] = this.name;
    data['phone'] = this.phone;
    data['work_from'] = this.availableFrom.toString().substring(10,15);
    data['work_to'] = this.availableTo.toString().substring(10,15);
    data['holidays'] = this.holidays;
    data['service_ids'] = this.services;
    data['work_images'] = this.workImages;
    data['work_out'] = this.workOut!?0:1;
    return data;
  }
}