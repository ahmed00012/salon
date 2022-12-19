import 'dart:io';

import 'package:beauty_center/models/reservation_model.dart';
import 'package:flutter/material.dart';

import 'categories0_model.dart';
import 'employee_time.dart';

class EmployeeModel{
  String? name;
  String? phone;
  String? image;
  File? photo;
  TimeOfDay? availableFrom;
  TimeOfDay? availableTo;
  List<String>? workImages;
  bool ?canWorkInHome;
  List<CategoriesModel0>? categories;
  List<String> ?holidays;
  List<ReservationModel>? reservations;
  List<EmployeeTime>? times;


  EmployeeModel({this.name,this.phone,this.availableTo,this.availableFrom,
  this.categories,this.canWorkInHome,this.holidays,this.photo,this.workImages,this.reservations,
    this.image,this.times});
}