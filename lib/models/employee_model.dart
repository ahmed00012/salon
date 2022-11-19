import 'dart:io';

import 'package:flutter/material.dart';

import 'categories_model.dart';

class EmployeeModel{
  String? name;
  String? phone;
  File? photo;
  TimeOfDay? availableFrom;
  TimeOfDay? availableTo;
  List<String>? workImages;
  bool ?canWorkInHome;
  List<CategoriesModel>? categories;
  List<String> ?holidays;

  EmployeeModel({this.name,this.phone,this.availableTo,this.availableFrom,
  this.categories,this.canWorkInHome,this.holidays,this.photo,this.workImages});
}